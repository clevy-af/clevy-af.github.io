import 'package:cv_clevino_dev/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarItemWithIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const NavBarItemWithIcon(
      {required this.text, required this.icon, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        backgroundColor: MaterialStateProperty.all<Color>(
            MyColors.brightBackground),
      ),
      icon: Icon(icon),
      onPressed:onTap,
      label: Text(text.capitalizeFirst!, style: const TextStyle(fontSize: 12)),
    );
  }
}
