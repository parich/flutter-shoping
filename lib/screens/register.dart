import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Explicit
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;

  //Method
  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('name = $nameString');
          print('email = $emailString');
          print('password = $passwordString');
        }
      },
    );
  }

  Widget nameText() {
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        icon: Icon(
          Icons.face,
          color: Colors.red.shade300,
          size: 48.0,
        ),
        labelText: 'Display Name :',
        labelStyle: TextStyle(
          color: Colors.red.shade300,
          fontWeight: FontWeight.bold,
        ),
        helperText: 'Type your Nick Name for Display',
        helperStyle: TextStyle(
          color: Colors.red.shade300,
          fontStyle: FontStyle.italic,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Your name in the blank';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        nameString = value.trim();
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(
          Icons.email,
          color: Colors.blue.shade300,
          size: 48.0,
        ),
        labelText: 'Email :',
        labelStyle: TextStyle(
          color: Colors.blue.shade300,
          fontWeight: FontWeight.bold,
        ),
        helperText: 'Type your Email',
        helperStyle: TextStyle(
          color: Colors.blue.shade300,
          fontStyle: FontStyle.italic,
        ),
      ),
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Exp. you@email.com';
        } else {}
      },
      onSaved: (String value) {
        emailString = value.trim();
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.vpn_key,
          color: Colors.green.shade300,
          size: 48.0,
        ),
        labelText: 'Password :',
        labelStyle: TextStyle(
          color: Colors.green.shade300,
          fontWeight: FontWeight.bold,
        ),
        helperText: 'Type your Password',
        helperStyle: TextStyle(
          color: Colors.green.shade300,
          fontStyle: FontStyle.italic,
        ),
      ),
      validator: (String value) {
        if (value.length < 6) {
          return 'Password More 6 Chatactor';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        passwordString = value.trim();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        title: Text('register'),
        actions: <Widget>[
          registerButton(),
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(30.0),
          children: <Widget>[
            nameText(),
            emailText(),
            passwordText(),
          ],
        ),
      ),
    );
  }
}
