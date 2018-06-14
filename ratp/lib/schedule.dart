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
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'colors.dart';
import 'model/product.dart';
import 'dart:async';

import 'supplemental/util.dart';

const _buttonBorderRadius = Radius.circular(8.0);

class SchedulePage extends StatefulWidget {
  static const String routeName = '/material/date-and-time-pickers';

  final Category category;

  const SchedulePage({this.category: Category.home});

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<SchedulePage> {
  DateTime _date = new DateTime.now();
  TimeOfDay _time = const TimeOfDay(hour: 7, minute: 28);
  Color _departColor = Colors.white;
  Color _arriveColor = blue100;
  bool _checked = false;
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'fr_FR';
    return Scaffold(
      backgroundColor: blue100,
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: blue100,
        height: MediaQuery.of(context).size.height,
        child: _buildSchedules(),
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      children: <Widget>[
        SizedBox(
          height: 50.0,
          width: 150.0,
          child: RaisedButton(
            color: _departColor,
            child: Text('Départ'),
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: _buttonBorderRadius,
                  bottomLeft: _buttonBorderRadius),
            ),
            onPressed: () {
              if (_arriveColor == Colors.white) {
                setState(() {
                  _departColor = Colors.white;
                  _arriveColor = blue100;
                });
              }
            },
          ),
        ),
        SizedBox(
          height: 50.0,
          width: 150.0,
          child: RaisedButton(
            color: _arriveColor,
            child: Text('Arrivée'),
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: _buttonBorderRadius,
                  bottomRight: _buttonBorderRadius),
            ),
            onPressed: () {
              if (_departColor == Colors.white) {
                setState(() {
                  _arriveColor = Colors.white;
                  _departColor = blue100;
                });
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSchedules() {
    return DropdownButtonHideUnderline(
      child: SafeArea(
        top: false,
        bottom: false,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            buildSearchTextFields(context, false),
            _buildButtons(),
            spacing,
            _DateTimePicker(
              labelText: 'Date',
              selectedDate: _date,
              selectedTime: _time,
              selectDate: (DateTime date) {
                setState(() {
                  _date = date;
                });
              },
              selectTime: (TimeOfDay time) {
                setState(() {
                  _time = time;
                });
              },
            ),
            spacing,
            Container(
            color: Colors.white,
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: _checked,
                    onChanged: (bool checked) {},
                    activeColor: Colors.white,
                  ),
                  Text('Itinéraires accessibles'),
                ],
              ),
            ),
            spacing,
            FlatButton(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Icon(Icons.arrow_forward),
                  Text("C'est parti"),
                ],
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(_buttonBorderRadius),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _InputDropdown extends StatelessWidget {
  const _InputDropdown(
      {Key key,
      this.child,
      this.labelText,
      this.valueText,
      this.valueStyle,
      this.onPressed})
      : super(key: key);

  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: onPressed,
      child: new InputDecorator(
        decoration: new InputDecoration(
          labelText: labelText,
        ),
        baseStyle: valueStyle,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text(valueText, style: valueStyle),
            new Icon(
              Icons.arrow_drop_down,
              color: Colors.white70,
            ),
          ],
        ),
      ),
    );
  }
}

class _DateTimePicker extends StatelessWidget {
  final String labelText;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;
  final ValueChanged<DateTime> selectDate;
  final ValueChanged<TimeOfDay> selectTime;

  const _DateTimePicker({
    Key key,
    this.labelText,
    this.selectedDate,
    this.selectedTime,
    this.selectDate,
    this.selectTime,
  }) : super(key: key);

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        locale: Locale('fr', 'FR'),
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2015, 8),
        lastDate: new DateTime(2101));
    if (picked != null && picked != selectedDate) selectDate(picked);
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked =
        await showTimePicker(context: context, initialTime: selectedTime);
    if (picked != null && picked != selectedTime) selectTime(picked);
  }

  Widget _buildDropdowns(BuildContext context) {
    final TextStyle valueStyle =
        Theme.of(context).textTheme.title.copyWith(color: Colors.white);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        new Expanded(
          flex: 4,
          child: new _InputDropdown(
            labelText: labelText,
            valueText: new DateFormat.yMMMd().format(selectedDate),
            valueStyle: valueStyle,
            onPressed: () {
              _selectDate(context);
            },
          ),
        ),
        const SizedBox(width: 12.0),
        new Expanded(
          flex: 3,
          child: new _InputDropdown(
            valueText: selectedTime.format(context),
            valueStyle: valueStyle,
            onPressed: () {
              _selectTime(context);
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildDropdowns(context),
      ],
    );
  }
}
