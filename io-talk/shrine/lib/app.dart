import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'backdrop.dart';
import 'colors.dart';
import 'home.dart';
import 'login.dart';
import 'supplemental/notched_corner_border.dart';

class ShrineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shrine',
      home: HomePage(),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
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
    accentColor: brown900,
    scaffoldBackgroundColor: white50,
    cardColor: white50,
    textSelectionColor: pink100,
    errorColor: red700,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
    ),
    textSelectionHandleColor: pink100,
    textTheme: _buildTextTheme(base.textTheme, brown900),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme, brown900),
    accentTextTheme: _buildTextTheme(base.accentTextTheme, brown900),

    // TODO login page buttonColor
    // TODO add primaryColor, pink 100, primaryIconTheme base.iconTheme.copyWith(color: kShrineBrown900

    // TODO WILL Text Fields Demo add InputDecoration
    // with NotchedCornerBorder.
  );
}

TextTheme _buildTextTheme(TextTheme base, Color color) {
  return base
      .copyWith(
        // TODO titles and headlines6
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      // TODO add font5
      .apply(
        fontFamily: 'Rubik',
        displayColor: color,
        bodyColor: color,
      );
}

ThemeData _buildAltTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    // TODO primary, button, accent, colors
    primaryColor: green700,
    accentColor: green100,
    buttonColor: green700,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: NotchedCornerBorder(),
    ),
    textTheme: _buildTextTheme(base.textTheme, green100),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme, green100),
    accentTextTheme: _buildTextTheme(base.accentTextTheme, green100),
  );
}
