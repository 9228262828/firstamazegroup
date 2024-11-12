import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'DeskTopScreen.dart';

import 'mobile_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 900) {
            // Desktop Layout
            return DesktopScreen();
          } else if (constraints.maxWidth > 600) {
            // Tablet Layout
            return MobileScreen();
          } else {
            // Mobile Layout
            return MobileScreen();
          }
        },
      ),
    );
  }
}
