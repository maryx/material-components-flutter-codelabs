import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'backdrop.dart';
import 'home.dart';
import 'login.dart';
import 'notched_corner_border.dart';
import 'supplemental/theming.dart';

class ShrineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shrine',
      home: HomePage(),
      // TODO WILL add backdrop
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      // TODO MARY Theme
      theme: _buildLightTheme(),
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name == '/login') {
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => LoginPage(),
        fullscreenDialog: true,
      );
    }

    return null;
  }
}

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    accentColor: kShrineBrown900,
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
    ),
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),

    // TODO login page buttonColor
    // TODO add primaryColor, pink 100, primaryIconTheme base.iconTheme.copyWith(color: kShrineBrown900

    // TODO WILL Text Fields Demo add InputDecoration
    // with NotchedCornerBorder.
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  // TODO MARY font colors, font
  return base
      .copyWith(
        // TODO headline on LoginPage base.copyWith w500
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        displayColor: kShrineBrown900,
      );
}

ThemeData _buildAltTheme() {
  final ThemeData base = ThemeData.dark();
  return base;
//  return base.copyWith(
//    accentColor: kShrineBrown900,
//    primaryColor: kShrinePink100,
//    // TODO add this one1
//    buttonColor: kShrinePink100,
//    scaffoldBackgroundColor: kShrineBackgroundWhite,
//    cardColor: kShrineBackgroundWhite,
//    textSelectionColor: kShrinePink100,
//    errorColor: kShrineErrorRed,
//    buttonTheme: ButtonThemeData(
//      textTheme: ButtonTextTheme.accent,
//    ),
//    primaryIconTheme: base.iconTheme.copyWith(color: kShrineBrown900),
//    // TODO text fields demo2
//    // TODO WILL Text Fields Demo
//    inputDecorationTheme: InputDecorationTheme(
//      border: NotchedCornerBorder(),
//    ),
//    // TODO text fields 3
//    textTheme: _buildShrineTextTheme(base.textTheme),
//    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
//    // TODO does a thing4
//    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
//  );
}
