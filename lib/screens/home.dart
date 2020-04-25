import 'package:flutter/material.dart';
import 'package:shopping/screens/register.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget showLogo() {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Shoping',
      style: TextStyle(
          fontSize: 30.0,
          color: Colors.red.shade400,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
          fontFamily: 'Prompt'),
    );
  }

  Widget signInButton() {
    return RaisedButton(
        color: Colors.red.shade400, child: Text('Sign in'), onPressed: () {});
  }

  Widget signUpButton() {
    return OutlineButton(
        child: Text('Sign Up'),
        onPressed: () {
          MaterialPageRoute materialPageRoute =
              MaterialPageRoute(builder: (BuildContext context) => Register());
          Navigator.of(context).push(materialPageRoute);
        });
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        signInButton(),
        SizedBox(
          width: 4.0,
        ),
        signUpButton()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  colors: [Colors.white, Colors.pink.shade200], radius: 1.0)),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                showLogo(),
                showAppName(),
                SizedBox(
                  height: 8.0,
                ),
                showButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
