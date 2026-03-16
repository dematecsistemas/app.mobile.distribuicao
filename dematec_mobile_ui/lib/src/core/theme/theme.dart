import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/mapping_assets.dart';
import '../constants/mapping_colors.dart';

const IconThemeData _iconThemeData = IconThemeData(
  color: DematecUiColorsConstants.neutral800,
  size: 26,
);

const TextStyle _headlineLarge = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 26,
  color: DematecUiColorsConstants.neutral800,
);

const TextStyle _headlineMedium = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 22,
  color: DematecUiColorsConstants.neutral800,
);

const TextStyle _bodyLarge = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16,
  color: DematecUiColorsConstants.neutral800,
);

const TextStyle _bodyMedium = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 16,
  color: DematecUiColorsConstants.neutral800,
);

const TextStyle _bodySmall = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 18,
);

const TextStyle _titleMedium = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 18,
  color: DematecUiColorsConstants.neutral800,
);

const TextStyle _titleSmall = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 16,
  color: DematecUiColorsConstants.neutral800,
);

const TextStyle _labelLarge = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 14,
  color: DematecUiColorsConstants.neutral800,
);

const TextStyle _labelMedium = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 14,
  color: DematecUiColorsConstants.neutral800,
);

const TextStyle _labelSmall = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 12,
  letterSpacing: 0.4,
  color: DematecUiColorsConstants.neutral800,
);

const TextTheme _textTheme = TextTheme(
  headlineMedium: _headlineMedium,
  headlineLarge: _headlineLarge,
  bodyLarge: _bodyLarge,
  bodyMedium: _bodyMedium,
  bodySmall: _bodySmall,
  titleLarge: _titleMedium,
  titleMedium: _titleMedium,
  titleSmall: _titleSmall,
  labelLarge: _labelLarge,
  labelMedium: _labelMedium,
  labelSmall: _labelSmall,
);

