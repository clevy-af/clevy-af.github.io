import 'package:cv_clevino_dev/utils/breakpoints.dart';
import 'package:cv_clevino_dev/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'description.dart';
import 'my_image.dart';

class UpperContainer extends StatelessWidget {
  final double width;
  const UpperContainer({required this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: MyColors.brightBackground,
      padding: const EdgeInsets.only(bottom:20),
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth >= Breakpoints.lg) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: width * 0.02),
              Description(
                isVertical: false,
                width: width,
              ),
              const SizedBox(width: 20),
              MyImage(
                width: width,
              )
            ],
          );
        } else if (constraints.maxWidth < Breakpoints.lg && constraints.maxWidth >= Breakpoints.md) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: width * 0.07),
                MyImage(width: (2 * width) - 0.16 * width),
                SizedBox(height: 0.05 * width),
                Description(
                  isVertical: true,
                  width: width,
                ),
              ],
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: width * 0.07),
                Center(child: MyImage(width: 2 * width)),
                SizedBox(height: 0.05 * width),
                Description(isVertical: true, width: width),
              ],
            ),
          );
        }
      }),
    );
  }
}
