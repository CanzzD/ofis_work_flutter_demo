import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/user/create_new_user.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false); // Provider'ı al

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
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'e-Mail'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                userProvider.createUser(_nameController.text, _emailController.text); // Kullanıcı oluşturma işlemini çağır
              },
              child: Text('Kullanıcı Oluştur'),
            ),
          ],
        ),
      ),
    );
  }
}
