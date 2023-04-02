import 'package:flutter/material.dart';

Widget showErrorContainer(BuildContext context, String error) {
  return Center(
    child: Container(
      color: Colors.black26,
      child: Text(
        error,
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 30),
      ),
    ),
  );
}
