import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firstamazegroup/view/DeskTopScreen.dart';
import 'package:firstamazegroup/shared/global/app_colors.dart';
import 'package:firstamazegroup/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/components/contact_form.dart';
import '../shared/components/info_section.dart';
import 'componants/appbar.dart';
import 'componants/services.dart';
import 'componants/slider.dart';
import 'componants/steps.dart';
import 'componants/team_section.dart';
import 'componants/thumbil.dart';

class MobileScreen extends StatefulWidget {
  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            MainAppBar(),
          Slider1(),
            // Logo and Text
            SizedBox(height: mediaQueryHeight(context) * 0.05),

            // Translation text below

            StepsScreen(),
            ServicesScreen(),
            InfoSection(url: ""),
            YouTubeEmbedWidget(

              'https://www.youtube.com/embed/9bZkp7q19f0',
            ),
            ServicesList(),
            TeamSection(),
            ContactForm(),
          ],
        ),
      ),
    );
  }


}

