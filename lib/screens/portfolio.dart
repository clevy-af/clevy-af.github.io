import 'package:cv_clevino_dev/utils/breakpoints.dart';
import 'package:cv_clevino_dev/utils/my_colors.dart';
import 'package:cv_clevino_dev/widgets/footer.dart';
import 'package:cv_clevino_dev/widgets/lower_container.dart';
import 'package:cv_clevino_dev/widgets/nav_bar.dart';
import 'package:cv_clevino_dev/widgets/upper_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  final GlobalKey interestsKey = GlobalKey();
  late final GlobalKey skillsKey;
  late final GlobalKey homeKey;
  late final ScrollController scrollController;
  late final RxBool showFloatingButton;

  @override
  void initState() {
    skillsKey = GlobalKey();
    homeKey = GlobalKey();
    scrollController = ScrollController();
    showFloatingButton = false.obs;

    scrollController.addListener(
            ()=> showFloatingButton.value = scrollController.offset >= Breakpoints.floatingButton,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: MyColors.brightBackground,
        width: width,
        child: SingleChildScrollView(
          controller: scrollController,
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 130),
                  UpperContainer(width: width),
                  LowerContainer(
                      width: width,
                      interestsKey: interestsKey,
                      skillsKey: skillsKey),
                  Container(
                    width: width,
                    height: 0.1,
                    color:MyColors.gray,
                  ),
                  Footer(width: width,scrollController: scrollController,),
                ],
              ),
              NavBar(
                width: width,
                skillsKey: skillsKey,
                intrestsKey: interestsKey,
                key: homeKey,
                scrollController: scrollController,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ObxValue<RxBool>(
              (data) => Visibility(
            visible: data.value,
            child: FloatingActionButton(
                onPressed: () => scrollController.animateTo(
                    scrollController.position.minScrollExtent,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.easeInOut),
                backgroundColor: MyColors.primary,
                child: const Icon(Icons.arrow_upward,
                    color: MyColors.darkBackground)),
          ),
          showFloatingButton,
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
