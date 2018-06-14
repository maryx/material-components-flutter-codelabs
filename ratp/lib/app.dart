// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


import 'backdrop.dart';
import 'colors.dart';
import 'home.dart';
import 'category_menu_page.dart';
import 'model/product.dart';
import 'supplemental/util.dart';
import 'schedule.dart';

const _locale = Locale('fr', 'FR');

class RATPApp extends StatefulWidget {
  @override
  _RATPAppState createState() => _RATPAppState();
}

class _RATPAppState extends State<RATPApp> {
  Category _currentCategory = Category.home;

  @override
  Widget build(BuildContext context) {
    final categoryString = _currentCategory
        .toString()
        .replaceAll('Category.', '')
        .toUpperCase()
        .replaceAll('_', ' ');
    return MaterialApp(
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: <Locale>[_locale],
      debugShowCheckedModeBanner: false,
      title: 'RATP',
      home: Backdrop(
        currentCategory: _currentCategory,
        frontLayer: _getFrontLayer(),
        backLayer: CategoryMenuPage(
          currentCategory: _currentCategory,
          onCategoryTap: _onCategoryTap,
        ),
        frontTitle: Text(categoryString),
        backTitle: Text('MENU'),
      ),
      theme: _buildTheme(),
    );
  }

  /// Function to call when a [Category] is tapped.
  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  Widget _getFrontLayer() {
    switch (_currentCategory) {
      case Category.schedules:
        return SchedulePage();
      case Category.maps:
        return Image.asset(
          'assets/map.png',
          fit: BoxFit.cover,
        );
      default:
        return HomePage(category: _currentCategory);
    }
  }
}

ThemeData _buildTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: blue100,
    primaryColor: teal,
    buttonColor: teal,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    textSelectionColor: teal,
    hintColor: Colors.white,
    errorColor: red,
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
    ),
    primaryIconTheme: base.iconTheme.copyWith(color: blue100),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),
    textTheme: buildTextTheme(base.textTheme, blue100), // was white
    primaryTextTheme: buildTextTheme(base.primaryTextTheme, blue100),
    accentTextTheme: buildTextTheme(base.accentTextTheme, blue100),
    iconTheme: base.iconTheme.copyWith(color: blue100),
  );
}
