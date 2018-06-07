import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'backdrop.dart';
import 'colors.dart';
import 'home.dart';
import 'login.dart';
import 'model/product.dart';
import 'supplemental/cut_corners_border.dart';
import 'supplemental/menu_page.dart';

class _ShrineAppState extends State<ShrineApp> {
  Category _currentCategory = Category.all;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shrine',
      home: Backdrop(
        frontPanel: HomePage(),
        backPanel: MenuPage(),
      ),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: _buildLightTheme(),
    );
  }

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }
}

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: kShrinePink,
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme, kShrineBrown),
    primaryIconTheme: base.iconTheme.copyWith(color: kShrineBrown),
    buttonColor: kShrinePink,
    accentColor: kShrineBrown,
    scaffoldBackgroundColor: kShrineWhite,
    cardColor: Colors.white,
    textSelectionColor: kShrinePink,
    errorColor: kShrineError,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
    ),
    textSelectionHandleColor: kShrinePink,
    accentTextTheme: _buildTextTheme(base.accentTextTheme, kShrineBrown),
    textTheme: _buildTextTheme(base.textTheme, kShrineBrown),
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
    primaryColor: kShrinePurple,
    accentColor: kShrinePurple,
    buttonColor: kShrineGreen,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: CutCornersBorder(),
    ),
    textTheme: _buildTextTheme(base.textTheme, Colors.white),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme, Colors.white),
    accentTextTheme: _buildTextTheme(base.accentTextTheme, Colors.white),
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

class ShrineApp extends StatefulWidget {
  @override
  _ShrineAppState createState() => _ShrineAppState();
}
