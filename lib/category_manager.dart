import 'package:flutter/material.dart';

class CategoryManager extends StatefulWidget {
  @override
  _CategoryManagerState createState() => _CategoryManagerState();
}

class _CategoryManagerState extends State<CategoryManager> {
  // Kategori listesi örnek olarak bir liste içinde saklanabilir
  List<String> kategoriler = ['Elektronik', 'Giyim', 'Ev Eşyaları'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Manager'),
      ),
      body: ListView.builder(
        itemCount: kategoriler.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(kategoriler[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  kategoriler.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Kategori ekleme işlemi
          // Burada gerekli dialog veya navigasyonu kullanarak yeni kategori eklemesi yapılabilir
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
