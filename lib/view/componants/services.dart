import 'package:firstamazegroup/shared/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../shared/global/app_colors.dart';

class ServicesList extends StatefulWidget {
  @override
  _ServicesListState createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> services = [
    {
      "image": "assets/images/service1.png",
      "title": "services.explore_market_requirements.title",
      "subtitle": "services.explore_market_requirements.subtitle"
    },
    {
      "image": "assets/images/service2.png",
      "title": "services.invest_in_dubai.title",
      "subtitle": "services.invest_in_dubai.subtitle"
    },
    {
      "image": "assets/images/service3.png",
      "title": "services.flexible_workspaces.title",
      "subtitle": "services.flexible_workspaces.subtitle"
    },
  ];

  void _onPrevious() {
    if (_currentIndex < services.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onNext() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PageView for sliding effect
        SizedBox(
          // Adjust height as needed
          height: mediaQueryHeight(context) * 0.62,
          child: PageView.builder(
            controller: _pageController,
            reverse:  true,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: services.length,
            itemBuilder: (context, index) {
              return _buildServiceItem(services[index]);
            },
          ),
        ),

        // Navigation buttons
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: _onPrevious,
                color: _currentIndex > 0 ? AppColors.primary : Colors.grey,
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                onPressed: _onNext,
                color: _currentIndex < services.length - 1 ? AppColors.primary : Colors.grey,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildServiceItem(Map<String, String> service) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:mediaQueryWidth(context) * 0.1),
      child: Container(
        width: mediaQueryWidth(context) * 0.6,
        color: Color(0xFF8B2C71), // Background color
       // padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              service["image"]!,
              width: mediaQueryHeight(context) * 0.9,
              fit: BoxFit.cover,
            ),
            SizedBox(height: mediaQueryHeight(context) * 0.07),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    service["title"]!.tr(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    service["subtitle"]!.tr(),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
