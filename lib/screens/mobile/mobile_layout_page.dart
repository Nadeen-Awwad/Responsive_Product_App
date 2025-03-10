import 'package:flutter/material.dart';

import '../../constants/styles.dart';
import '../widgets/header_text_widget.dart';
import '../widgets/rotating_image_widget.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,

        decoration: Styles.gradientDecoration,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              HeaderTextWidget(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
