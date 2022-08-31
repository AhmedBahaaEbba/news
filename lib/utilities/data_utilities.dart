import 'package:flutter/material.dart';

  Widget loading() {
    return Container(
      child: CircularProgressIndicator(),
    );
  }

  Widget noData() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        "No Data",
      ),
    );
  }

  Widget error(var error) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text(
        error.toString(),
      ),
    );
  }

  Widget connectionError() {
    return Container(
      child: Text(
        "Connection error !!!",
      ),
    );
  }
