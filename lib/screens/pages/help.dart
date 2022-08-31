import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text("Send Your Question To www.AppNews.com",style: TextStyle(fontSize: 16),),
        ),
      ),
    );
  }
}
