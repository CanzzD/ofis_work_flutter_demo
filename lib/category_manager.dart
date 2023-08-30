import 'package:flutter/material.dart';
import 'package:ofis_work_flutter_demo/services/admin/category_service.dart'; // Kategori servisi dosyasının yolunu düzenleyin

class CategoryManager extends StatefulWidget {
  @override
  _CategoryManagerState createState() => _CategoryManagerState();
}

class _CategoryManagerState extends State<CategoryManager> {
  final TextEditingController _categoryNameController = TextEditingController();

  void _addCategory() async {
    String categoryName = _categoryNameController.text;

    await CategoryService.addCategory(categoryName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel - Kategori Ekle'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kategori Ekle',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _categoryNameController,
              decoration: InputDecoration(labelText: 'Kategori Adı'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _addCategory();
              },
              child: Text('Kategori Ekle'),
            ),
          ],
        ),
      ),
    );
  }
}
