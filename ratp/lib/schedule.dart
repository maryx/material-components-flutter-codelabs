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
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'util.dart';

const _buttonBorderRadius = Radius.circular(8.0);
const _padding = EdgeInsets.symmetric(horizontal: 40.0);

class SchedulePage extends StatefulWidget {
  final Category category;
  static const String routeName = '/material/date-and-time-pickers';
  const SchedulePage({this.category: Category.home});

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<SchedulePage> {
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 28);
  Color _departColor = Colors.white;
  Color _arriveColor = blue100;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    Intl.defaultLocale = 'fr_FR';

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: blue100,
        height: MediaQuery.of(context).size.height,
        child: DropdownButtonHideUnderline(
          child: SafeArea(
            top: false,
            bottom: false,
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                buildSearchTextFields(context, false),
                _buildButtons(),
                spacing,
                _buildDatePicker(),
                spacing,
                _buildCheckbox(),
                spacing,
                _buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 50.0,
          width: 150.0,
          child: RaisedButton(
            color: _departColor,
            child: Text(
              'Départ',
              style: Theme.of(context).textTheme.body1.copyWith(color: teal),
            ),
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
            child: Text('Arrivée',
                style: Theme.of(context).textTheme.body1.copyWith(color: teal)),
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

  Widget _buildDatePicker() {
    return Padding(
      padding: _padding,
      child: _DateTimePicker(
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
    );
  }

  Widget _buildCheckbox() {
    return Container(
      margin: _padding,
      child: Row(
        children: <Widget>[
          Icon(Icons.accessible),
          Checkbox(
            value: false,
            onChanged: (bool checked) {},
          ),
          Text(
            'Itinéraires accessibles',
            style:
                Theme.of(context).textTheme.body1.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: _padding,
      child: SizedBox(
        height: 50.0,
        child: RaisedButton(
          elevation: 8.0,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: teal),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_forward),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  "C'est parti",
                  style:
                      Theme.of(context).textTheme.body1.copyWith(color: teal),
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(_buttonBorderRadius),
          ),
          onPressed: () {},
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
    return InkWell(
      onTap: onPressed,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: labelText,
        ),
        baseStyle: valueStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(valueText, style: valueStyle),
            Icon(
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
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
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
        Expanded(
          flex: 4,
          child: _InputDropdown(
            labelText: labelText,
            valueText: DateFormat.yMMMd().format(selectedDate),
            valueStyle: valueStyle,
            onPressed: () {
              _selectDate(context);
            },
          ),
        ),
        SizedBox(width: 12.0),
        Expanded(
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
