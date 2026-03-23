import 'package:dematec_mobile/infrastructure/presentations/home/home_provider.dart';
import 'package:dematec_mobile/infrastructure/presentations/shared/components/bottom_sheets/user_options/bottom_sheet_user_options.dart';
import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(context.read()),
      child: Consumer<HomeProvider>(
        builder: (context, state, child) {
          return Scaffold(
            appBar: AppBar(
              title: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const BottomSheetMenuUserOptions();
                    },
                  );
                },
                child: Container(
                  color: DematecUiColorsConstants.neutral100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          DematecUiLabelMedium(text: state.userFullName),
                          const SizedBox(height: 2),
                          DematecUiLabelSmall(
                            text: state.companyName,
                            color: DematecUiColorsConstants.neutral600,
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          backgroundColor: DematecUiColorsConstants.neutral400,
                          child: Padding(
                            padding: const EdgeInsets.all(1),
                            child: CircleAvatar(
                              backgroundColor: DematecUiColorsConstants.white,
                              child: Text(
                                state.initialsName,
                                style: const TextStyle(
                                  color: DematecUiColorsConstants.neutral500,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              leading: GestureDetector(
                onTap: () {
                  context.push('/menu');
                },
                child: Icon(PhosphorIconsRegular.list),
              ),
            ),
            body: state.isLoading
                ? Center(child: DematecUiCircularProgressIndicator())
                : Padding(
                    padding: UiPaddings.screen,
                    child: Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: DematecUiLabelMedium(
                              textAlign: TextAlign.center,
                              text:
                                  'Seja bem vindo. Clique no icone no canto superior esquerdo para abrir o menu.',
                            ),
                          ),
                        ),
                        SafeArea(
                          top: false,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DematecUiLabelMedium(
                                  text: 'Versão ${state.appVersion}',
                                  color: DematecUiColorsConstants.neutral500,
                                ),
                                const SizedBox(height: 4),
                                DematecUiLabelSmall(
                                  text: 'Servidor: ${state.currentApiUrl}',
                                  color: DematecUiColorsConstants.neutral400,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
