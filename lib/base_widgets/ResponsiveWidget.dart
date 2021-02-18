import 'package:flutter/material.dart';

//add states same as in android (landskape, landscape and dpi based Medium Small Large
class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget(
      {Key key,
      this.landscapeMediumScreen,
      this.landscapeSmallScreen,
      this.portraitMediumScreen,
      this.portraitSmallScreen,
      this.portraitLargeScreen,
      @required this.landscapeLargeScreen})
      : super(key: key);
  final Widget landscapeLargeScreen;
  final Widget landscapeMediumScreen;
  final Widget landscapeSmallScreen;
  final Widget portraitLargeScreen;
  final Widget portraitMediumScreen;
  final Widget portraitSmallScreen;

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800 && MediaQuery.of(context).size.width <= 1200;
  }

  Widget selectorLarge(BuildContext context) {
    if (isPortrait(context)) {
      if (portraitLargeScreen != null) {
        return portraitLargeScreen;
      } else if (portraitMediumScreen != null) {
        return portraitMediumScreen;
      }
      if (portraitSmallScreen != null) {
        return portraitSmallScreen;
      }
    } else if (landscapeLargeScreen != null) {
      return landscapeLargeScreen;
    } else if (landscapeMediumScreen != null) {
      return landscapeMediumScreen;
    }
    if (landscapeSmallScreen != null) {
      return landscapeSmallScreen;
    }
    return landscapeLargeScreen;
  }

  Widget selectorMedium(BuildContext context) {
    if (isPortrait(context)) {
      if (portraitMediumScreen != null) {
        return portraitMediumScreen;
      } else if (portraitSmallScreen != null) {
        return portraitSmallScreen;
      }
    } else if (landscapeMediumScreen != null) {
      return landscapeMediumScreen;
    }
    if (landscapeSmallScreen != null) {
      return landscapeSmallScreen;
    }
    return landscapeLargeScreen;
  }

  Widget selectorSmall(BuildContext context) {
    if (isPortrait(context)) {
      if (portraitSmallScreen != null) {
        return portraitSmallScreen;
      } else if (portraitMediumScreen != null) {
        return portraitMediumScreen;
      } else if (portraitLargeScreen != null) {
        return portraitLargeScreen;
      }
    } else if (landscapeSmallScreen != null) {
      return landscapeSmallScreen;
    } else if (landscapeMediumScreen != null) {
      return landscapeMediumScreen;
    }
    return landscapeLargeScreen;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return selectorLarge(context);
        } else if (constraints.maxWidth <= 1200 && constraints.maxWidth >= 800) {
          return selectorMedium(context) ?? selectorLarge(context);
        } else {
          return selectorSmall(context) ?? selectorLarge(context);
        }
      },
    );
  }
}
