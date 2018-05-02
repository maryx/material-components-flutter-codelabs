import 'package:flutter/material.dart';

import 'supplemental/theming.dart';
import 'notched_corner_border.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Column _buildLogo() {
    return Column(
      children: <Widget>[
        Image.asset('assets/diamond.png'),
        const SizedBox(height: 16.0),
        Text(
          'SHRINE',
          // TODO will update below
          style: Theme.of(context).textTheme.headline,
          //style: Theme.of(context).textTheme.headline.copyWith(fontSize: 50.0),
        ),
      ],
    );
  }

  // TODO Demo 1 start
//  Widget _buildTextField(
//      String label, TextEditingController controller, bool obscureText) {
//    return new TextField(
//      controller: controller,
//      decoration: new InputDecoration(
//        labelText: label,
//      ),
//    );
//  }

  // TODO Demo 1 result
  Widget _buildTextField(
      String label, TextEditingController controller, bool obscureText) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: kShrineBrown900),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
        ),
        obscureText: obscureText,
      ),
    );
  }

  Widget _buildButtonBar() {
    return ButtonBar(
      children: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          // TODO demo 2
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
          ),
          onPressed: () {
            _usernameController.clear();
            _passwordController.clear();
          },
        ),
        RaisedButton(
          child: Text('NEXT'),
          elevation: 8.0,
          // TODO demo 2
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO step 0: Start here
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            // TODO Will delete outer container
            Container(
              child: _buildLogo(),
              height: 80.0,
            ),
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
