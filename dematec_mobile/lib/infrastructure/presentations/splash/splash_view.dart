import 'package:dematec_mobile/core/services/pref_service.dart';
import 'package:dematec_mobile/infrastructure/presentations/splash/splash_provider.dart';
import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Color colorText = DematecUiColorsConstants.tertiary600;

    return ChangeNotifierProvider(
      create: (context) {
        final provider = SplashProvider(context.read<PrefService>());

        provider.determineNextRoute().then((route) {
          if (context.mounted) {
            context.go(route);
          }
        });

        return provider;
      },
      child: Consumer<SplashProvider>(
        builder: (context, state, child) {
          return Scaffold(
            body: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.asset(
                      //   ImagesConstants.logo_drawed_vertical,
                      //   fit: BoxFit.cover,
                      //   width: 150,
                      //   height: 150,
                      // ),
                      const DematecUiCircularProgressIndicator(),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DematecUiLabelMedium(
                        text: 'Todos os direitos reservados',
                        color: colorText,
                      ),
                      const SizedBox(height: 18),
                      DematecUiLabelMedium(
                        text: "Versão ${state.appVersion}",
                        color: colorText,
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
