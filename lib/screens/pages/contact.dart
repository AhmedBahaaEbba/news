import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: "Your name"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter your name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Your Email"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter your email";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 48,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Message"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please Enter The Message";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  width: double.infinity,
                  child: RaisedButton(
                    child: Text(
                      "SEND MESSAGE",
                      style: TextStyle(color: Colors.white),
                      maxLines: 5,
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                      } else {}
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
