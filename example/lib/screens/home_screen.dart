import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../util/color_util.dart';
import 'first_page_screen.dart';
import 'first_page_screen_without_sizer.dart';
import 'fourth_page_screen.dart';
import 'second_page_screen.dart';
import 'third_page_screen.dart';
import 'welcomepagewidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController = PageController();
  int _pageIndex = 0;
  final mScrollDirection = Axis.vertical;

  @override
  Widget build(BuildContext context) {
    return WelcomePage(
      pageIndex: 0,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        FirstPageScreen(),
        SecondPageScreen(),
        ThirdPageScreen(),
        FourthPageScreen(),
      ],
    );
  }
}
