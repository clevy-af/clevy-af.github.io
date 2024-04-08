import 'package:cv_clevino_dev/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillCard extends StatelessWidget {
  final String title;
  final String description;
  final String timeline;
  final double width;
  final Widget? icon;
  const SkillCard(
      {required this.title,
      required this.description,required this.timeline,
        this.icon, required this.width,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('cardWidth:$width');
    return Card(
      color: MyColors.brightBackground,
      child: SizedBox(
        width: width,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: GoogleFonts.getFont('Delius',
                          color:  Colors.white,
                          fontSize: 16,fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(timeline,
                      style: GoogleFonts.getFont('Delius',
                          color:MyColors.primary, fontSize: 15)),
                  const SizedBox(height: 10),
                  Text(description,
                      style: GoogleFonts.getFont('Delius',
                          color: MyColors.gray,
                          fontSize: 12)),
                ],
              ),
            ),
             if(icon!=null)
             Positioned(
                    child: icon!,
                    top: 20,
                    right: 20,
                    width: 20,
                    height: 18,
             ),
          ],
        ),
      ),
    );
  }
}
