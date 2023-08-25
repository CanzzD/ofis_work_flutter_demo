import 'package:flutter/material.dart';
import 'package:ofis_work_flutter_demo/category_and_product_list.dart';
import 'package:ofis_work_flutter_demo/sign_in_page.dart';

class UserPanel extends StatefulWidget {
@override
State<UserPanel> createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {

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
                        MaterialPageRoute(builder: (context) => SignInPage()),
                      );
                    },  
                    child: Text(
                      "Create New User",
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
                        MaterialPageRoute(builder: (context) => CategoryAndProductList()),
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