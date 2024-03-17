import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'connectedPage.dart';
import 'dart:async';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  String name = 'FFXIV_app';
  int test = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
            ElevatedButton(
              onPressed: () async {
                if (await ifUserExist(username, password, name))
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConnectedPage()),
                  );
                }
                else
                {
                  print('User does not exist');
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<bool> ifUserExist(String username, String password, String name) async {
  final Uri url = Uri.parse('http://localhost:8082/login');

  try {
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
        'name': name,
      }),
    );

    print("Responde status code: ${response.statusCode}");
    if (response.statusCode == 200) {
      return true;
    }
  } catch (err) {
    print('Error: $err');
  }

  return false;
}