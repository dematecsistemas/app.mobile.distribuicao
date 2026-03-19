import 'package:dematec_mobile/core/enum/general/status_screen_enum.dart';
import 'package:dematec_mobile/infrastructure/presentations/locations/widgets/location_search_card_widget.dart';
import 'package:dematec_mobile/infrastructure/presentations/shared/screens/generic_search_screen.dart';
import 'package:dematec_mobile/infrastructure/presentations/shared/components/search_banner/search_banner_widget.dart';
import 'package:dematec_mobile/infrastructure/presentations/locations/locations_provider.dart';
import 'package:dematec_mobile/infrastructure/presentations/locations/widgets/location_header_card_widget.dart';
import 'package:dematec_mobile/infrastructure/presentations/locations/widgets/product_stored_card_widget.dart';
import 'package:dematec_mobile/model/location_model.dart';
import 'package:dematec_mobile/services/warehouse_locations/warehouse_locations_service.dart';
import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class LocationsView extends StatefulWidget {
  const LocationsView({super.key});

  @override
  State<LocationsView> createState() => _LocationsViewState();
}

class _LocationsViewState extends State<LocationsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _openSearchScreen();
    });
  }

  Future<void> _openSearchScreen() async {
    final locationsService = context.read<WarehouseLocationsService>();
    final state = context.read<LocationsProvider>();

    final selectedLocation = await Navigator.push<LocationModel>(
      context,
      MaterialPageRoute(
        builder: (context) => GenericSearchScreen<LocationModel, String>(
          title: 'Buscar Endereço',
          searchHint: 'Informe o endereço...',
          filters: const [],
          initialFilter: '',
          onSearch: (query, selectedFilter, page) async {
            if (page > 1) return [];

            final result = await locationsService.searchLocations(query);

            return result.fold(
              (error) => throw error,
              (successData) => successData,
            );
          },
          itemBuilder: (context, location) {
            return LocationSearchCardWidget(location: location);
          },
        ),
      ),
    );

    if (selectedLocation != null) {
      state.loadProductsForLocation(selectedLocation.idLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationsProvider>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Consulta por Endereço')),
          body: Padding(
            padding: UiPaddings.screen,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.locations == null) ...[
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
                        state.loadProductsForLocation(
                          selectedLocation.idLocation,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                ],

                // Chamamos o método que contém o Switch aqui!
                _buildBodyContent(state),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBodyContent(LocationsProvider state) {
    switch (state.statusScreen) {
      case StatusScreenEnum.initial:
        // return Expanded(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Icon(
        //         PhosphorIconsRegular.mapTrifold,
        //         size: 48,
        //         color: DematecUiColorsConstants.neutral400,
        //       ),
        //       const SizedBox(height: 16),
        //       const DematecUiLabelMedium(
        //         text: 'Nenhum endereço selecionado',
        //         color: DematecUiColorsConstants.neutral600,
        //       ),
        //       const SizedBox(height: 8),
        //       const DematecUiLabelSmall(
        //         text:
        //             'Utilize o botão acima para pesquisar um endereço e visualizar os produtos armazenados nele.',
        //         textAlign: TextAlign.center,
        //         color: DematecUiColorsConstants.neutral500,
        //       ),
        //     ],
        //   ),
        // );
        return SizedBox.shrink();

      case StatusScreenEnum.loading:
        return const Expanded(
          child: Center(child: DematecUiCircularProgressIndicator()),
        );

      case StatusScreenEnum.error:
        //Pode adicionar aquela lógica de erro 404/500 usada na tela de productos_locations
        return Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                PhosphorIconsRegular.warningCircle,
                size: 48,
                color: DematecUiColorsConstants.error500,
              ),
              const SizedBox(height: 16),
              const DematecUiLabelMedium(
                text: 'Ops! Algo deu errado.',
                fontWeight: FontWeight.w700,
                color: DematecUiColorsConstants.neutral600,
              ),
              const SizedBox(height: 8),
              const DematecUiLabelSmall(
                text: 'Não foi possível buscar o endereço. Tente novamente.',
                textAlign: TextAlign.center,
                color: DematecUiColorsConstants.neutral500,
              ),
            ],
          ),
        );

      case StatusScreenEnum.success:
        if (state.locations == null) {
          return const Expanded(child: SizedBox.shrink());
        }

        return Expanded(
          child: ListView.builder(
            itemCount: state.locations!.storeProducts.isEmpty
                ? 2
                : state.locations!.storeProducts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    DematecUiButtonCustom(
                      title: 'Pesquisar outro Endereço',
                      iconLeft: PhosphorIconsRegular.magnifyingGlass,
                      type: DematecUiTypeButtonWidget.outline,
                      colorType: DematecUiColorTypeWidget.info,
                      size: DematecUiSizeWidget.large,
                      onPressed: () {
                        _openSearchScreen();
                        // state.clearSearch();
                      },
                    ),
                    const SizedBox(height: 16),
                    LocationHeaderCardWidget(location: state.locations!),
                    const SizedBox(height: 16),
                  ],
                );
              }

              if (state.locations!.storeProducts.isEmpty) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: DematecUiColorsConstants.neutral50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: DematecUiColorsConstants.neutral200,
                    ),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        PhosphorIconsRegular.package,
                        size: 40,
                        color: DematecUiColorsConstants.neutral400,
                      ),
                      const SizedBox(height: 12),
                      const DematecUiLabelMedium(
                        text: 'Endereço vazio',
                        fontWeight: FontWeight.w700,
                        color: DematecUiColorsConstants.neutral700,
                      ),
                      const SizedBox(height: 4),
                      const DematecUiLabelSmall(
                        text:
                            'Não há nenhum produto armazenado neste local no momento.',
                        textAlign: TextAlign.center,
                        color: DematecUiColorsConstants.neutral500,
                      ),
                    ],
                  ),
                );
              }

              final produto = state.locations!.storeProducts[index - 1];
              return ProductStoredCardWidget(product: produto);
            },
          ),
        );
    }
  }
}
