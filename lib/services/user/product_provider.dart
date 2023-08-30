import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ofis_work_flutter_demo/models/Product.dart';

class ProductProvider extends ChangeNotifier {
  Future<List<Product>> getProductList() async {
    Map<String, String> headers = {
      "Accept": "application/json",
      "Content-Type": "application/json",
    };
    final body = {
      "devKey": "DE302DB6-B490-45A7-83F4-96A76BE28CE9"
    };

    final response = await http.post(
      Uri.parse('https://api.jointact.com/App/GetProducts'),
      body: json.encode(body),
      headers: headers,
    );

    if (response.statusCode == 200) {
      List<dynamic> productsdynamic = [];
      productsdynamic = json.decode(response.body)["data"]["products"];

      List<Product> products = [];

      for (var product in productsdynamic) {
        products.add(mapDynamicToProduct(product));
      }

      return products;
    } else {
      throw Exception('Ürün listesi alınamadı.');
    }
  }

  Product mapDynamicToProduct(dynamic dproduct) {
    final product = Product();
    product.name = dproduct["name"];

    return product;
  }

  Future<bool> deleteProduct(int productId) async {
  Map<String, String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
  };

  final response = await http.post(
    Uri.parse('https://api.jointact.com/App/DeleteProduct?devKey=DE302DB6-B490-45A7-83F4-96A76BE28CE9&categoryId=$productId'),
    headers: headers,
  );
  print('Response Status Code: ${response.statusCode}'); //Hata olup olmadığını anlamak için burada sistemin verdiği kodu görmek istedim.


  if (response.statusCode == 200) {
    return true; // Başarı durumunda true döndürülebilir
  } else {
    return false; // Başarısız durumunda false döndürülebilir
  }
}
}
