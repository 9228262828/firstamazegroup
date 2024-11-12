import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firstamazegroup/view/DeskTopScreen.dart';
import 'package:firstamazegroup/shared/global/app_colors.dart';
import 'package:firstamazegroup/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'componants/steps.dart';

class MobileScreen extends StatefulWidget {
  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  Future<void> _toggleLocale(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final newLocale = context.locale.languageCode == 'en' ? Locale('ar') : Locale('en');
    await prefs.setString('locale', newLocale.languageCode);
    await context.setLocale(newLocale);
  }

  bool isVisible = false;
  int _currentIndex = 0; // Tracks the current slide index

  final List<String> imagePaths = [
    'assets/images/logo.png',
    'assets/images/logo.png',
    'assets/images/logo.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                ),
              Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height * 0.3,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index; // Update the active index
                        });
                      },
                    ),
                    items: imagePaths.map((imagePath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0,
                    right: 0,


                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imagePaths.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _onDotTapped(entry.key),
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == entry.key
                                  ? AppColors.primary // Active indicator color
                                  : Colors.grey, // Inactive indicator color
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ]
              ),

              // Logo and Text
              SizedBox(height: mediaQueryHeight(context) * 0.05),
              Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: mediaQueryHeight(context) * 0.2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'company.description',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ).tr(),
                  ),
                ],
              ),

              // Translation text below

              StepsScreen(),
            ],
          ),
        ),
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
  void _onDotTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

