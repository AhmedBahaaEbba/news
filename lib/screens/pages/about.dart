import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: Text("NewsApp Version 1.0",style: TextStyle( fontSize: 24),),
        ),
      ),
    );
  }
}
