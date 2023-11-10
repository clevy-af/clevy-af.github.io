import 'package:cv_clevino_dev/utils/image_asset_constants.dart';
import 'package:cv_clevino_dev/utils/my_colors.dart';
import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  final double width;
  const MyImage({
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          constraints:const BoxConstraints(maxWidth:370),
          child: Image.asset(
            ImageConstants.me,
            width: width * 0.29,
            height: width * 0.3,
          ),
        ),
        Positioned(
          top: width * 0.17,
          left: 0,
          child: CircleAvatar(
            backgroundColor: MyColors.imageCircleBackground,
            radius: width * 0.07*0.5,
            child: FlutterLogo(size: width * 0.07*0.5)
          ),
        ),
        //todo add here if more skills with logos
        // Positioned(
        //   top: width * 0.19,
        //   right: width * 0.010,
        //   child:CircleAvatar(
        //       backgroundColor: MyColors.imageCircleBackground,
        //       radius:  width/2 * 0.08,
        //       child: FlutterLogo(size: width * 0.05)
        //   ),
        // ),
        Positioned(
          top: width * 0.06,
          right: width * 0.016,
          child: CircleAvatar(
            backgroundColor: MyColors.imageCircleBackground,
            radius: width*0.4 * 0.06,
            child: Image.asset(
              ImageConstants.rest,
              width: width*0.4 * 0.06,
              height: width * 0.058,
            ),
          ),
        ),
        Positioned(
          top: width * 0.04,
          left: width * 0.025,
          child: Container(
            width: width * 0.007,
            height: width * 0.007,
            decoration: const BoxDecoration(
                color: MyColors.primary,
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ),
        Positioned(
          top: width * 0.19,
          right: 1,
          child: Container(
            width: width * 0.007,
            height: width * 0.007,
            decoration: const BoxDecoration(
                color: MyColors.purple,
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        ),
        Positioned(
          top: width * 0.28,
          right: width * 0.08,
          child: Container(
            width: width * 0.007,
            height: width * 0.007,
            decoration: const BoxDecoration(
                color: MyColors.secondary,
                borderRadius: BorderRadius.all(Radius.circular(50))
            ),
          ),
        ),
        Positioned(
          top: width * 0.01,
          right: 1,
          child: Container(
            width: width * 0.012,
            height: width * 0.012,
            decoration: const BoxDecoration(
                color: MyColors.darkBackground,
                borderRadius: BorderRadius.all(Radius.circular(50))),
          ),
        )
      ],
    );
  }
}
