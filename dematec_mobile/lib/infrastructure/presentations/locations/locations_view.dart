import 'package:dematec_mobile/core/enum/general/product_search_type_enum.dart';
import 'package:dematec_mobile/core/enum/general/status_screen_enum.dart';
import 'package:dematec_mobile/infrastructure/presentations/shared/components/product_simple_card/product_simple_card_widget.dart';
import 'package:dematec_mobile/infrastructure/presentations/shared/screens/generic_search_screen.dart';
import 'package:dematec_mobile/infrastructure/presentations/shared/components/search_banner/search_banner_widget.dart';
import 'package:dematec_mobile/infrastructure/presentations/locations/locations_provider.dart';
import 'package:dematec_mobile/infrastructure/presentations/locations/widgets/location_header_card_widget.dart';
import 'package:dematec_mobile/infrastructure/presentations/locations/widgets/product_stored_card_widget.dart';
import 'package:dematec_mobile/model/product_stored_model.dart';
import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class LocationsView extends StatelessWidget {
  const LocationsView({super.key});

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
                SearchBannerWidget(
                  title: 'Localizar Endereço',
                  subtitle: 'Clique para buscar por código ou rua/prateleira',
                  icon: PhosphorIconsRegular.mapPin,
                  onTap: () async {
                    final selectedProduct = await Navigator.push<ProductStoredModel>(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenericSearchScreen(
                          title: 'Buscar Endereço',
                          searchHint: 'Busque pelo endereço...',
                          filters: [
                            // SearchFilterOption(
                            //   label: 'Código',
                            //   value: ProductSearchType.id,
                            // ),
                            // SearchFilterOption(
                            //   label: 'Cód. Barras',
                            //   value: ProductSearchType.ean,
                            // ),
                            // SearchFilterOption(
                            //   label: 'Referência',
                            //   value: ProductSearchType.reference,
                            // ),
                          ],
                          initialFilter: ProductSearchType.description,
                          onSearch: (query, selectedFilter, page) async {
                            return [];
                          },
                          itemBuilder: (context, product) {
                            return ProductSimpleCardWidget(
                              product: product,
                              onTap: () {
                                // Ação quando o usuário tocar no card do produto
                                // Ex: Navegar para a tela de endereços passando o ID deste produto
                              },
                            );
                          },
                        ),
                      ),
                    );

                    if (selectedProduct != null) {}
                  },
                ),

                const SizedBox(height: 24),

                // ==========================================
                // GERENCIAMENTO DOS ESTADOS DA TELA
                // ==========================================
                switch (state.statusScreen) {
                  StatusScreenEnum.initial => Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          PhosphorIconsRegular
                              .mapTrifold, // Ícone de mapa/endereço
                          size: 48,
                          color: DematecUiColorsConstants.neutral400,
                        ),
                        const SizedBox(height: 16),
                        const DematecUiLabelMedium(
                          text: 'Nenhum endereço selecionado',
                          color: DematecUiColorsConstants.neutral600,
                        ),
                        const SizedBox(height: 8),
                        const DematecUiLabelSmall(
                          text:
                              'Utilize o botão acima para pesquisar um endereço e visualizar os produtos armazenados nele.',
                          textAlign: TextAlign.center,
                          color: DematecUiColorsConstants.neutral500,
                        ),
                      ],
                    ),
                  ),

                  StatusScreenEnum.loading => const Expanded(
                    child: Center(child: DematecUiCircularProgressIndicator()),
                  ),

                  StatusScreenEnum.error => Expanded(
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
                          text:
                              'Não foi possível buscar o endereço. Tente novamente.',
                          textAlign: TextAlign.center,
                          color: DematecUiColorsConstants.neutral500,
                        ),
                      ],
                    ),
                  ),

                  StatusScreenEnum.success => Expanded(
                    child: state.locations == null
                        ? const SizedBox.shrink()
                        : ListView.builder(
                            itemCount:
                                state.locations!.storeProducts.length + 1,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    top: 16,
                                    bottom: 16,
                                  ),
                                  child: LocationHeaderCardWidget(
                                    location: state.locations!,
                                  ),
                                );
                              }

                              final produto =
                                  state.locations!.storeProducts[index - 1];
                              return ProductStoredCardWidget(product: produto);
                            },
                          ),
                  ),
                },
              ],
            ),
          ),
        );
      },
    );
  }
}
