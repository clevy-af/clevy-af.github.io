import 'package:cv_clevino_dev/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InterestBox extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String text;
  const InterestBox(
      {required this.text,
      required this.color,
      required this.textColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(
              color: (textColor == Colors.black)
                  ? MyColors.primary
                  : textColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
          child: Text('.' + text,
              style: GoogleFonts.getFont('Delius',
                  color: textColor, fontSize: 13))),
    );
  }
}
