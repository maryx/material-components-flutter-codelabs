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

import '../colors.dart';

const _buttonBorderRadius = Radius.circular(8.0);
const spacing = SizedBox(height: 12.0);

TextTheme buildTextTheme(TextTheme base, Color color) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w600,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        body2: base.body2.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Cabin',
        displayColor: color,
        bodyColor: color,
      );
}

Widget _buildTextField(BuildContext context, String text) {
  return Theme(
    data: Theme.of(context).copyWith(
        primaryColor: Colors.white,
        textTheme: buildTextTheme(
          Theme.of(context).textTheme,
          Colors.white,
        )),
    child: TextField(
      decoration: InputDecoration(
        fillColor: blue50,
        filled: true,
        labelText: text,
      ),
    ),
  );
}

Widget buildSearchTextFields(BuildContext context, bool showSearch) {
  return Stack(
    children: <Widget>[
      Positioned(
        top: 0.0,
        child: Image.asset(
          'assets/map.png',
          fit: BoxFit.fill,
        ),
      ),
      Material(
        elevation: 8.0,
        child: Container(
          color: blue100,
          height: 200.0,
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: ListView(
            children: <Widget>[
              spacing,
              _buildTextField(context, 'De'),
              spacing,
              _buildTextField(context, 'À'),
              spacing,
              showSearch ? RaisedButton(
                child: Text('Chercher'),
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(_buttonBorderRadius),
                ),
                onPressed: () {},
              ) : Container(),
            ],
          ),
        ),
      ),
      Positioned(
        right: 16.0,
        top: 50.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            //border: Border.all(width: 1.0, color: Colors.white),
            color: blue100,
          ),
          width: 50.0,
          height: 50.0,
          child: IconButton(
            icon: RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.compare_arrows,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ),
      ),
    ],
  );
}