import 'package:first_app/constants/colors.dart';
import 'package:first_app/screens/widgets/rotating_image_widget.dart';
import 'package:first_app/screens/widgets/social_media_widget.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'footer_widget.dart';

class HeaderTextWidget extends StatelessWidget {
  const HeaderTextWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = size.width;
    final bool isMobile = screenWidth < 500;
    final String title = "L'Argan oil \n Moisturizing, nourishing";
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.06, vertical: size.height * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: title.length.toDouble()),
            duration: Duration(seconds: 1),
            builder: (context, value, child) {
              int charCount = value.toInt();
              String currentText = title.substring(0, charCount);
              return GradientText(
                currentText,
                colors: [
                  Palette.lightPink.withOpacity(0.3),
                  Palette.lightOrange,
                  Colors.white,
                ],
                style: TextStyle(
                  fontSize: isMobile ? screenWidth * 0.08 : screenWidth * 0.05,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
          SizedBox(height: 20),
          SizedBox(
            width: isMobile ? screenWidth * 0.8 : screenWidth * 0.4,
            child: Text(
              "“Argan oil is a moisturizer improves the health of skin and hair.”",
              style: TextStyle(
                fontSize: isMobile ? screenWidth * 0.05 : screenWidth * 0.03,
                fontFamily: 'Poppins',
                color: Palette.milkColor,
                height: 1.5,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          if (screenWidth < 500)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RotatingImageContainer(),
            ),
          SizedBox(height: 20),
          SizedBox(
            width: screenWidth * 0.5,
            child: SocialMediaWidget(isTablet: screenWidth < 950),
          ),
          FooterWidget()
        ],
      ),
    );
  }
}
