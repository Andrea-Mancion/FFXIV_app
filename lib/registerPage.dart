import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String username = '';
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              onChanged: (value) {
                setState(() {
                  username = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  confirmPassword = value;
                });
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (password == confirmPassword) {
                  sendRegister(username, password);
                } else {
                  print('Passwords do not match');
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> sendRegister(String username, String password) async {
    final Uri uri = Uri.parse('http://localhost:3000/register');

    try {
        final response = await http.post(
            uri,
            headers: {'Content-Type': 'application/json'}, // Specify the Content-Type header
            body: jsonEncode({'username': username, 'password': password}), // Encode the body as JSON
        );

        if (response.statusCode == 200)
            print('Okkkk registration');
        else
            print("Failed registration");
    } catch (err) {
        print('Error register ${err}');
    }
}