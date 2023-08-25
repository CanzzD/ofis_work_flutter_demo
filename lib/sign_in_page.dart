import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'create_new_user.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _adController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _kullaniciOlustur() async {
    String ad = _adController.text;
    String email = _emailController.text;

    kullaniciOlustur(ad, email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kullanıcı Paneli'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Yeni Kullanıcı Oluştur',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _adController,
              decoration: InputDecoration(labelText: 'Ad'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _kullaniciOlustur,
              child: Text('Kullanıcı Oluştur'),
            ),
          ],
        ),
      ),
    );
  }
}
