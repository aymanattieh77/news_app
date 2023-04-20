import 'package:flutter/material.dart';
import 'package:news/presentation/src/colors.dart';
import 'package:news/presentation/src/fonts.dart';

Widget showErrorContainer(BuildContext context, String error) {
  return Center(
    child: Container(
      color: ColorManager.black26,
      child: Text(
        error,
        style: TextStyle(
            color: Theme.of(context).primaryColor, fontSize: FontSizes.f30),
      ),
    ),
  );
}
