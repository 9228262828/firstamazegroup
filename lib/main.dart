import 'package:easy_localization/easy_localization.dart';
import 'package:firstamazegroup/view/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  // Load saved locale from SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  final savedLocaleCode = prefs.getString('locale') ?? 'ar';
  final savedLocale = Locale(savedLocaleCode);

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/langs',
      fallbackLocale: Locale('ar'),
      startLocale: savedLocale, // Set the initial locale directly here
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FirstAmazeGroup",
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomeScreen(),
    );
  }
}