ThemeData dematecTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch:
      MaterialColor(DematecUiColorsConstants.primary500.toARGB32(), const {
        50: DematecUiColorsConstants.primary100,
        100: DematecUiColorsConstants.primary100,
        200: DematecUiColorsConstants.primary200,
        300: DematecUiColorsConstants.primary300,
        400: DematecUiColorsConstants.primary400,
        500: DematecUiColorsConstants.primary500,
        600: DematecUiColorsConstants.primary600,
        700: DematecUiColorsConstants.primary700,
        800: DematecUiColorsConstants.primary800,
        900: DematecUiColorsConstants.primary800,
      }),
  fontFamily: DematecUiAssetsConstants.fontFamily,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary:
        MaterialColor(DematecUiColorsConstants.primary500.toARGB32(), const {
          50: DematecUiColorsConstants.primary100,
          100: DematecUiColorsConstants.primary100,
          200: DematecUiColorsConstants.primary200,
          300: DematecUiColorsConstants.primary300,
          400: DematecUiColorsConstants.primary400,
          500: DematecUiColorsConstants.primary500,
          600: DematecUiColorsConstants.primary600,
          700: DematecUiColorsConstants.primary700,
          800: DematecUiColorsConstants.primary800,
          900: DematecUiColorsConstants.primary800,
        }),
    onPrimary: DematecUiColorsConstants.primary500,
    secondary:
        MaterialColor(DematecUiColorsConstants.secondary500.toARGB32(), const {
          50: DematecUiColorsConstants.secondary100,
          100: DematecUiColorsConstants.secondary100,
          200: DematecUiColorsConstants.secondary200,
          300: DematecUiColorsConstants.secondary300,
          400: DematecUiColorsConstants.secondary400,
          500: DematecUiColorsConstants.secondary500,
          600: DematecUiColorsConstants.secondary600,
          700: DematecUiColorsConstants.secondary700,
          800: DematecUiColorsConstants.secondary800,
          900: DematecUiColorsConstants.secondary800,
        }),
    onSecondary: DematecUiColorsConstants.secondary500,
    tertiary:
        MaterialColor(DematecUiColorsConstants.tertiary500.toARGB32(), const {
          50: DematecUiColorsConstants.tertiary50,
          100: DematecUiColorsConstants.tertiary100,
          200: DematecUiColorsConstants.tertiary200,
          300: DematecUiColorsConstants.tertiary300,
          400: DematecUiColorsConstants.tertiary400,
          500: DematecUiColorsConstants.tertiary500,
          600: DematecUiColorsConstants.tertiary600,
          700: DematecUiColorsConstants.tertiary700,
          800: DematecUiColorsConstants.tertiary800,
          900: DematecUiColorsConstants.tertiary800,
        }),
    onTertiary: DematecUiColorsConstants.tertiary500,
    error: MaterialColor(DematecUiColorsConstants.error500.toARGB32(), const {
      50: DematecUiColorsConstants.error50,
      100: DematecUiColorsConstants.error100,
      200: DematecUiColorsConstants.error200,
      300: DematecUiColorsConstants.error300,
      400: DematecUiColorsConstants.error400,
      500: DematecUiColorsConstants.error500,
      600: DematecUiColorsConstants.error600,
      700: DematecUiColorsConstants.error700,
      800: DematecUiColorsConstants.error800,
      900: DematecUiColorsConstants.error900,
    }),
    onError: DematecUiColorsConstants.error500,
    surface:
        MaterialColor(DematecUiColorsConstants.surface500.toARGB32(), const {
          50: DematecUiColorsConstants.surface50,
          100: DematecUiColorsConstants.surface100,
          200: DematecUiColorsConstants.surface200,
          300: DematecUiColorsConstants.surface300,
          400: DematecUiColorsConstants.surface400,
          500: DematecUiColorsConstants.surface500,
          600: DematecUiColorsConstants.surface600,
          700: DematecUiColorsConstants.surface700,
          800: DematecUiColorsConstants.surface800,
          900: DematecUiColorsConstants.surface900,
        }),
    onSurface: DematecUiColorsConstants.surface50,
    surfaceContainerHighest: MaterialColor(
      DematecUiColorsConstants.surfaceVariant500.toARGB32(),
      const {
        50: DematecUiColorsConstants.surfaceVariant50,
        100: DematecUiColorsConstants.surfaceVariant100,
        200: DematecUiColorsConstants.surfaceVariant200,
        300: DematecUiColorsConstants.surfaceVariant300,
        400: DematecUiColorsConstants.surfaceVariant400,
        500: DematecUiColorsConstants.surfaceVariant500,
        600: DematecUiColorsConstants.surfaceVariant600,
        700: DematecUiColorsConstants.surfaceVariant700,
        800: DematecUiColorsConstants.surfaceVariant800,
        900: DematecUiColorsConstants.surfaceVariant900,
      },
    ),
    onSurfaceVariant: DematecUiColorsConstants.surfaceVariant500,
    inverseSurface: MaterialColor(
      DematecUiColorsConstants.inverseSurface500.toARGB32(),
      const {
        50: DematecUiColorsConstants.inverseSurface50,
        100: DematecUiColorsConstants.inverseSurface100,
        200: DematecUiColorsConstants.inverseSurface200,
        300: DematecUiColorsConstants.inverseSurface300,
        400: DematecUiColorsConstants.inverseSurface400,
        500: DematecUiColorsConstants.inverseSurface500,
        600: DematecUiColorsConstants.inverseSurface600,
        700: DematecUiColorsConstants.inverseSurface700,
        800: DematecUiColorsConstants.inverseSurface800,
        900: DematecUiColorsConstants.inverseSurface900,
      },
    ),
    onInverseSurface: DematecUiColorsConstants.inverseSurface500,
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: DematecUiColorsConstants.neutral200,
  ),
  textTheme: _textTheme,
  primaryTextTheme: _textTheme,
  iconTheme: _iconThemeData,
  primaryIconTheme: _iconThemeData,
  scaffoldBackgroundColor: DematecUiColorsConstants.neutral50,
  appBarTheme: AppBarTheme(
    backgroundColor: DematecUiColorsConstants.neutral100,
    iconTheme: _iconThemeData.copyWith(
      color: DematecUiColorsConstants.neutral700,
    ),
    titleTextStyle: _titleMedium.copyWith(
      color: DematecUiColorsConstants.neutral700,
      fontWeight: FontWeight.w400,
    ),
    elevation: 0,
    surfaceTintColor: DematecUiColorsConstants.neutral100,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: DematecUiColorsConstants.neutral100,
      systemNavigationBarColor: DematecUiColorsConstants.neutral100,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: DematecUiColorsConstants.neutral100,
    ),
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: DematecUiColorsConstants.neutral100,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: DematecUiColorsConstants.tertiary100,
    selectedItemColor: DematecUiColorsConstants.surface500,
    unselectedItemColor: DematecUiColorsConstants.tertiary500,
    unselectedIconTheme: IconThemeData(
      color: DematecUiColorsConstants.tertiary300,
    ),
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
  ),
  dividerColor: DematecUiColorsConstants.tertiary300,
  dividerTheme: DividerThemeData(color: DematecUiColorsConstants.tertiary300),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: DematecUiColorsConstants.primary500,
    focusColor: DematecUiColorsConstants.secondary500,
    splashColor: DematecUiColorsConstants.secondary500,
    hoverColor: DematecUiColorsConstants.secondary500,
  ),
  primaryColor: DematecUiColorsConstants.primary500,
  checkboxTheme: CheckboxThemeData(
    side: const BorderSide(
      color: DematecUiColorsConstants.primary500,
      width: 3,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ),
  cardColor: DematecUiColorsConstants.secondary500,
  cardTheme: CardThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: DematecUiColorsConstants.tertiary800,
    circularTrackColor: DematecUiColorsConstants.tertiary200,
    linearMinHeight: 30,
    refreshBackgroundColor: DematecUiColorsConstants.tertiary200,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  datePickerTheme: DatePickerThemeData(
    surfaceTintColor: Colors.transparent,
    backgroundColor: DematecUiColorsConstants.neutral200,
    headerForegroundColor: DematecUiColorsConstants.tertiary900,
    todayBorder: BorderSide(color: DematecUiColorsConstants.tertiary900),
    dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return DematecUiColorsConstants.surface500;
      }

      return Colors.transparent;
    }),
    todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return DematecUiColorsConstants.surface500;
      }

      return Colors.transparent;
    }),
    todayForegroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return DematecUiColorsConstants.neutral200;
      }

      return DematecUiColorsConstants.tertiary900;
    }),
    dayForegroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return DematecUiColorsConstants.neutral200;
      }

      if (states.contains(WidgetState.disabled)) {
        return DematecUiColorsConstants.tertiary300;
      }

      return DematecUiColorsConstants.tertiary900;
    }),
    dayOverlayColor: WidgetStateProperty.all(
      DematecUiColorsConstants.surface50,
    ),
    yearForegroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return DematecUiColorsConstants.neutral200;
      }

      if (states.contains(WidgetState.disabled)) {
        return DematecUiColorsConstants.tertiary300;
      }

      return DematecUiColorsConstants.tertiary900;
    }),
    yearOverlayColor: WidgetStateProperty.all(
      DematecUiColorsConstants.surface50,
    ),
  ),
  dialogTheme: DialogThemeData(
    backgroundColor: DematecUiColorsConstants.neutral50,
  ),
  tabBarTheme: TabBarThemeData(indicatorColor: Colors.white),
);
