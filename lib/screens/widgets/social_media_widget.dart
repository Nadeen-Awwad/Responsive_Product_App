import 'package:first_app/constants/colors.dart';
import 'package:first_app/screens/widgets/social_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../information_form_page.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key, this.isTablet = false});

  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    void showInformationForm(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child: InformationFormPage(size: MediaQuery.of(context).size),
          );
        },
      );
    }

    List<Widget> socialButtons = [
      SizedBox(
        width: 10,
      ),
      SocialButtonStyled(
        title: 'Request Here',
        onPressed: () => {showInformationForm(context)},
        icon: FontAwesomeIcons.hand,
      )
    ];

    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: isTablet
            ? Column(
                children: [...socialButtons],
              )
            : Row(
                children: [...socialButtons],
              ));
  }
}

class SocialButtonStyled extends StatelessWidget {
  const SocialButtonStyled(
      {super.key, required this.title, required this.onPressed, this.icon});

  final String title;
  final Function onPressed;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    bool isPhoneOrTablet = MediaQuery.of(context).size.width < 800;
    List<Widget> socialList = [
      Container(
          height: 70,
          width: 180,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Palette.milkColor)),
          child: TextButton.icon(
              onPressed: () {
                onPressed(); // Call the function
              },
              label: Text(
                title,
                style: TextStyle(color: Palette.lightOrange),
              ),
              icon: Icon(
                icon,
                color: Palette.lightOrange,
              ))),
      SizedBox(
        width: 20,
        height: 20,
      ),
      SocialWidgets()
    ];
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: isPhoneOrTablet
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [...socialList],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [...socialList]));
  }
}
