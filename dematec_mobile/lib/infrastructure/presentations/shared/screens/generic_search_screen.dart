import 'package:dematec_mobile/core/enum/general/status_screen_enum.dart';
import 'package:dematec_mobile/infrastructure/presentations/shared/screens/scanner_screen.dart';
import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Uma classe auxiliar para passarmos os filtros (Código, Nome, etc) para a tela.
class SearchFilterOption<F> {
  final String label;
  final F value;

  SearchFilterOption({required this.label, required this.value});
}

/// T = O tipo do modelo retornado (ex: ProductModel)
/// F = O tipo do filtro/enum usado (ex: ProductSearchType)
class GenericSearchScreen<T, F> extends StatefulWidget {
  final String title;
  final String searchHint;
  final List<SearchFilterOption<F>> filters;
  final F initialFilter;

  /// Função assíncrona que a tela vai chamar para ir no banco/API buscar os dados.
  final Future<List<T>> Function(String query, F selectedFilter, int page)
  onSearch;

  /// Função que desenha o card de cada item da lista.
  final Widget Function(BuildContext context, T item) itemBuilder;

  const GenericSearchScreen({
    super.key,
    required this.title,
    required this.searchHint,
    required this.filters,
    required this.initialFilter,
    required this.onSearch,
    required this.itemBuilder,
  });

  @override
  State<GenericSearchScreen<T, F>> createState() =>
      _GenericSearchScreenState<T, F>();
}

class _GenericSearchScreenState<T, F> extends State<GenericSearchScreen<T, F>> {
  late F _selectedFilter;
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  StatusScreenEnum _statusScreenEnum = StatusScreenEnum.initial;
  String? _errorMessage;
  List<T>? _results;

  int _currentPage = 1;
  bool _isFetchingMore = false; // Se está buscando a próxima página no momento
  bool _hasMore = true; // Se ainda tem itens no banco para buscar

