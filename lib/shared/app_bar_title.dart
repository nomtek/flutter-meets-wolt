import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              "Onion & Potato",
              style: TextStyle(color: Colors.black87, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          FlatButton(
            padding: const EdgeInsets.only(top: 20),
            onPressed: () {},
            child: Text(
              "Delivery in 45-55 min",
              style: TextStyle(color: Colors.blue[400], fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}