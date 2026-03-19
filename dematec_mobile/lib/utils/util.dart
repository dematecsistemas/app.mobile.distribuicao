import 'package:dematec_mobile_ui/dematec_mobile_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show HapticFeedback;
import 'package:in_app_notification/in_app_notification.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

class Util {
  static String getScannedCode(String scannedCode) {
    /* 
      Usado para quando ler um valor de QR CODE. Esse valor pode
      vir com um string numerica com varios valores ou pode vir somente com
      o código do produto. Essa função faz esse tratamento.
    */

    final code = scannedCode.trim();

    if (code.length < 15) {
      return code;
    }

    return code.substring(2, 15);
  }

  static String formatDate(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    final arr = dateTime.toIso8601String().split('T')[0].split('-');
    return '${arr[2]}/${arr[1]}/${arr[0]}';
  }

  static String maxLength(String text, int length) {
    if (text.length > length) {
      return '${text.substring(0, length)}...';
    }

    return text;
  }

  static String removeZeroRight(double value) {
    return value.toStringAsFixed(2).replaceAll('.00', '');
  }

  static String formatDateTime(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    final arr = dateTime.toIso8601String().split('T')[0].split('-');
    final arrTime = dateTime.toIso8601String().split('T')[1].split(':');

    return '${arr[2]}/${arr[1]}/${arr[0]} ${arrTime[0]}:${arrTime[1]}';
  }

  static bool existStringInList(List<String> list, String value) {
    return list.indexWhere((s) => s == value) >= 0;
  }

  static Future<String> getNumberVersion() async {
    final info = await PackageInfo.fromPlatform();
    return info.version;
  }

  static void showApiError(
    BuildContext context,
    String text, {
    bool playSound = true,
  }) {
    InAppNotification.show(
      context: context,
      duration: const Duration(seconds: 2),
      child: DematecUiNotificationBodyWidget(
        text: text,
        type: DematecUiColorTypeWidget.danger,
      ),
    );

    HapticFeedback.heavyImpact();
  }

  static void showApiSuccess(BuildContext context, String text) {
    InAppNotification.show(
      context: context,
      duration: const Duration(seconds: 2),
      child: DematecUiNotificationBodyWidget(
        text: text,
        type: DematecUiColorTypeWidget.success,
      ),
    );
  }

  static String formatDateToApi(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    return dateTime.toIso8601String().split('T')[0];
  }

  static String formatBigNumbers(int value) {
    return NumberFormat.decimalPattern('pt_BR').format(value);
  }

  static String formatNumbers(double value) {
    return NumberFormat.decimalPattern('pt_BR').format(value);
  }

  static String getInitialsName(String name) {
    if (name.trim().isEmpty) return '';

    return name
        .trim()
        .split(' ')
        .where((word) => word.isNotEmpty)
        .map((word) => word[0].toUpperCase())
        .take(2)
        .join();
  }
}
