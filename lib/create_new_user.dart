import 'package:http/http.dart' as http;
import 'dart:convert';

void createUser() async {
  final Map<String, String> headers = {
    'Content-Type': 'application/json', // JSON içeriği
  };

  final Map<String, dynamic> body = {
    'name': 'Yeni Kullanıcı',
    'email': 'yeni@example.com',
    // Diğer kullanıcı bilgilerini burada ekleyin
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
}
