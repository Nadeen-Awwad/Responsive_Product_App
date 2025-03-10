import 'package:flutter/material.dart';

import '../../constants/styles.dart';
import '../widgets/header_text_widget.dart';
import '../widgets/rotating_image_widget.dart';

class DesktopLayoutPage extends StatefulWidget {
  const DesktopLayoutPage({super.key});

  @override
  State<DesktopLayoutPage> createState() => _DesktopLayoutPageState();
}

class _DesktopLayoutPageState extends State<DesktopLayoutPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: Styles.gradientDecoration,
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeaderTextWidget(size: size),
              Expanded(
                  child: RotatingImageContainer())
            ],
          ),
        ),
      ),
    );
  }
}
