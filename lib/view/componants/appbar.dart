import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/global/app_colors.dart';
import '../../shared/utils/app_values.dart';
class MainAppBar extends StatefulWidget {
  const MainAppBar({super.key});

  @override
  State<MainAppBar> createState() => _MainAppBarState();
}

class _MainAppBarState extends State<MainAppBar> {
  Future<void> _toggleLocale(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final newLocale = context.locale.languageCode == 'en' ? Locale('ar') : Locale('en');
    await prefs.setString('locale', newLocale.languageCode);
    await context.setLocale(newLocale);
  }
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(FontAwesomeIcons.whatsapp, color: AppColors.primary, size: 18),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'contactInfo.phoneNumber',
                      style: TextStyle(color: AppColors.boldBlackMOre),
                    ).tr(),
                  ),
                ],
              ),
              TextButton(
                onPressed: () => _toggleLocale(context),
                child: Text(
                  context.locale.languageCode == 'en' ? 'العربية' : 'English',
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.menu, color: AppColors.primary, size: 18),
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
              ),
              Image.asset(
                'assets/images/logo.png',
                width: mediaQueryWidth(context) * 0.15,
              ),
              IconButton(
                icon: Icon(Icons.call_outlined, color: AppColors.primary, size: 20),
                onPressed: () {},
              ),
            ],
          ),
          if (isVisible)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNavItem('navigationLinks.home',(){}),
              Divider(color: AppColors.boldGrey),
              _buildNavItem('navigationLinks.startBusiness',(){}),
              Divider(color: AppColors.boldGrey),
              _buildNavItem('navigationLinks.services',(){}),
              Divider(color: AppColors.boldGrey),
              _buildNavItem('navigationLinks.clients',(){}),
              Divider(color: AppColors.boldGrey),
              _buildNavItem('navigationLinks.team',(){}),
              Divider(color: AppColors.boldGrey),
              _buildNavItem('navigationLinks.aboutUs',(){}),
              Divider(color: AppColors.boldGrey),
              _buildNavItem('navigationLinks.contactUs',(){}),
            ],
          )
        ],
      ),
    );
  }
  Widget _buildNavItem(String translationKey, Function()? onPressed) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onPressed ,
        child: Text(
          translationKey,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ).tr(),
      ),
    );
  }

}


