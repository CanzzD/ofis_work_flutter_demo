import 'package:flutter/material.dart';

class ProductManager extends StatefulWidget {
  @override
  _ProductManagerState createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  // Ürün listesi örnek olarak bir liste içinde saklanabilir
  List<String> urunler = ['Laptop', 'T-shirt', 'Tablo'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Manager'),
      ),
      body: ListView.builder(
        itemCount: urunler.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(urunler[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  urunler.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ürün ekleme işlemi
          // Burada gerekli dialog veya navigasyonu kullanarak yeni ürün eklemesi yapılabilir
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
