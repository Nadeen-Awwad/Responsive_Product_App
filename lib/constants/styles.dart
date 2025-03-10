import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class Styles {
  static const BoxDecoration gradientDecoration =
      BoxDecoration(gradient: LinearGradient(colors: Palette.basicAppColors));

  static ButtonStyle menuButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Palette.lightOrange,
    // Text color
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    // Simple padding
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8), // Slightly rounded corners
    ),
  );
}
