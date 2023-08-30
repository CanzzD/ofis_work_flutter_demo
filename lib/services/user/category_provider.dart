import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ofis_work_flutter_demo/models/Category.dart';

class CategoryProvider extends ChangeNotifier {
  Future<List<CategoryModel>> getCategoryList() async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    final body = {
      "devKey": "DE302DB6-B490-45A7-83F4-96A76BE28CE9"
    };

    final response = await http.post(
      Uri.parse('https://api.jointact.com/App/GetCategories'),
      body: json.encode(body),
      headers: headers,
    );

    if (response.statusCode == 200) {
      List<dynamic> categoriesdynamic = [];
      categoriesdynamic = json.decode(response.body)["data"]["categories"];

      List<CategoryModel> categories = [];

      for (var category in categoriesdynamic) {
        categories.add(mapDynamicToCategory(category));
      }

      return categories;
    } else {
      throw Exception('Kategori listesi alınamadı.');
    }
  }

  CategoryModel mapDynamicToCategory(dynamic dcategory) {
    final category = CategoryModel();
    category.name = dcategory["name"];
    category.id = dcategory["id"];

    return category;
  }
Future<bool> deleteCategory(int categoryId) async {
  Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  final response = await http.post(
    Uri.parse('https://api.jointact.com/App/DeleteCategory?devKey=DE302DB6-B490-45A7-83F4-96A76BE28CE9&categoryId=$categoryId'),
    headers: headers,
  );
  print('Response Status Code: ${response.statusCode}');


  if (response.statusCode == 200) {
    return true; // Başarı durumunda true döndürülebilir
  } else {
    return false; // Başarısız durumunda false döndürülebilir
  }
}

}