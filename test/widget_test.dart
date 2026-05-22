import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:gitrusguard_ai/main.dart';
import 'package:gitrusguard_ai/core/localization/localization_helper.dart';
import 'package:gitrusguard_ai/core/localization/locale_keys.dart';

void main() {
  testWidgets('renders the home dashboard', (WidgetTester tester) async {
    await tester.pumpWidget(
      EasyLocalization(
        supportedLocales: LocalizationHelper.supportedLocales,
        path: LocalizationHelper.translationPath,
        fallbackLocale: LocalizationHelper.fallbackLocale,
        startLocale: const Locale('ar'),
        saveLocale: false,
        child: const MyApp(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('أحمد سعيد'), findsOneWidget);
    expect(find.text('تحذير: HLB — خطر صحي نشط'), findsOneWidget);
    expect(find.text('افحص الورقة أو الثمرة الآن'), findsOneWidget);
    expect(find.text('خريطة الأمراض'), findsOneWidget);

    await tester.tap(find.text(LocaleKeys.navSettings.tr()).first);
    await tester.pumpAndSettle();

    await tester.tap(find.text(LocaleKeys.settingsEnglish.tr()).first);
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.home_outlined).first);
    await tester.pumpAndSettle();

    expect(find.text('Settings'), findsWidgets);

    await tester.tap(find.text(LocaleKeys.navGisMap.tr()).first);
    await tester.pumpAndSettle();

    expect(find.text('GIS Map'), findsWidgets);
    expect(
      find.text('View nearby field activity and map-based disease clustering.'),
      findsOneWidget,
    );
  });
}
