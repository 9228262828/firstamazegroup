import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../global/app_colors.dart';
import '../global/theme_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;

    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.backgroundColorINLight(themeMode),
          fontSize: 26,
        ),
      ),
      backgroundColor: AppColors.backgroundColor(themeMode),
      iconTheme: IconThemeData(
        color: AppColors.backgroundColorINLight(themeMode),
      ),
      surfaceTintColor: AppColors.backgroundColor(themeMode),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
