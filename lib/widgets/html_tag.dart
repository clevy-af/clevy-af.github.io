import 'package:cv_clevino_dev/utils/breakpoints.dart';
import 'package:cv_clevino_dev/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HtmlTag extends StatelessWidget {
  final double width;
  final bool isClosingTag;
  final ScrollController scrollController;
  const HtmlTag({required this.width, required this.scrollController, Key? key, required this.isClosingTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => scrollController.animateTo(
          scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOut),
      child: SizedBox(
        width: width >= Breakpoints.xlg ? width * 0.24 : Breakpoints.xlg * 0.24,
        height: width >= Breakpoints.xlg ? 0.04 * width : 0.04 * Breakpoints.xlg,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Row(
            children: [
              Text.rich(
                TextSpan(
                    text: '<',
                children: [
                  if(isClosingTag)
                  const TextSpan(
                    text: '/',
                    style: TextStyle(color:MyColors.primary)
                  ) ,
                  const TextSpan(
                    text: '>',
                  ) ,
                  const TextSpan(
                    text: ' ',
                  ) ,
                  const TextSpan(
                    text: 'Clevino Alrin',
                    style:TextStyle(color:MyColors.primary),
                  )
                ]),
                style: GoogleFonts.getFont('Delius',
                    color:Colors.white, fontSize: 30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
