import 'package:dematec_mobile/infrastructure/presentations/menu/menu_provider.dart';
import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MenuProvider(),
      child: Consumer<MenuProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.close, color: Colors.grey),
                onPressed: () => context.pop(),
              ),
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
