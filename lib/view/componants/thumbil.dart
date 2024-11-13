import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:ui' as ui;

import '../../shared/global/app_colors.dart';

class ServicesScreen extends StatelessWidget {
  final String youtubeUrl1 = 'https://www.youtube.com/embed/8fE3LjoVZHA';
  final String youtubeUrl2 = 'https://www.youtube.com/embed/8fE3LjoVZHA';


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Section with Video Thumbnail and Text Content
          _buildVideoSection(
            context,
            'assets/images/logo.png', // Replace with your asset image path
            youtubeUrl1,
            tr('services_screen.section1.title'),
            [
              _buildLineItem('services_screen.section1.point1', 'services_screen.section1.description1'),
              _buildLineItem('services_screen.section1.point2', 'services_screen.section1.description2'),
              _buildLineItem('services_screen.section1.point3', 'services_screen.section1.description3'),
              _buildLineItem('services_screen.section1.point4', 'services_screen.section1.description4'),
            ],
          ),
          SizedBox(height: 32),

          // Second Section with Video Thumbnail and Text Content
          _buildVideoSection(
            context,
            'assets/images/logo.png', // Replace with your asset image path
            youtubeUrl2,
            tr('services_screen.section2.title'),
            [
              _buildLineItem1('services_screen.section2.point1', 'services_screen.section2.point2'),

            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVideoSection(
      BuildContext context,
      String imagePath,
      String videoUrl,
      String title,
      List<Widget> items,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YouTubeEmbedWidget(
          videoUrl,
        ),
        SizedBox(height: 16),
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items,
        ),
      ],
    );
  }

  Widget _buildLineItem(String titleKey, String descriptionKey) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleKey.tr(),
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 4),
          Text(
            descriptionKey.tr(),
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }
  Widget _buildLineItem1(String titleKey, String descriptionKey) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleKey.tr(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,  color: AppColors.boldBlack.withOpacity(.4),),
          ),
          SizedBox(height: 4),
          Text(
            descriptionKey.tr(),
            style: TextStyle(fontSize: 20, color: AppColors.boldBlack.withOpacity(.4), fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}


class YouTubeEmbedWidget extends StatelessWidget {
  final String videoUrl;

  YouTubeEmbedWidget(this.videoUrl);

  @override
  Widget build(BuildContext context) {
    // Register the view type as a HTML iframe for Flutter Web
    String viewType = 'youtube-embed-${videoUrl.hashCode}';
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      viewType,
          (int viewId) => html.IFrameElement()
        ..width = '100%'
        ..height = '100%'
        ..src = videoUrl
        ..style.border = 'none',
    );

    return SizedBox(
      width: double.infinity,
      height: 300,
      child: HtmlElementView(viewType: viewType),
    );
  }
}
