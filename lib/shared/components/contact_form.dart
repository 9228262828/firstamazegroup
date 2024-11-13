import 'package:easy_localization/easy_localization.dart';
import 'package:firstamazegroup/shared/global/app_colors.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Subtitle
          Text(
            'contact_form.promise_title'.tr(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'contact_form.subtitle'.tr(),
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 16),

          // Image and Quote
          Center(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/presonal.png",
                  // Replace with actual image path
                  height: 150,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8),
                Text(
                  'contact_form.ceo_name'.tr(),
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),

          // Contact Form Title
          Text(
            'contact_form.contact_us'.tr(),
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'contact_form.support_24_7'.tr(),
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue,
            ),
          ),
          SizedBox(height: 16),

          // Name Field
          TextField(
            decoration: InputDecoration(
              labelText: 'contact_form.name'.tr(),
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),

          // Email Field
          TextField(
            decoration: InputDecoration(
              labelText: 'contact_form.email'.tr(),
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),

          // Phone Number Field
          TextField(
            decoration: InputDecoration(
              labelText: 'contact_form.phone'.tr(),
              prefixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),

          // Country Dropdown
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'contact_form.country'.tr(),
              border: OutlineInputBorder(),
            ),
            items: [
              DropdownMenuItem(
                  child: Text('United Arab Emirates'), value: 'UAE'),
              DropdownMenuItem(child: Text('Saudi Arabia'), value: 'SA'),
              DropdownMenuItem(child: Text('Qatar'), value: 'QA'),
            ],
            onChanged: (value) {},
          ),
          SizedBox(height: 16),

          // Message Field
          TextField(
            decoration: InputDecoration(
              labelText: 'contact_form.message'.tr(),
              border: OutlineInputBorder(),
            ),
            maxLines: 5,
          ),
          SizedBox(height: 16),

          // Submit Button
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary, // Button color
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              ),
              onPressed: () {
                // Handle form submission
              },
              child: Text(
                'contact_form.submit'.tr(),
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 16),

          // Additional Links
          Center(
            child: Text(
              'contact_form.get_support'.tr(),
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Text(
              'contact_form.contact_us_footer'.tr(),
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
