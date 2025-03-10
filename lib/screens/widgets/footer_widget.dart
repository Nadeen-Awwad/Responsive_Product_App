import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      alignment: Alignment.center,
      child: Text(
        'Created by @Nadeen 2024',
        style: TextStyle(
          fontSize: 11,
          color: Colors.grey,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }
}
