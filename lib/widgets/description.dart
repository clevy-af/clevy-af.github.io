import 'package:cv_clevino_dev/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Description extends StatelessWidget {
  final bool isVertical;
  final double width;
  const Description(
      {required this.isVertical, required this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isVertical ? double.infinity : width * 0.29,
      child: Column(
        crossAxisAlignment: isVertical ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: 135,
              height: 40,
              alignment: Alignment.center,
              color: MyColors.primary,
              child: Text(
                'Flutter Developer',
                  style: GoogleFonts.getFont('Days One', color: MyColors.lightText, fontSize: 10),
              ),
          ),
          SizedBox(height: 0.015 * width),
          Text(
              "I'm developing Android/iOS frontend apps with single codebase.",
              style: GoogleFonts.getFont('Delius',
                  color: Colors.white38, fontSize: 30),
            textAlign: isVertical? TextAlign.center:TextAlign.left,
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: isVertical ? double.infinity : width * 0.29,
            height: 50,
            child: AnimatedTextKit(
              repeatForever: true,
              pause: const Duration(seconds: 2),
              animatedTexts: [
                TyperAnimatedText(
                  'Have an app idea?',
                    textAlign: isVertical ? TextAlign.center : TextAlign.start,
                    textStyle: GoogleFonts.getFont('Delius',
                        color: MyColors.gray,
                        fontSize: 15)),
                TyperAnimatedText(
                  'Business to go online?',
                    textAlign: isVertical ? TextAlign.center : TextAlign.start,
                    textStyle: GoogleFonts.getFont('Delius',
                        color: MyColors.gray,
                        fontSize: 15)),
                TyperAnimatedText(
                  '\nLet me code it for you.',
                    textAlign: isVertical ? TextAlign.center : TextAlign.start,
                    textStyle: GoogleFonts.getFont('Delius',
                        color: MyColors.gray,
                        fontSize: 15)),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: isVertical ?MainAxisAlignment.center:MainAxisAlignment.start,
            children: [
              Text("Ping me:",
                  style: GoogleFonts.getFont('Delius',
                      color:Colors.white,
                      fontSize: 20)),
              const IconLinkButton(
                uri: 'https://www.instagram.com/clevy_af',
                iconData: FontAwesomeIcons.instagram,
              iconColor:  Colors.pink,
              ),
              const IconLinkButton(
                uri: 'https://wa.me/919049748819',
                iconData: FontAwesomeIcons.whatsapp,
              iconColor:  Colors.green,
              ),
              const IconLinkButton(
                uri: 'mailto:clevino.dev@gmail.com',
                iconData: Icons.email_outlined,
              iconColor:  Colors.redAccent,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class IconLinkButton extends StatelessWidget {
  const IconLinkButton({
    super.key, required this.uri, required this.iconData, this.iconColor,
  });
  final String uri;
  final IconData iconData;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed:() async => await launchUrl(
        Uri.parse(uri)
    ),
        icon: Icon(iconData,color:iconColor,));
  }
}
