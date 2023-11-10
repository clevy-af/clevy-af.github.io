import 'package:cv_clevino_dev/screens/portfolio.dart';
import 'package:cv_clevino_dev/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor:MyColors.primary,
    statusBarColor: MyColors.primary,
  ));
  runApp( MaterialApp(
    theme: ThemeData(primaryColor:
     MyColors.primary,
     splashColor: MyColors.primary,
     highlightColor:MyColors.primary,
     
     ),
    title: 'CV',
    home: const Portfolio(),
    debugShowCheckedModeBanner: false,
  ));
}
