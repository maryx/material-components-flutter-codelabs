import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'backdrop.dart';
import 'colors.dart';
import 'home.dart';
import 'login.dart';
import 'supplemental/cut_corners_border.dart';

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
      theme: _buildLightTheme(),
    );
  }
}

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: brown,
    scaffoldBackgroundColor: white,
    cardColor: white,
    textSelectionColor: pink,
    errorColor: red,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
    ),
    textSelectionHandleColor: pink,
    accentTextTheme: _buildTextTheme(base.accentTextTheme, brown),
    textTheme: _buildTextTheme(base.textTheme, brown),
    primaryColor: pink,
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme, brown),
    primaryIconTheme: base.iconTheme.copyWith(color: brown),
    buttonColor: pink,
  );
}

TextTheme _buildTextTheme(TextTheme base, Color color) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
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
    primaryColor: green100,
    accentColor: green200,
    buttonColor: green200,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: CutCornersBorder(),
    ),
    textTheme: _buildTextTheme(base.textTheme, green100),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme, green100),
    accentTextTheme: _buildTextTheme(base.accentTextTheme, green100),
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
