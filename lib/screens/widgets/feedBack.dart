import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constants/colors.dart';
import '../../constants/styles.dart';

class FeedBackPage extends StatelessWidget {
  FeedBackPage({super.key});

  final List<String> reviews = [
    'assets/images/rev1.jpg',
    'assets/images/rev1.jpg',
    'assets/images/rev1.jpg',
  ];

  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customers Feedback'),
      ),
      body: Directionality(
        textDirection: TextDirection.ltr,
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
                      'La\'rgan Oil',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Palette.milkColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'La\'rgan Oil Reviews:',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        color: Palette.milkColor,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 10),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CarouselSlider.builder(
                          itemCount: reviews.length,
                          itemBuilder: (context, index, realIndex) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Palette.milkColor),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.asset(
                                    reviews[index],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                          options: CarouselOptions(
                            height: size.height * 0.6,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 9 / 9,
                            enableInfiniteScroll: true,
                            viewportFraction: 0.8,
                          ),
                          carouselController:
                              _controller, // Assign the controller
                        ),

                        // Left Arrow
                        Positioned(
                          left: 0,
                          child: IconButton(
                            icon: const Icon(FontAwesomeIcons.arrowLeft,
                                color: Palette.milkColor),
                            onPressed: () {
                              _controller.previousPage();
                            },
                          ),
                        ),

                        // Right Arrow
                        Positioned(
                          right: 0,
                          child: IconButton(
                            icon: const Icon(FontAwesomeIcons.arrowRight,
                                color: Palette.milkColor),
                            onPressed: () {
                              _controller.nextPage();
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
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
