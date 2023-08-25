import 'package:flutter/material.dart';
import 'package:ofis_work_flutter_demo/category_manager.dart';
import 'package:ofis_work_flutter_demo/product_manager.dart';

class AdminPanel extends StatefulWidget {
@override
State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {

  @override
  Widget build(BuildContext context) {
 return Scaffold(
      backgroundColor: Color(0xFFE9E9E9),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 0
            ),
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 50),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                   icon: Icon(
                    Icons.close,
                    color: Colors.blueGrey,
                    size: 40,
                    ),
                  ),
                ),
                SizedBox(height: 80),
                Container(
                  width: 400,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CategoryManager()),
                      );
                    },  
                    child: Text(
                      "Category Manager",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.black
                      ),
                      )
                    )
                  ),

                  SizedBox(height: 50),

                Container(
                  height: 250,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProductManager()),
                      );
                    }, 
                    child: Text(
                      "Product Manager",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 37,
                        color: Colors.black
                      ),
                      )
                    )
                  ),
              ],
            ),
            )
        ],
      ),
    );
  }
}