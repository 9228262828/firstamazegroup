import 'package:firstamazegroup/shared/global/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class InfoSection extends StatelessWidget {
 final  String ? url;

  const InfoSection({super.key, required this.url});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF404040), // Dark background color
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'info_section.title'.tr(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),

          // First Paragraph
          Text(
            'info_section.paragraph1'.tr(),
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),

          // Second Paragraph
          Text(
            'info_section.paragraph2'.tr(),
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),

          // Third Paragraph
          Text(
            'info_section.paragraph3'.tr(),
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 16),

          // Fourth Paragraph
          Text(
            'info_section.paragraph4'.tr(),
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 24),

          // Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary, // Button color
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
            onPressed: () {
              // Button action
            },
            child: Text(
              'info_section.read_more'.tr(),
              style: TextStyle(fontSize: 16,color: AppColors.light),
            ),
          ),
        ],
      ),
    );
  }
}
