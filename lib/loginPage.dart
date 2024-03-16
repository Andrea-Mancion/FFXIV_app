import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String selectedUsername = '';
  String password = '';

  final List<String> usernames = ['user1', 'user2', 'user3'];

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
            DropdownButtonFormField(
              value: selectedUsername.isEmpty ? null : selectedUsername,
              items: usernames.map((String username) {
                return DropdownMenuItem(
                  value: username,
                  child: Text(username),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedUsername = value ?? '';
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
              onPressed: () {
                // Perform login logic here using selectedUsername and password
                print('Username: $selectedUsername');
                print('Password: $password');
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}