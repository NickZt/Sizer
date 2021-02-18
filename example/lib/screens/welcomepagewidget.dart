import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer_mod/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../util/color_util.dart';

class WelcomePage extends StatefulWidget {
  final List<Widget> children;

  final scrollDirection;
  final Function doOnEndOfPages;
  final PageController _pageController = PageController();
  final int pageIndex;

  @override
  _WelcomePage createState() => _WelcomePage(pageIndex);

  WelcomePage(
      {Key key,
      this.pageIndex = 0,
      this.scrollDirection = Axis.horizontal,
      this.doOnEndOfPages,
      this.children = const <Widget>[]})
      : super(key: key);
}

class _WelcomePage extends State<WelcomePage> {
  int pageIndex;

  _WelcomePage(this.pageIndex);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
            bottom: SizerUtil.deviceType == DeviceType.Tablet ? 1.0.h : 0.0,
            right: SizerUtil.deviceType == DeviceType.Tablet ? 2.0.w : 0.0),
        child: SizedBox(
          height: 7.0.h,
          width: 7.0.h,
          child: FloatingActionButton(
            onPressed: () {
              if (pageIndex < widget.children.length - 1) {
                print('val < :: $pageIndex ');
                widget._pageController.animateToPage(pageIndex + 1,
                    duration: Duration(milliseconds: 500), curve: Curves.decelerate);
              } else {
                print('val > :: $pageIndex ');
                widget.doOnEndOfPages == null
                    ? widget._pageController.animateToPage(0,
                        duration: Duration(milliseconds: 500), curve: Curves.decelerate)
                    : widget.doOnEndOfPages();
              }
            },
            child: Icon(
              pageIndex < widget.children.length - 1 ? Icons.arrow_forward : Icons.done,
              size: 3.0.h,
            ),
            backgroundColor: getColor(),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        // padding: EdgeInsets.only(top: 0),
        child: Stack(
          children: [
            PageView(
              scrollDirection: widget.scrollDirection,
              controller: widget._pageController,
              onPageChanged: (value) {
                print('val:: $value');
                setState(() {
                  pageIndex = value;
                });
              },
              children: widget.children,
            ),
            widget.scrollDirection == Axis.vertical ? widDotsVertical() : widDotsHorizontal(),
          ],
        ),
      ),
    );
  }

  widDotsHorizontal() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 4.0.h),
        child: SmoothPageIndicator(
          controller: widget._pageController,
          count: widget.children.length,
          axisDirection: Axis.horizontal,
          effect: ExpandingDotsEffect(
              expansionFactor: 2.5,
              spacing: 1.5.w,
              radius: 100.0.w,
              dotWidth: 1.5.h,
              dotHeight: 1.5.h,
              paintStyle: PaintingStyle.fill,
              dotColor: Colors.grey[300],
              activeDotColor: getColor()),
        ),
      ),
    );
  }

  widDotsVertical() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(bottom: 4.0.h),
        child: SmoothPageIndicator(
          controller: widget._pageController,
          count: widget.children.length,
          axisDirection: Axis.vertical,
          effect: ExpandingDotsEffect(
              expansionFactor: 2.5,
              spacing: 1.5.w,
              radius: 100.0.w,
              dotWidth: 1.5.h,
              dotHeight: 1.5.h,
              paintStyle: PaintingStyle.fill,
              dotColor: Colors.grey[300],
              activeDotColor: getColor()),
        ),
      ),
    );
  }

  widDotsNoSmoothVertical() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: 30.0),
        child: SmoothPageIndicator(
          controller: widget._pageController,
          count: widget.children.length,
          axisDirection: Axis.horizontal,
          effect: ExpandingDotsEffect(
              expansionFactor: 2.5,
              spacing: 5.0,
              radius: 100.0,
              dotWidth: 10.0,
              dotHeight: 10.0,
              paintStyle: PaintingStyle.fill,
              dotColor: Colors.grey[300],
              activeDotColor: getColor()),
        ),
      ),
    );
  }

  getColor() {
    switch (pageIndex) {
      case 0:
        return ColorUtil.color1();
      case 1:
        return ColorUtil.color2();
      case 2:
        return ColorUtil.color3();
      case 3:
        return ColorUtil.color4();
      default:
        return ColorUtil.color4();
    }
  }
}
