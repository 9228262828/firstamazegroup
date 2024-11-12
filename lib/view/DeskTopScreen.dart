import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class DesktopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to Desktop View',
        style: TextStyle(fontSize: 24),
      ).tr(),
    );
  }
}
