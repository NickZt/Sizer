# sizer

A flutter plugin for Easily make Flutter apps responsive. Automatically adapt UI to different screen sizes. Responsiveness made simple.

This package based on https://github.com/TechnoUrmish/Sizer
The modification adds a little sugar and also makes it possible to bring the adaptive layout on flutter
closer to what is usual on android studio xml layout design.

Look into example, its more clear

![Alt Text](https://github.com/NickZt/sizer_mod/blob/master/example/images/full.mp4)



![Alt Text](https://github.com/NickZt/sizer_mod/blob/master/example/images/portrait_land_mob.gif)



![Alt Text](https://github.com/NickZt/sizer_mod/blob/master/example/images/portrait_mob.gif)






![Alt Text](https://github.com/NickZt/sizer_mod/blob/master/example/images/img_ss_with_lib.png)

![Alt Text](https://github.com/NickZt/sizer_mod/blob/master/example/images/img_ss_without_lib.png)


## Installation ⬇️
Add to pubspec.yaml.
```
dependencies:
  ...
  sizer: ^1.1.7  // for TechnoUrmish or
  sizer_mod: ^0.0.1 // for this version
```

## Parameters ⚙️ 

* `.h` - (double) for widget height
* `.w` - (double) for widget width
* `.sp` - (double) for font size
* `SizerUtil.orientation` - for screen orientation portrait or landscape
* `SizerUtil.deviceType` - for device type mobile or tablet

## How to use 💻

Add the following imports to your Dart code: 
```
import 'package:sizer/sizer.dart';
```


* First need to Initialize SizerUtil.init() method inside main.dart.
* In main.dart must have to use LayoutBuilder and OrientationBuilder. 
* See below explain for more details.


```
import 'package:flutter/material.dart';
import 'login_screen.dart'; 
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(                           //return LayoutBuilder
      builder: (context, constraints) {
        return OrientationBuilder(                  //return OrientationBuilder
          builder: (context, orientation) {
            //initialize SizerUtil()
            SizerUtil().init(constraints, orientation);  //initialize SizerUtil
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Sizer',
              theme: ThemeData.light(),
              home: LoginScreen(),
            );
          },
        );
      },
    );
  }
}
```

You can use it like this: 

Whenever you use height and width first import sizer package.
```
import 'package:sizer/sizer.dart';
```

**Widget Size** 🕓
```
    Container(
      width: 20.0.w,    //It will take a 20% of screen width
      height:30.0.h     //It will take a 30% of screen height
    )
```

**Padding** ⏹
```
    Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 3.0.h),
      child: Container(),
    );
```

**Font size** 🆎
```
    Text(
      'Sizer',style: TextStyle(fontSize: 15.0.sp),
    );
```

**Square Widget** 🟩

If you want to make square size widget then give height or width in both height and width.
```
    Container(
            width: 30.0.h,      //It will take a 30% of screen height
            height: 30.0.h,     //It will take a 30% of screen height
    );
```

**Orientation** 🔄

If you want to give support for landscape
```
appBar() {
    return SizerUtil.orientation == Orientation.portrait
        ? Container(
            width: 100.0.w,
            height: 20.0.h,
          )                     //for portrait screen
        : Container(
            width: 100.0.w,
            height: 12.0.h,
          );                    //for landscape screen
  }
```

**DeviceType** 📱

If you want the same layout to look different in tablet and mobile then use ``SizerUtil.getDeviceType`` method
```
SizerUtil.getDeviceType
```

You can use it like this:
```
 appBar() {
    return SizerUtil.deviceType == DeviceScreenType.Tablet
        ? Container(
            width: 100.0.w,
            height: 20.0.h,
          )                     //for Tablet
        : Container(
            width: 100.0.w,
            height: 12.0.h,
          );                    //for Mobile
  }
```

## Issue and feedback 💭 

If you have any suggestion for including a feature or if something doesn't work, feel free to open a Github [issue](https://github.com/NickZt/sizer_mod/issues) for us to have a discussion on it.
