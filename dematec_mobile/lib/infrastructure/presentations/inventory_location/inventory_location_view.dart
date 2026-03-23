import 'package:dematec_mobile/core/enum/general/product_search_type_enum.dart';
import 'package:dematec_mobile/infrastructure/presentations/inventory_location/inventory_location_provider.dart';
import 'package:dematec_mobile/infrastructure/presentations/locations/widgets/location_search_card_widget.dart';
import 'package:dematec_mobile/infrastructure/presentations/shared/components/product_simple_card/product_simple_card_widget.dart';
import 'package:dematec_mobile/infrastructure/presentations/shared/components/search_banner/search_banner_widget.dart';
import 'package:dematec_mobile/infrastructure/presentations/shared/screens/generic_search_screen.dart';
import 'package:dematec_mobile/model/location_model.dart';
import 'package:dematec_mobile/model/product_model.dart';
import 'package:dematec_mobile/services/product_search/product_search_service.dart';
import 'package:dematec_mobile/services/warehouse_locations/warehouse_locations_service.dart';
import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class InventoryLocationView extends StatelessWidget {
  const InventoryLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InventoryLocationProvider>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Vincular Produto')),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: DematecUiButtonCustom(
                title: 'Confirmar Vinculação',
                iconLeft: PhosphorIconsRegular.link,
                type: DematecUiTypeButtonWidget.normal,
                colorType: DematecUiColorTypeWidget.success,
                size: DematecUiSizeWidget.large,
                disabled: !state.canLink || state.isLoading,
                loading: state.isLoading,
                onPressed: () async {
                  final success = await state.linkProductToLocation();

                  if (!context.mounted) return;

                  if (success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Produto vinculado com sucesso!'),
                        backgroundColor:
                            DematecUiColorsConstants.surfaceVariant500,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
              ),
            ),
          ),

          body: SingleChildScrollView(
            padding: UiPaddings.screen,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DematecUiLabelSmall(
                  text: 'Passo 1: Informe o local de armazenagem',
                  fontWeight: FontWeight.w600,
                  color: DematecUiColorsConstants.neutral600,
                ),
                const SizedBox(height: 8),

                // ===============================================
                // SEÇÃO 1: ENDEREÇO
                // ===============================================
                if (state.selectedLocation == null)
                  SearchBannerWidget(
                    title: 'Localizar Endereço',
                    subtitle: 'Clique para buscar por código ou rua/prateleira',
                    icon: PhosphorIconsRegular.mapPin,
                    onTap: () async {
                      final locationsService = context
                          .read<WarehouseLocationsService>();
                      final selectedLocation =
                          await Navigator.push<LocationModel>(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  GenericSearchScreen<LocationModel, String>(
                                    title: 'Buscar Endereço',
                                    searchHint: 'Informe o endereço...',
                                    filters: const [],
                                    initialFilter: '',
                                    onSearch:
                                        (query, selectedFilter, page) async {
                                          if (page > 1) return [];
                                          final result = await locationsService
                                              .searchLocations(query);
                                          return result.fold(
                                            (error) => throw error,
                                            (successData) => successData,
                                          );
                                        },
                                    itemBuilder: (context, location) {
                                      return LocationSearchCardWidget(
                                        location: location,
                                      );
                                    },
                                  ),
                            ),
                          );

                      if (selectedLocation != null) {
                        state.setLocation(selectedLocation);
                      }
                    },
                  )
                else
                  _buildSelectedItemCard(
                    title: 'Endereço Selecionado',
                    subtitle: state.selectedLocation!.locationName,
                    icon: PhosphorIconsRegular.mapPinLine,
                    onClear: () => state.clearLocation(),
                  ),

                const SizedBox(height: 32),

                const DematecUiLabelSmall(
                  text: 'Passo 2: Informe o produto',
                  fontWeight: FontWeight.w600,
                  color: DematecUiColorsConstants.neutral600,
                ),
                const SizedBox(height: 8),

                // ===============================================
                // SEÇÃO 2: PRODUTO
                // ===============================================
                if (state.selectedProduct == null)
                  SearchBannerWidget(
                    title: 'Localizar Produto',
                    subtitle:
                        'Clique para buscar por nome, código ou referência',
                    icon: PhosphorIconsRegular.boxArrowDown,
                    onTap: () async {
                      final searchService = context
                          .read<ProductSearchService>();
                      final selectedProduct =
                          await Navigator.push<ProductModel>(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  GenericSearchScreen<
                                    ProductModel,
                                    ProductSearchType
                                  >(
                                    title: 'Buscar Produto',
                                    searchHint:
                                        'Informe a descrição do produto...',
                                    filters: const [],
                                    initialFilter:
                                        ProductSearchType.description,
                                    onSearch:
                                        (query, selectedFilter, page) async {
                                          final result = await searchService
                                              .searchProduct(page, query);
                                          return result.fold(
                                            (error) => throw error,
                                            (successData) => successData.data,
                                          );
                                        },
                                    itemBuilder: (context, product) {
                                      return ProductSimpleCardWidget(
                                        product: product,
                                      );
                                    },
                                  ),
                            ),
                          );

                      if (selectedProduct != null) {
                        state.setProduct(selectedProduct);
                      }
                    },
                  )
                else
                  _buildSelectedItemCard(
                    title: 'Produto Selecionado',
                    subtitle:
                        '${state.selectedProduct!.idProduct} - ${state.selectedProduct!.productDescription}',
                    icon: PhosphorIconsRegular.package,
                    onClear: () => state.clearProduct(),
                  ),

                if (state.errorMessage.isNotEmpty)
                  _buildErrorAlert(state.errorMessage),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSelectedItemCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onClear,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // color: DematecUiColorsConstants.surfaceVariant100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: DematecUiColorsConstants.neutral400),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: DematecUiColorsConstants.surfaceVariant600,
            size: 28,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DematecUiLabelSmall(
                  text: title,
                  fontWeight: FontWeight.w600,
                  color: DematecUiColorsConstants.surfaceVariant700,
                ),
                const SizedBox(height: 2),
                DematecUiLabelMedium(
                  text: subtitle,
                  fontWeight: FontWeight.w700,
                  color: DematecUiColorsConstants.neutral800,
                ),
              ],
            ),
          ),

          IconButton(
            icon: const Icon(PhosphorIconsRegular.trash),
            color: DematecUiColorsConstants.error500,
            onPressed: onClear,
            tooltip: 'Remover seleção',
          ),
        ],
      ),
    );
  }
}

Widget _buildErrorAlert(String errorMessage) {
  return Container(
    margin: const EdgeInsets.only(top: 24),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: DematecUiColorsConstants.error50,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: DematecUiColorsConstants.error300),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          PhosphorIconsRegular.warningCircle,
          color: DematecUiColorsConstants.error600,
          size: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DematecUiLabelSmall(
                text: 'Falha na vinculação',
                fontWeight: FontWeight.w700,
                color: DematecUiColorsConstants.error700,
              ),
              const SizedBox(height: 4),
              DematecUiLabelSmall(
                text: errorMessage,
                color: DematecUiColorsConstants.error600,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
