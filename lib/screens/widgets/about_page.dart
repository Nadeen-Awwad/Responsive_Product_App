import 'package:first_app/screens/widgets/social_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants/colors.dart';
import '../../constants/styles.dart';
import 'dart:html' as html;

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  final List<String> benefits = [
    'Deep hydration: Argan oil deeply moisturizes the skin, making it soft and radiant.',
    'Fights signs of aging: It contains antioxidants that help reduce wrinkles and improve skin elasticity.',
    'Promotes hair health: It helps nourish and strengthen hair, giving it a healthy and shiny appearance.',
    'Hair hydration: It hydrates the scalp and reduces dryness and split ends.',
  ];

  void _launchInBrowser(Uri url) {
    html.window.open(url.toString(), 'new tab');
  }

  @override
  Widget build(BuildContext context) {
    final Uri whatsupLink = Uri.parse('https://wa.me/972594590512');
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Argan Oil'),
      ),
      body: Directionality(
        textDirection: TextDirection.ltr,
        // Set the text direction to RTL for Arabic
        child: Container(
          decoration: Styles.gradientDecoration,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: SizedBox(
                width: 600,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Argan Oil',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Palette.milkColor),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Benefits of Argan Oil:',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Palette.milkColor,
                      ),
                      textAlign: TextAlign
                          .right, // Ensure the title is also right-aligned
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: benefits.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 5.0),
                            title: Text(
                              benefits[index],
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                color: Palette.milkColor,
                              ),
                              textAlign:
                                  TextAlign.right, // Right-align the list items
                            ),
                            leading: const Icon(Icons.check,
                                color: Palette.milkColor),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Palette.milkColor),
                          shape: BoxShape.rectangle),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          SingleSocialWidget(
                            boxColor: Palette.milkColor,
                            color: Colors.green,
                            icon: FontAwesomeIcons.whatsapp,
                            onPressed: () => _launchInBrowser(whatsupLink),
                          ),
                          Expanded(
                            child: Text(
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.ltr,
                              " +970 594 590 512"
                              " \n"
                              'To learn more about Argan oil and how to use it, please contact the number',
                              style: TextStyle(color: Palette.milkColor,overflow: TextOverflow.visible),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
