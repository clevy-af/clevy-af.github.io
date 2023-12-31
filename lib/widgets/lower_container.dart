import 'package:cv_clevino_dev/utils/breakpoints.dart';
import 'package:cv_clevino_dev/utils/my_colors.dart';
import 'package:cv_clevino_dev/widgets/interest_box.dart';
import 'package:cv_clevino_dev/widgets/skill_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

final List<String> interests = [
  'Coding','Memes','Board games','Music',
  'Web series','Crafting','Learning','Helping',
];

class LowerContainer extends StatelessWidget {
  final double width;
  final GlobalKey interestsKey;
  final GlobalKey skillsKey;

  const LowerContainer(
      {Key? key,
      required this.width,
      required this.interestsKey,
      required this.skillsKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        key: skillsKey,
        color: MyColors.darkBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth >= Breakpoints.lg) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // skills cards
                    SkillColumn(width: width),
                    SizedBox(width: 0.05 * width),
                    // hello with bio and info
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        EducationColumn(width: width),
                        // HelloWithBio(
                        //   ratio:0.4 ,
                        //   width: width,
                        // ),
                        // const SizedBox(
                        //   height: 30,
                        // ),
                        // Info(width: width,ratio:0.4)
                      ],
                    )
                  ],
                );
              }
              else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // skills cards
                    SkillColumn(width: 2*width),
                    // hello with bio and info
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child:EducationColumn(width: width),
                          // child: HelloWithBio(width: 3 * width,ratio: 0.3,),
                        ),
                      ],
                    )
                  ],
                );
              }
            }),
            SizedBox(
              height: width * 0.07,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left:width>=Breakpoints.lg? width * 0.1:width * 0.05),
              child: Text('My interests',
                  style: GoogleFonts.getFont('Delius',
                      color: Colors.white, fontSize: 19)),
            ),
            SizedBox(height: width * 0.03),
            // 820
            LayoutBuilder(builder: (context, constraints) {
              final double tileWidth=width * 0.76;
              if (constraints.maxWidth >= Breakpoints.lg) {
                return InterestGrid(width: tileWidth, height: 100,interestsKey: interestsKey,tileCount: 2,);
              } else if (constraints.maxWidth < Breakpoints.lg && constraints.maxWidth >= Breakpoints.sm) {
                return InterestGrid(width: tileWidth, height: 180,interestsKey: interestsKey,tileCount: 4,);
              } else {
                return InterestGrid(width: tileWidth, height: 360,interestsKey: interestsKey,tileCount: 8,);
              }
            }),
            const SizedBox(height:10)
        
          ],
        ));
  }
}

class InterestGrid extends StatelessWidget {
  const InterestGrid({
    super.key,
    required this.width,
    required this.height,
    required this.interestsKey, required this.tileCount,
  });

  final double width;
  final double height;
  final int tileCount;
  final GlobalKey<State<StatefulWidget>> interestsKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width * 0.76,
      height: height,
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 8,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) => InterestBox(
          text: interests[index],
          color: index%2==(index<4?0:1)?MyColors.primary:MyColors.darkBackground,
          textColor: index%2==(index<4?0:1)?MyColors.lightText:MyColors.primary,
          key: index == 4 ? interestsKey : null,
        ),
        staggeredTileBuilder: (int index) => StaggeredTile.fit(tileCount),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 40.0,
      ),
    );
  }
}

class SkillColumn extends StatelessWidget {
  const SkillColumn({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    final double cardWidth= 0.4*width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkillCard(
          title: 'UI/UX Development',
          timeline: "Freelancing",
          description: 'Single codebase for Android/iOS apps, Provider and Get State Management tools, MVC model.',
          icon: const FlutterLogo(),
          width:cardWidth,
        ),
        const SizedBox(height: 10),
        SkillCard(
          title: 'App Publishing',
          timeline: "Freelancing",
          description: 'Store publishing, Website hosting, Bug fixes, Maintenance',
          icon: const Icon(Icons.settings,color: Colors.deepOrange),
          width:cardWidth,
        ),
        const SizedBox(height: 10),
        SkillCard(
            title: 'Version Control',
          timeline: "Freelancing",
          description: 'git, Github, Bitbucket',
            icon: const Icon(FontAwesomeIcons.github),
          width: cardWidth,
        ),
      ],
    );
  }
}
class EducationColumn extends StatelessWidget {
  const EducationColumn({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    final double cardWidth= 0.4*width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SkillCard(
          title: 'Bachelors Degree',
          timeline: "2017-2020",
          description: 'Computer Applications: St. Xavier\'s College, Goa.',
          width:cardWidth,
        ),
        const SizedBox(height: 10),
        SkillCard(
          title: 'Higher Secondary Education',
          timeline: "2015-2017",
          description: 'Science with Maths & Computer Science: St. Xavier\'s Higher Secondary School, Goa. (Mapusa)',
          width:cardWidth,
        ),
        const SizedBox(height: 10),
        SkillCard(
            title: 'Primary & Secondary Education',
          timeline: "2015-2004",
          description: 'St. Britto\'s High School, Goa.',
          width: cardWidth,
        ),
      ],
    );
  }
}
