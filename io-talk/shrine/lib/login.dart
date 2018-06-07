import 'package:flutter/material.dart';

import 'colors.dart';
import 'supplemental/cut_corners_border.dart';

const _borderRadius = BorderRadius.all(Radius.circular(7.0));

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Widget _buildLogo() {
    return Column(
      children: <Widget>[
        Image.asset('assets/diamond.png'),
        SizedBox(height: 16.0),
        Text(
          'SHRINE',
          style: Theme.of(context).textTheme.headline,
        ),
      ],
    );
  }

  Widget _buildButtonBar() {
    return ButtonBar(
      children: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: () {
            _usernameController.clear();
            _passwordController.clear();
          },
        ),
        RaisedButton(
          child: Text('NEXT'),
          elevation: 8.0,
          shape: BeveledRectangleBorder(borderRadius: _borderRadius),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, bool isPassword) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: kShrineBrown),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: CutCornersBorder(),
        ),
        obscureText: isPassword,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            _buildLogo(),
            SizedBox(height: 120.0),
            _buildTextField('Username', _usernameController, false),
            SizedBox(height: 12.0),
            _buildTextField('Password', _passwordController, true),
            _buildButtonBar(),
          ],
        ),
      ),
    );
  }
}
