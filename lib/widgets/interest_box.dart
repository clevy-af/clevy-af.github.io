import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InterestBox extends StatelessWidget {
  final Color color;
  final Color borderColor;
  final String text;
  final String suffix;
  const InterestBox(
      {required this.text,
      required this.color,
      required this.borderColor,
      Key? key, required this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 170,
      padding: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
          color: color,
          gradient: LinearGradient(colors: [color.withAlpha(30),borderColor.withAlpha(30)],),
          border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
          child: Text( text+suffix,
              style: GoogleFonts.getFont('Delius',
                  color: Colors.white, fontSize: 13))),
    );
  }
}
