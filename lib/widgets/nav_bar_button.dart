import 'package:cv_clevino_dev/utils/breakpoints.dart';
import 'package:cv_clevino_dev/utils/my_colors.dart';
import 'package:flutter/material.dart';

class NavBarButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double width;

  const NavBarButton({required this.width, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: const Icon(Icons.menu, color: Colors.white),
      style: ElevatedButton.styleFrom(
        foregroundColor: MyColors.brightBackground,
        backgroundColor: MyColors.darkBackground,
        elevation: 4.0,
        shape: const CircleBorder(),
        padding: EdgeInsets.all(0.03 *(width >= Breakpoints.md?  width :762)), // <-- Splash color
      ),
    );
  }
}
