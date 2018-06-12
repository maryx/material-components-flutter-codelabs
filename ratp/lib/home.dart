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

import 'colors.dart';
import 'model/data.dart';
import 'model/product.dart';
import 'supplemental/asymmetric_view.dart';

const _spacing = SizedBox(height: 12.0);
const _buttonBorderRadius = Radius.circular(7.0);

class HomePage extends StatefulWidget {
  final Category category;

  const HomePage({this.category: Category.home});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: _buildSearch(),
      ),
    );
  }

  Widget _buildTextField(String text) {
    return Theme(
      data: Theme.of(context).copyWith(
            primaryColor: Colors.white,
          ),
      child: TextField(
        decoration: InputDecoration(
          fillColor: blue50,
          filled: true,
          labelText: text,
        ),
      ),
    );
  }

  Widget _buildSearch() {
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
                _spacing,
                _buildTextField('De'),
                _spacing,
                _buildTextField('À'),
                _spacing,
                Row(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Départ'),
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: _buttonBorderRadius,
                            bottomLeft: _buttonBorderRadius),
                      ),
                      onPressed: () {},
                    ),
                    RaisedButton(
                      child: Text('Arrivée'),
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: _buttonBorderRadius,
                            bottomRight: _buttonBorderRadius),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
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
}
