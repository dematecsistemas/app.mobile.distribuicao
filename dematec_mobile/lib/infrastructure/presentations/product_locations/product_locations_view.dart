import 'package:dematec_mobile/core/enum/general/product_search_type_enum.dart';
import 'package:dematec_mobile/core/enum/general/status_screen_enum.dart';
import 'package:dematec_mobile/infrastructure/presentations/shared/components/product_simple_card/product_simple_card_widget.dart';
import 'package:dematec_mobile/infrastructure/presentations/shared/screens/generic_search_screen.dart';
import 'package:dematec_mobile/infrastructure/presentations/shared/components/search_banner/search_banner_widget.dart';
import 'package:dematec_mobile/infrastructure/presentations/product_locations/product_locations_provider.dart';
import 'package:dematec_mobile/infrastructure/presentations/product_locations/widgets/product_detail_header_widget.dart';
import 'package:dematec_mobile/infrastructure/presentations/product_locations/widgets/storage_location_card_widget.dart';
import 'package:dematec_mobile/model/product_model.dart';
import 'package:dematec_mobile/services/product_search/product_search_service.dart';
import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class ProductLocationsView extends StatelessWidget {
  const ProductLocationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductLocationsProvider>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Consulta por Produto')),
          body: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              if (state.locations == null)
                SliverPadding(
                  padding: UiPaddings.screen.copyWith(bottom: 0),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SearchBannerWidget(
                          title: 'Localizar Produto',
                          subtitle:
                              'Clique para buscar por nome, código ou referência',
                          icon: PhosphorIconsRegular.magnifyingGlass,
                          onTap: () async {
                            final searchService = context
                                .read<ProductSearchService>();

                            final selectedProduct =
                                await Navigator.push<ProductModel>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GenericSearchScreen(
                                      title: 'Buscar Produto',
                                      searchHint:
                                          'Informe a descrição do produto...',
                                      filters: [
                                        // SearchFilterOption(
                                        //   label: 'Descrição',
                                        //   value: ProductSearchType.description,
                                      ],
                                      initialFilter:
                                          ProductSearchType.description,
                                      onSearch:
                                          (query, selectedFilter, page) async {
                                            final result = await searchService
                                                .searchProduct(page, query);

                                            return result.fold(
                                              (error) => throw Exception(
                                                error.message,
                                              ),
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
                              state.loadLocationsForProduct(
                                selectedProduct.idProduct,
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),

              _buildBodyContent(state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBodyContent(ProductLocationsProvider state) {
    switch (state.statusScreen) {
      case StatusScreenEnum.initial:
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: UiPaddings.screen,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  PhosphorIconsRegular.package,
                  size: 48,
                  color: DematecUiColorsConstants.neutral400,
                ),
                const SizedBox(height: 16),
                const DematecUiLabelMedium(
                  text: 'Nenhum produto selecionado',
                  color: DematecUiColorsConstants.neutral600,
                ),
                const SizedBox(height: 8),
                const DematecUiLabelSmall(
                  text:
                      'Utilize o botão acima para pesquisar um produto e visualizar onde ele está armazenado.',
                  textAlign: TextAlign.center,
                  color: DematecUiColorsConstants.neutral500,
                ),
              ],
            ),
          ),
        );

      case StatusScreenEnum.loading:
        return const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: DematecUiCircularProgressIndicator()),
        );

      case StatusScreenEnum.error:
        return const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: Text('Erro ao buscar os endereços do produto.')),
        );

      case StatusScreenEnum.success:
        if (state.locations == null) {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }

        final locationsList = state.locations!.storageBin;
        final hasLocations = locationsList.isNotEmpty;

        return SliverPadding(
          padding: UiPaddings.screen.copyWith(top: 0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DematecUiButtonCustom(
                        title: 'Pesquisar Outro Produto',
                        iconLeft: PhosphorIconsRegular.magnifyingGlass,
                        type: DematecUiTypeButtonWidget.outline,
                        colorType: DematecUiColorTypeWidget.info,
                        size: DematecUiSizeWidget.large,
                        onPressed: () {
                          state.clearSearch();
                        },
                      ),

                      const SizedBox(height: 16),
                      ProductDetailHeaderWidget(product: state.locations!),
                    ],
                  ),
                );
              }

              if (!hasLocations) {
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
                        PhosphorIconsRegular.mapPinLine,
                        size: 40,
                        color: DematecUiColorsConstants.neutral400,
                      ),
                      const SizedBox(height: 12),
                      const DematecUiLabelMedium(
                        text: 'Nenhum endereço vinculado',
                        fontWeight: FontWeight.w700,
                        color: DematecUiColorsConstants.neutral700,
                      ),
                      const SizedBox(height: 4),
                      const DematecUiLabelSmall(
                        text:
                            'Este produto não possui saldo ou endereços de armazenagem cadastrados no sistema.',
                        textAlign: TextAlign.center,
                        color: DematecUiColorsConstants.neutral500,
                      ),
                    ],
                  ),
                );
              }

              final location = locationsList[index - 1];
              return StorageLocationCardWidget(location: location);
            }, childCount: hasLocations ? locationsList.length + 1 : 2),
          ),
        );
    }
  }
}
