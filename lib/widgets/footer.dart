import 'package:cv_clevino_dev/utils/breakpoints.dart';
import 'package:cv_clevino_dev/utils/my_colors.dart';
import 'package:cv_clevino_dev/widgets/html_tag.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Footer extends StatelessWidget {
  final double width;
  final ScrollController scrollController;
  const Footer({required this.width,required this.scrollController, Key? key}) : super(key: key);
  List<Widget> get footerText{
    return [
      Text('© 2024',
          style: GoogleFonts.getFont('Delius',
              color: MyColors.gray,
              fontSize: 14)),
     if(!isLarge) const SizedBox(height: 10),
      Text(' All rights reserved',
          style: GoogleFonts.getFont('Delius',
              color: MyColors.gray,
              fontSize: 14)),
      if(!isLarge) const SizedBox(height: 10),
      Text('clevino.dev@gmail.com',
          style: GoogleFonts.getFont('Delius',
              color: MyColors.gray,
              fontSize: 14)),
    ];
}
  @override
  Widget build(BuildContext context) {
    return Container(
        color: MyColors.darkBackground,
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: width,
        child: isLarge ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(child: SizedBox(width: 10),),
               ...footerText,
                const Flexible(flex: 2, child: SizedBox(width: 10),),
                HtmlTag(width: width,scrollController: scrollController,isClosingTag: true)
              ],
            )
          : Column(
              children: [
                ...footerText,
                const SizedBox(height: 20),
                HtmlTag(width: width,scrollController: scrollController,isClosingTag: true)

              ],
            ),
    );
  }

  bool get isLarge => width > Breakpoints.md;
}
