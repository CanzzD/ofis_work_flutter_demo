import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryService {
  static Future<void> addCategory(String categoryName) async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };

    final body = {
      "name": categoryName,
      "devKey": "DE302DB6-B490-45A7-83F4-96A76BE28CE9"
    };

    final response = await http.post(
      Uri.parse('https://api.jointact.com/App/CreateCategory'),
      body: json.encode(body),
      headers: headers,
    );

    if (response.statusCode == 200) {
      print('Kategori başarıyla eklendi.');
      // Kategori eklendikten sonra yapılacak işlemleri burada gerçekleştirebilirsiniz.
    } else {
      print('Kategori eklenirken bir hata oluştu.');
    }
  }
}
