import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProvider extends ChangeNotifier {
  Future<void> createUser(String name, String mail) async {
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final Map<String, dynamic> body = {
      'name': name,
      'email': mail,
      'devKey': 'DE302DB6-B490-45A7-83F4-96A76BE28CE9',
    };

    final response = await http.post(
      Uri.parse('https://api.jointact.com/App/CreateUser'),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      print('Kullanıcı başarıyla oluşturuldu: ${response.body}');
    } else {
      print('Kullanıcı oluşturulurken bir hata oluştu: ${response.statusCode}');
    }

    notifyListeners(); // Veri güncellendiğinde widget ağacını yenile
  }
}
