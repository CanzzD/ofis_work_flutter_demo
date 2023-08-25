// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class UserService {
//   void kullaniciOlustur(String ad, String email) async {
//   final response = await http.post(
//     Uri.parse('https://api.jointact.com/Users?devKey=DE302DB6-B490-45A7-83F4-96A76BE28CE9'),
//     body: {'name': ad, 'email': email},
//   );

//   if (response.statusCode == 201) {
//     print('Kullanıcı başarıyla oluşturuldu.');
//   } else {
//     print('Kullanıcı oluşturulurken bir hata oluştu.');
//   }
// }
// }