import 'package:flutter/material.dart';

PreferredSizeWidget appB(String title, size) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
          fontFamily: 'montserrat',
          color: Colors.black,
          fontSize: size.height * 0.032,
          fontWeight: FontWeight.bold),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
