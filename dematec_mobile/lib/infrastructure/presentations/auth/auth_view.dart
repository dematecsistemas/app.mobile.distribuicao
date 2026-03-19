import 'package:dematec_mobile/infrastructure/presentations/auth/auth_provider.dart';
import 'package:dematec_mobile/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    Color colorError = DematecUiColorsConstants.error600;

    return ChangeNotifierProvider(
      create: (context) => AuthProvider(context.read()),
      child: Consumer<AuthProvider>(
        builder: (context, state, child) {
          return Scaffold(
            body: state.loading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Image.asset(ImagesConstants.logo, fit: BoxFit.cover),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Center(
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                      const DematecUiLabelLarge(text: 'Entrando na conta'),
                    ],
                  )
                : Padding(
                    padding: UiPaddings.screenBottom(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Image.asset(
                            //   ImagesConstants.logo,
                            //   fit: BoxFit.cover,
                            //   height: 125,
                            //   width: 125,
                            // ),
                            const SizedBox(height: 8),
                            const DematecUiTitleLarge(
                              text: 'Entrar na conta',
                              color: DematecUiColorsConstants.surface800,
                            ),
                            const SizedBox(height: 40),
                            DematecUiTextFieldCustom(
                              styleField: DematecUiTextFieldStyleEnum.login,
                              textInputType: TextInputType.emailAddress,
                              label: 'USUÁRIO',
                              controller: state.controllerUser,
                              colorBorder:
                                  Util.existStringInList(state.errors, 'user')
                                  ? colorError
                                  : Colors.transparent,
                            ),
                            const SizedBox(height: 30),
                            DematecUiTextFieldCustom(
                              styleField: DematecUiTextFieldStyleEnum.login,
                              label: 'SENHA',
                              isObscure: !state.viewPassword,
                              controller: state.controllerPassword,
                              prefixIcon: state.viewPassword
                                  ? PhosphorIcons.eyeSlash()
                                  : PhosphorIcons.eye(),
                              onTapPrefixIcon: () {
                                state.viewPassword = !state.viewPassword;
                              },
                              colorBorder:
                                  Util.existStringInList(
                                    state.errors,
                                    'password',
                                  )
                                  ? colorError
                                  : Colors.transparent,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DematecUiCheckboxCustom(
                                  title: 'Lembre-me',
                                  isCheck: state.rememberPassword,
                                  isIndeterminate: false,
                                  onPressed: () {
                                    state.rememberPassword =
                                        !state.rememberPassword;
                                  },
                                ),
                                const DematecUiLabelMedium(
                                  text: 'Esqueci a senha',
                                  color: DematecUiColorsConstants.surface500,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            DematecUiButtonCustom(
                              title: 'Entrar',
                              size: DematecUiSizeWidget.large,
                              type: DematecUiTypeButtonWidget.normal,
                              colorType: DematecUiColorTypeWidget.info,
                              onPressed: () async {
                                // await state.onLogin();
                                context.go('/home');
                              },
                            ),
                            const SizedBox(height: 16),
                            FutureBuilder(
                              future: Util.getNumberVersion(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return Text(
                                    "Versão ${snapshot.data ?? "0.0.0"}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color:
                                          DematecUiColorsConstants.neutral600,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  );
                                }

                                return Text(
                                  'Versão 0.0.0',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: DematecUiColorsConstants.neutral600,
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              },
                            ),
                          ],
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
