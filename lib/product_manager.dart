import 'package:flutter/material.dart';
import 'package:ofis_work_flutter_demo/services/admin/product_service.dart'; // Kategori servisi dosyasının yolunu düzenleyin

class ProductManager extends StatefulWidget {
  @override
  _ProductManagerState createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  final TextEditingController _productNameController= TextEditingController();

  void _addCategory() async {
    String productName = _productNameController.text;

    await ProductService.addCategory(productName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel - Ürün Ekle'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ürün Ekle',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _productNameController,
              decoration: InputDecoration(labelText: 'Ürün Adı'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _addCategory();
              },
              child: Text('Ürün Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
