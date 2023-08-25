import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ofis_work_flutter_demo/models/Category.dart';
import 'package:ofis_work_flutter_demo/models/Product.dart'; // json.decode için kütüphane eklendi

class CategoryAndProductList extends StatefulWidget {
  @override
  _CategoryAndProductListState createState() =>
      _CategoryAndProductListState();
}

class _CategoryAndProductListState
    extends State<CategoryAndProductList> {
  late Future<List<Category>> _categoryList;
  late Future<List<Product>> _productList;

  @override
  void initState() {
    super.initState();
    _categoryList = getCategoryList();
    _productList = getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category and Product List'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: FutureBuilder<List<Category>>(
              future: _categoryList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Kategori listesi alınamadı.'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Henüz kategori bulunmuyor.'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].name),
                      );
                    },
                  );
                }
              },
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Products:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: FutureBuilder<List<Product>>(
              future: _productList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Ürün listesi alınamadı.'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Henüz ürün bulunmuyor.'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data![index].id.toString()),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<List<Category>> getCategoryList() async {
    Map<String,String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json", // JSON içeriği
  };
  final body = {
    "devKey": "DE302DB6-B490-45A7-83F4-96A76BE28CE9"
  };

    final response = await http.post(
    Uri.parse('https://api.jointact.com/App/GetCategories'),
    body: json.encode(body),
    headers: headers
  );

  if (response.statusCode == 200) {
    List<dynamic> categoriesdynamic = [];
    categoriesdynamic = json.decode(response.body)["data"]["categories"]; // JSON verisini dönüştür

    List<Category> categories = [];

     for (var category in categoriesdynamic) {
       categories.add(mapDynamicToCategory(category));
    }

    return categories;
  } else {
    throw Exception('Kategori listesi alınamadı.');
  }
}

Category mapDynamicToCategory(dynamic dcategory){
  final category = new Category();
  category.name = dcategory["name"];
  category.id = dcategory["id"];
  
  return category;
}

Future<List<Product>> getProductList() async {
    Map<String,String> headers = {
    "Accept": "application/json",
    "Content-Type": "application/json", // JSON içeriği
  };
  final body = {
    "devKey": "DE302DB6-B490-45A7-83F4-96A76BE28CE9"
  };

    final response = await http.post(
    Uri.parse('https://api.jointact.com/App/GetProducts'),
    body: json.encode(body),
    headers: headers
  );

  if (response.statusCode == 200) {
    List<dynamic> productsdynamic = [];
    productsdynamic = json.decode(response.body)["data"]["products"]; // JSON verisini dönüştür

    List<Product> products = [];

     for (var product in productsdynamic) {
       products.add(mapDynamicToProduct(product));
    }

    return products;
  } else {
    throw Exception('Urun listesi alınamadı.');
  }
}
Product mapDynamicToProduct(dynamic dproduct){
  final product = new Product();
  product.id = dproduct["id"];
  
  return product;
}
