import 'package:dematec_mobile/infrastructure/presentations/menu_search/menu_search_provider.dart';
import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class MenuSearchView extends StatelessWidget {
  const MenuSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MenuSearchProvider(),
      child: Consumer<MenuSearchProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.grey),
                onPressed: () => context.pop(),
              ),
              title: DematecUiLabelLarge(text: 'Consultas'),
            ),
            body: ListView.separated(
              // padding: const EdgeInsets.all(16),
              itemCount: provider.menuItems.length,
              separatorBuilder: (_, _) => const Divider(),
              itemBuilder: (context, index) {
                final item = provider.menuItems[index];

                return DematecUiNavigationOption(
                  title: item.title,
                  subtitle: item.subtitle,
                  icon: item.icon,
                  iconColor: item.iconColor,
                  onTap: () => context.push(item.route),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
