import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../shared/global/app_colors.dart';

class Slider1 extends StatefulWidget {
  const Slider1({super.key});

  @override
  State<Slider1> createState() => _Slider1State();
}

class _Slider1State extends State<Slider1> {
  int _currentIndex = 0; // Tracks the current slide index

  final List<String> imagePaths = [
    'assets/images/logo.png',
    'assets/images/logo.png',
    'assets/images/logo.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
  void _onDotTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
