import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer_mod/sizer_mod.dart';
import 'package:sizer_mod/base_widgets/responsive_widget.dart';
import 'first_page_screen.dart';
import 'first_page_screen_without_sizer.dart';
import 'fourth_page_screen.dart';
import 'second_page_screen.dart';
import 'third_page_screen.dart';

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
    final listOfPages = <Widget>[
      FirstPageScreen(),
      SecondPageScreen(),
      ThirdPageScreen(),
      FourthPageScreen(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: SizerUtil.orientation == Orientation.portrait
            ? const Text('portrait')
            : const Text('landscape'),
      ),
      body: ResponsiveWidget(
        landscapeLargeScreen: WelcomePage(
          pageIndex: 0,
          scrollDirection: Axis.vertical,
          children: listOfPages,
        ),
        portraitLargeScreen: WelcomePage(
          pageIndex: 0,
          scrollDirection: Axis.horizontal,
          children: listOfPages,
        ),
      ),
    );
  }
}
