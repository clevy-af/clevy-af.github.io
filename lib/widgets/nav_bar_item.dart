import 'package:cv_clevino_dev/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  late final RxBool isHovered;
  NavBarItem({required this.text, required this.onTap, Key? key})
      : super(key: key) {
    isHovered = false.obs;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (value) {
        isHovered.value = true;
      },
      onExit: (value) {
        isHovered.value = false;
      },
      child: ObxValue<RxBool>((data) {
        return InkWell(
          splashColor: Colors.white60,
          onTap: onTap,
          child: Container(
            height: 40.0,
            width: 60,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 6,
                ),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: data.value
                        ? MyColors.primary
                        : Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                data.value
                    ? Container(
                        width: 40,
                        height: 1,
                        color: MyColors.primary,
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ),
        );
      }, isHovered),
    );
  }
}
