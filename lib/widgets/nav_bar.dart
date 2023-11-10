import 'package:cv_clevino_dev/utils/breakpoints.dart';
import 'package:cv_clevino_dev/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'html_tag.dart';
import 'nav_bar_button.dart';
import 'nav_bar_item.dart';
import 'nav_bar_item_with_icon.dart';


class NavBar extends StatelessWidget {
  final double width;
  final GlobalKey intrestsKey;
  final GlobalKey skillsKey;
  final ScrollController scrollController;
  late final RxDouble collapsableHeight;
  NavBar(
      {required this.width,
      required this.intrestsKey,
      required this.skillsKey,
      required this.scrollController,
      Key? key})
      : super(key: key) {
    collapsableHeight = 0.0.obs;
  }

  void scrollToWidgetByKey(GlobalKey key) {
    RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    Offset position = box.localToGlobal(Offset.zero); //this is global position
    double y = position.dy;
    scrollController.animateTo(y,
        duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
    toggleDropdown();
  }
  toggleDropdown(){
    if (collapsableHeight.value == 0.0) {
      collapsableHeight.value = 240.0;
    } else if (collapsableHeight.value == 240.0) {
      collapsableHeight.value = 0.0;
    }
  }
  Future<void> launchSite(String uri) async {
    await launchUrl(Uri.parse(uri));
  }
  @override
  Widget build(BuildContext context) {

    final List<Map<String,VoidCallback>> navbarList=[
      {
        'About':toggleDropdown,
      },
      {
        'Skills':() =>scrollToWidgetByKey(skillsKey),
      },
      {
        'Interests':() =>scrollToWidgetByKey(intrestsKey),
      },
      {
        'Github':() async =>launchSite('https://github.com/clevy-af'),
      },
      {
        'Facebook':() async =>launchSite('https://www.facebook.com/clevino'),
      },
      {
        'Linkedin':() async =>launchSite('https://www.linkedin.com/in/clevino-fernandes-64ba1a1a6/'),
      },
    ];
    Widget navBarRow = Stack(
        children: [
      Padding(
        padding: EdgeInsets.only(left: width * 0.04),
        child: HtmlTag(width: width,scrollController: scrollController,isClosingTag: false),
      ),
      Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            NavBarItem(
              text: navbarList[0].keys.first,
              onTap: navbarList[0].values.first,
            ),
            NavBarItem(
              text: navbarList[1].keys.first,
              onTap: navbarList[1].values.first,
            ),
            NavBarItem(
              text: navbarList[2].keys.first,
              onTap: navbarList[2].values.first,
            ),
            const SizedBox(width: 60),
          ]),
          Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
        const SizedBox(width: 50),
        Row(children: [
          NavBarItemWithIcon(
            icon: FontAwesomeIcons.github,
            text: navbarList[3].keys.first,
            onTap: navbarList[3].values.first,
          ),
          const SizedBox(width: 10),
          NavBarItemWithIcon(
              icon: FontAwesomeIcons.facebook,
            text: navbarList[4].keys.first,
            onTap: navbarList[4].values.first,
          ),
          const SizedBox(width: 10),
          NavBarItemWithIcon(
              icon: FontAwesomeIcons.linkedin,
            text: navbarList[5].keys.first,
            onTap: navbarList[5].values.first,),
          const SizedBox(width: 50),
        ])
      ])
    ]);
    List<Widget> navBarColumn = [
      NavBarItem(
        text: navbarList[0].keys.first,
        onTap: navbarList[0].values.first,
      ),
      const SizedBox(width: 10),
      NavBarItem(
        text: navbarList[1].keys.first,
        onTap: navbarList[1].values.first,
      ),
      const SizedBox(width: 10),
      NavBarItem(
        text: navbarList[2].keys.first,
        onTap: navbarList[2].values.first,
      ),
      NavBarItem(
        text: navbarList[3].keys.first,
        onTap: navbarList[3].values.first,
      ),
      NavBarItem(
        text: navbarList[4].keys.first,
        onTap: navbarList[4].values.first,
      ),
      NavBarItem(
      text: navbarList[5].keys.first,
    onTap: navbarList[5].values.first,
      ),
    ];
    return Stack(
      children: [
        ObxValue<RxDouble>(
            (data) => AnimatedContainer(
                  margin: const EdgeInsets.only(top: 110.0),
                  duration: const Duration(milliseconds: 375),
                  curve: Curves.ease,
                  height: data.value,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: MyColors.darkBackground,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: navBarColumn,
                    ),
                  ),
                ),
            collapsableHeight),
        Container(
          height: 80.0,
          margin: const EdgeInsets.only(top: 40.0),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: (width < Breakpoints.xlg)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: width * 0.04),
                        child: HtmlTag(
                          width: width,scrollController: scrollController,
                          isClosingTag: false,
                        )
                    ),
                    NavBarButton(
                        onPressed: toggleDropdown,
                        width: width,
                    ),
                  ],
                )
              : navBarRow,
        ),
      ],
    );
  }
}
