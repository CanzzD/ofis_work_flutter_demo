import 'package:flutter/material.dart';

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
              ],
            ),
            )
        ],
      ),
    );
  }
}