import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ofis_work_flutter_demo/services/user/category_provider.dart';
import 'package:ofis_work_flutter_demo/services/user/product_provider.dart';
import 'package:ofis_work_flutter_demo/models/Category.dart';
import 'package:ofis_work_flutter_demo/models/Product.dart';

class CategoryAndProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

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
            child: FutureBuilder<List<CategoryModel>>(
              future: categoryProvider.getCategoryList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Kategori listesi alınamadı.'));
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Center(child: Text('Henüz kategori bulunmuyor.'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final category = snapshot.data![index];
                      return ListTile(
                        title: Text(category.name),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                // Kategori düzenleme işlemi yap
                                // Eksik
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () async {
                                final success = await categoryProvider.deleteCategory(category.id);
                                if (success) {
                                  await categoryProvider.getCategoryList();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Kategori silinirken hata oluştu.'),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
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
              future: productProvider.getProductList(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Ürün listesi alınamadı.'));
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return Center(child: Text('Henüz ürün bulunmuyor.'));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final product = snapshot.data![index];
                      return ListTile(
                        title: Text(product.id.toString()),
                        // Diğer ListTile özellikleri eklenir
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
