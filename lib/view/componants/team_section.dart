import 'package:firstamazegroup/shared/global/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TeamSection extends StatelessWidget {
  final List<Map<String, String>> teamMembers = [
    {
      "image": "assets/images/step1.png",
      "name": "Hana Ewis",
      "role": "team_section.role1",
      "linkedin": "https://linkedin.com",
      "instagram": "https://instagram.com",
      "facebook": "https://facebook.com",
    },
    {
      "image": "assets/images/step2.png",
      "name": "Another Person",
      "role": "team_section.role2",
      "linkedin": "https://linkedin.com",
      "instagram": "https://instagram.com",
      "facebook": "https://facebook.com",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Description
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'team_section.title'.tr(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'team_section.description'.tr(),
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            // Team Members
            Column(
              children: teamMembers.map((member) => _buildTeamMember(member)).toList(),
            ),
            ImageSlider(),
            // Button
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    fixedSize:  Size(300, 45),// Button color
                    side:   BorderSide(color: AppColors.primary,),
                    shape:  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    )

                  ),

                  onPressed: () {
                    // Handle button press
                  },

                  child: Text(
                    'team_section.button'.tr(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMember(Map<String, String> member) {
    return Column(
      children: [
        Image.asset(
          member["image"]!,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                member["name"]!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                member["role"]!.tr(),
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    icon: Icon(FontAwesomeIcons.linkedin),
                    color: Colors.black,
                    onPressed: () {
                      // Open LinkedIn
                    },
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.instagram),
                    color: Colors.black,
                    onPressed: () {
                      // Open Instagram
                    },
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.facebook),
                    color: Colors.black,
                    onPressed: () {
                      // Open Facebook
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
       // Spacing between team members
      ],
    );
  }
}

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> images = [
    "assets/images/logo.png",
    "assets/images/logo.png",
    "assets/images/step1.png",
    "assets/images/logo.png",
    "assets/images/logo.png",
    "assets/images/step2.png",
    "assets/images/logo.png",
    "assets/images/logo.png",
    "assets/images/step3.png",
  ];

  void _onPrevious() {
    setState(() {
      if (_currentIndex < images.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0; // Loop back to the first image
      }
    });
    _pageController.animateToPage(
      _currentIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onNext() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      } else {
        _currentIndex = images.length - 1; // Loop back to the last image
      }
    });
    _pageController.animateToPage(
      _currentIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image Slider
        SizedBox(
          height: 300, // Adjust height as needed
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Image.asset(
                images[index],
                fit: BoxFit.cover,
                width: double.infinity,
              );
            },
          ),
        ),

        // Navigation Buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: _onPrevious,
              color: Colors.blue,
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: _onNext,
              color: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }
}

