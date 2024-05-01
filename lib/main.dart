import 'dart:ui';

import 'package:comu/bind/init_bind.dart';
import 'package:comu/common/translations_info.dart';
import 'package:comu/route/route_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RouteInfo.routeRoot,
      initialBinding: InitBind(),
      getPages: RouteInfo.pages,
      defaultTransition: Transition.cupertino,
      translations: TranslationsInfo(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      themeMode: ThemeMode.system,
      theme: ThemeData(
          colorScheme: const ColorScheme.light(),
          useMaterial3: true,
          fontFamily: 'NanumGothic'),
      darkTheme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          useMaterial3: true,
          fontFamily: 'NanumGothic'),
      debugShowCheckedModeBanner: false,
    );
  }
}
