import 'package:first_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:html' as html;

class SocialWidgets extends StatelessWidget {
  const SocialWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri igLink = Uri.parse('https://www.instagram.com/');
    final Uri whatsupLink = Uri.parse('https://web.whatsapp.com/');
    return Row(
      children: [
        SingleSocialWidget(
          icon: FontAwesomeIcons.instagram,
          onPressed: () => _launchInBrowser(igLink),
        ),
        SingleSocialWidget(
          icon: FontAwesomeIcons.whatsapp,
          onPressed: () => _launchInBrowser(whatsupLink),
        ),
      ],
    );
  }

  void _launchInBrowser(Uri url) {
    html.window.open(url.toString(), 'new tab');
  }
}

class SingleSocialWidget extends StatelessWidget {
  const SingleSocialWidget(
      {super.key, this.onPressed, this.icon, this.color, this.boxColor});

  final void Function()? onPressed;
  final IconData? icon;
  final Color? color;
  final Color? boxColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: boxColor ?? Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: color ?? Palette.lightOrange)),
        child: IconButton(
            onPressed: onPressed ?? () {},
            hoverColor: Colors.white,
            icon: FaIcon(
              icon ?? FontAwesomeIcons.instagram,
              color: color ?? Palette.lightOrange,
              size: 15,
            )),
      ),
    );
  }
}
