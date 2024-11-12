import 'package:easy_localization/easy_localization.dart';
import 'package:firstamazegroup/shared/utils/app_values.dart';
import 'package:flutter/material.dart';

import '../../shared/global/app_colors.dart';

class StepsScreen extends StatelessWidget {
  final List<StepData> steps = [
    StepData(
      imagePath: 'assets/images/step1.png',
      titleKey: 'steps.step1.title',
      descriptionKey: 'steps.step1.description',
      stepNumber: '1',
    ),
    StepData(
      imagePath: 'assets/images/step2.png',
      titleKey: 'steps.step2.title',
      descriptionKey: 'steps.step2.description',
      stepNumber: '2',
    ),
    StepData(
      imagePath: 'assets/images/step3.png',
      titleKey: 'steps.step3.title',
      descriptionKey: 'steps.step3.description',
      stepNumber: '3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Add this line
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'company.additionalInfo',
            style: TextStyle(
                fontSize: 32, color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ).tr(),
        ),
        Center(
          child: Text(
            'steps.subtitle',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary),
          ).tr(),
        ),
        SizedBox(height: 16),
        ...steps.map((step) => buildStepItem(context, step)).toList(),
        SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              textStyle: TextStyle(fontSize: 18),
            ),
            onPressed: () {
              // Handle button press
            },
            child: Text(
              'steps.applyNow',
              style: TextStyle(color: Colors.white),
            ).tr(),
          ),
        ),
      ],
    );
  }

  Widget buildStepItem(BuildContext context, StepData step) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(step.imagePath, fit: BoxFit.cover),
          SizedBox(height: 8),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left-aligned Title and Description
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'خطوة',
                    style: TextStyle(fontSize: 12, color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    step.stepNumber,
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(width: mediaQueryWidth(context) * 0.05),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      step.titleKey, // Step title
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                    ).tr(),
                    SizedBox(height: 4),
                    Text(
                      step.descriptionKey, // Step description
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                      textAlign: TextAlign.start,
                    ).tr(),
                  ],
                ),
              ),

              // Right-aligned Step Number

            ],
          ),
        ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}

class StepData {
  final String imagePath;
  final String titleKey;
  final String descriptionKey;
  final String stepNumber;

  StepData({
    required this.imagePath,
    required this.titleKey,
    required this.descriptionKey,
    required this.stepNumber,
  });
}

