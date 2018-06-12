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

const _spacing = SizedBox(height: 8.0);

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
      body: Theme(
        data: Theme.of(context).copyWith(primaryColor: blue100),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: _buildSearch(),
        ),
      ),
    ); //return AsymmetricView(products: getProducts(category));
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
        Container(
          color: blue100,
          height: 200.0,
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: ListView(
            children: <Widget>[
              _spacing,
              TextField(
                decoration: InputDecoration(
                  labelText: 'Depart',
                ),
              ),
              _spacing,
              TextField(
                decoration: InputDecoration(
                  labelText: 'Arrival',
                ),
              ),
              _spacing,
              RaisedButton(
                child: Text('Search'),
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
