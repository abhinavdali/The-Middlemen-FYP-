import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import 'Constants/const.dart';
import 'UI/Splashscreen/splashscreen.dart';

void main() {
  runApp(const TheMiddlemen());
}

class TheMiddlemen extends StatelessWidget {
  const TheMiddlemen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: kStyleAppColor,
        systemNavigationBarColor: Colors.black,
        // statusBarBrightness: Brightness.light,
      ),
    );
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: [SystemUiOverlay.top]);

    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          initialRoute: '/1',
          routes: <String, WidgetBuilder>{

            '/1': (context) => const SplashScreen(),
            '/': (context) => const SplashScreen(),

          },
          theme: Theme.of(context).copyWith(
            appBarTheme: Theme.of(context)
                .appBarTheme
                .copyWith(brightness: Brightness.light),
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}