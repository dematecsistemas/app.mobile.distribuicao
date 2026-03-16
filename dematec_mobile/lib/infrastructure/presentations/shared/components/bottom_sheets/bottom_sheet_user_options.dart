import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:dematec_mobile/core/services/pref_service.dart';
import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';

import 'bottom_sheet_user_options_provider.dart';

class BottomSheetMenuUserOptions extends StatelessWidget {
  const BottomSheetMenuUserOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          BottomSheetUserOptionsProvider(context.read<PrefService>()),
      child: Consumer<BottomSheetUserOptionsProvider>(
        builder: (context, state, __) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    children: [
                      // O Avatar
                      SizedBox(
                        width: 52,
                        height: 52,
                        child: CircleAvatar(
                          backgroundColor: DematecUiColorsConstants.neutral300,
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: CircleAvatar(
                              radius: 52,
                              backgroundColor: DematecUiColorsConstants.white,
                              child: Text(
                                state.initialsName,
                                style: const TextStyle(
                                  color: DematecUiColorsConstants.neutral400,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Nomes e Empresa
                      Text(
                        state.userFullName.isNotEmpty
                            ? state.userFullName
                            : 'Usuário',
                        style: const TextStyle(
                          color: DematecUiColorsConstants.neutral800,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        state.companyName,
                        style: const TextStyle(
                          color: DematecUiColorsConstants.neutral500,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 1,
                  color: DematecUiColorsConstants.neutral200,
                ),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.items.length,
                  itemBuilder: (_, index) {
                    final item = state.items[index];
                    final isLastItem = (state.items.length - 1) == index;

                    return Column(
                      children: [
                        ListTile(
                          leading: PhosphorIcon(
                            item.icon,
                            color:
                                item.iconColor ??
                                DematecUiColorsConstants.surface500,
                            size: 24,
                          ),
                          title: Text(
                            item.title,
                            style: const TextStyle(
                              color: DematecUiColorsConstants.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          onTap: () => item.onTap(context),
                        ),
                        if (!isLastItem)
                          const Divider(
                            height: 0,
                            thickness: 1,
                            color: DematecUiColorsConstants.neutral200,
                          ),
                      ],
                    );
                  },
                ),
                SafeArea(child: const SizedBox(height: 8)),
              ],
            ),
          );
        },
      ),
    );
  }
}
