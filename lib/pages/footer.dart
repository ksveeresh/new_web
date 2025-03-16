import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text(
          "© 2025 Kesarla's. All Rights Reserved.",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}