import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('isDarkMode')) {
      final isDarkMode = prefs.getBool('isDarkMode') ?? false;
      emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    } else {
      final brightness = WidgetsBinding.instance.window.platformBrightness;
      emit(brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light);
    }
  }

  Future<void> toggleTheme() async {
    final newMode = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', newMode == ThemeMode.dark);
    emit(newMode);
  }
}