  @override
  void initState() {
    super.initState();
    _selectedFilter = widget.initialFilter;
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Se chegou a 200 pixels do fim da lista, tenta carregar mais
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadMore();
    }
  }

  void resetSearch() {
    setState(() {
      _statusScreenEnum = StatusScreenEnum.initial;
      _errorMessage = '';
      _results = null;
      _currentPage = 1;
      _hasMore = true;
      _isFetchingMore = false;
    });
  }

  Future<void> _performSearch() async {
    final query = _searchController.text.trim();
    if (query.isEmpty) return;

    FocusManager.instance.primaryFocus?.unfocus();

    setState(() {
      _statusScreenEnum = StatusScreenEnum.loading;
      _errorMessage = null;
      _currentPage = 1;
      _hasMore = true;
    });

    try {
      // Chama a função que foi passada por parâmetro lá de fora
      final results = await widget.onSearch(
        query,
        _selectedFilter,
        _currentPage,
      );
      setState(() {
        _results = results;
        _statusScreenEnum = StatusScreenEnum.success;
        // Se a primeira página já veio vazia ou com poucos itens, assumimos que acabou
        if (results.isEmpty) {
          _hasMore = false;
        }
      });
    } catch (e) {
      debugPrint('Erro real na busca: $e');
      setState(() {
        _errorMessage = 'Ocorreu um erro ao realizar a busca.';
        _statusScreenEnum = StatusScreenEnum.error;
        _results = [];
      });
    }
  }

  // Busca a Próxima Página (Rolagem Silenciosa)
  Future<void> _loadMore() async {
    final query = _searchController.text.trim();

    // Se já estiver buscando, ou se não tem mais nada, ou se nem buscou a primeira vez, não faz nada
    if (_isFetchingMore || !_hasMore || _results == null || query.isEmpty)
      return;

    setState(() {
      _isFetchingMore = true;
    });

    try {
      _currentPage++; // Vai para a próxima página
      final newResults = await widget.onSearch(
        query,
        _selectedFilter,
        _currentPage,
      );

      setState(() {
        if (newResults.isEmpty) {
          _hasMore = false; // Acabaram os resultados do banco
        } else {
          _results!.addAll(
            newResults,
          ); // Junta a nova lista no final da lista velha!
        }
        _isFetchingMore = false;
      });
    } catch (e) {
      debugPrint('Erro ao carregar mais: $e');
      setState(() {
        _isFetchingMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: UiPaddings.screen.copyWith(bottom: 0),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.filters.isNotEmpty) ...[
                    const DematecUiLabelSmall(
                      text: 'Buscar por:',
                      fontWeight: FontWeight.w600,
                      color: DematecUiColorsConstants.neutral600,
                    ),
                    const SizedBox(height: 8),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: widget.filters.map((filter) {
                          final isSelected = _selectedFilter == filter.value;
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: InkWell(
                              onTap: () {
                                setState(() => _selectedFilter = filter.value);
                                if (_searchController.text.isNotEmpty) {
                                  _performSearch();
                                }
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 16,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? DematecUiColorsConstants.primary500
                                      : DematecUiColorsConstants.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: isSelected
                                        ? DematecUiColorsConstants.primary500
                                        : DematecUiColorsConstants.neutral300,
                                  ),
                                ),
                                child: DematecUiLabelSmall(
                                  text: filter.label,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? DematecUiColorsConstants.white
                                      : DematecUiColorsConstants.neutral600,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],

                  DematecUiSearchField(
                    hint: widget.searchHint,
                    isEnabled: true,
                    size: DematecUiSizeWidget.large,
                    isOpen: true,
                    controller: _searchController,
                    onEditingComplete: _performSearch,
                    onChange: (_) => resetSearch(),
                    onTapScanner: () async {
                      // 1. Esconde o teclado caso ele esteja aberto
                      FocusManager.instance.primaryFocus?.unfocus();

                      // 2. Abre a tela do Scanner e espera ela devolver o código
                      final codigoLido = await Navigator.push<String>(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const ScannerScreen(), // Aquela tela com a UI do Nubank
                        ),
                      );

                      // 3. Quando a tela do Scanner fechar, verificamos se o usuário leu algo
                      if (codigoLido != null && codigoLido.isNotEmpty) {
                        // Preenche o seu DematecUiSearchField com o código lido
                        _searchController.text = codigoLido;

                        // Dispara a busca automaticamente no banco de dados!
                        _performSearch();
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),

            _buildBodyContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildBodyContent() {
    switch (_statusScreenEnum) {
      case StatusScreenEnum.loading:
        return const SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: DematecUiCircularProgressIndicator()),
        );

      case StatusScreenEnum.initial:
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                PhosphorIconsRegular.magnifyingGlass,
                size: 48,
                color: DematecUiColorsConstants.neutral400,
              ),
              const SizedBox(height: 16),
              const DematecUiLabelMedium(
                text: 'Pronto para buscar',
                color: DematecUiColorsConstants.neutral600,
              ),
              const SizedBox(height: 8),
              const DematecUiLabelSmall(
                text:
                    'Digite sua pesquisa acima e aperte enter/buscar no teclado.',
                textAlign: TextAlign.center,
                color: DematecUiColorsConstants.neutral500,
              ),
            ],
          ),
        );

      case StatusScreenEnum.success:
        if (_results!.isEmpty) {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: DematecUiLabelMedium(
                text: 'Nenhum resultado encontrado.',
                color: DematecUiColorsConstants.neutral600,
              ),
            ),
          );
        }

        return SliverPadding(
          padding: const EdgeInsets.only(bottom: 24),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              if (index == _results!.length) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child:
                        DematecUiCircularProgressIndicator(), // Loading do fim da lista
                  ),
                );
              }

              final item = _results![index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: InkWell(
                  onTap: () {
                    // O GRANDE MOMENTO: Devolve o item selecionado para a tela anterior!
                    Navigator.pop(context, item);
                  },
                  borderRadius: BorderRadius.circular(8),
                  // Chama a função que desenha o layout de fora!
                  child: widget.itemBuilder(context, item),
                ),
              );
            }, childCount: _results!.length),
          ),
        );

      case StatusScreenEnum.error:
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: DematecUiLabelLarge(
              text: _errorMessage ?? 'Ocorreu um erro ao buscar dados.',
            ),
          ),
        );
    }
  }
}
