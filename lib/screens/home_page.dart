import 'package:first_app/screens/tablet/tablet_layout_page.dart';
import 'package:first_app/screens/widgets/about_page.dart';
import 'package:first_app/screens/widgets/feedBack.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../constants/colors.dart';
import '../constants/styles.dart';
import 'largeScreen/desktop_layout_page.dart';
import 'mobile/mobile_layout_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String getLayoutType(double width) {
  if (width > 950) {
    return 'desktop';
  } else if (width > 500) {
    return 'tablet';
  } else {
    return 'mobile';
  }
}

class _HomePageState extends State<HomePage> {
  bool isMobile = false;

  @override
  Widget build(BuildContext context) {
    isMobile = getLayoutType(MediaQuery.of(context).size.width) == 'mobile';
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: Styles.gradientDecoration,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              GradientText(
                "L'Argan",
                colors: [Palette.black, Palette.lightOrange],
                style: TextStyle(
                  fontSize: isMobile ? screenWidth * 0.05 : screenWidth * 0.03,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/images/appLogo.png',
                width: isMobile ? screenWidth * 0.1 : screenWidth * 0.05,
                height: isMobile ? screenWidth * 0.1 : screenWidth * 0.05,
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            ],
          ),
          actions: isMobile
              ? null
              : [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutPage()),
                        );
                      },
                      style: Styles.menuButtonStyle,
                      child: Text(
                        "About Product",
                        style: TextStyle(fontSize: 14), // Standard text size
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FeedBackPage()),
                        );
                      },
                      style: Styles.menuButtonStyle,
                      child: Text(
                        "Feedback",
                        style: TextStyle(fontSize: 14), // Standard text size
                      ),
                    ),
                  ),
                ],
        ),
        drawer: isMobile
            ? Drawer(
                child: ListView(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutPage()),
                          );
                        },
                        style: Styles.menuButtonStyle,
                        child: Text(
                          "About Product",
                          style: TextStyle(fontSize: 14), // Standard text size
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FeedBackPage()),
                          );
                        },
                        style: Styles.menuButtonStyle,
                        child: Text(
                          "Feedback",
                          style: TextStyle(fontSize: 14), // Standard text size
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : null,
        body: LayoutBuilder(builder: (context, constraints) {
          final double maxWidth = constraints.maxWidth;

          switch (getLayoutType(maxWidth)) {
            case 'desktop':
              return DesktopLayoutPage();
            case 'tablet':
              return TabletLayout();
            case 'mobile':
              return MobileLayout();
            default:
              return MobileLayout();
          }
        }),
      ),
    );
  }
}
