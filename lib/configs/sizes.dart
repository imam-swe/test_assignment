import 'package:flutter/material.dart';

class AppSizes{
  static const double bodyPadding = 15;

  static double height(context) => MediaQuery.of(context).size.height;
  static double width(context) => MediaQuery.of(context).size.width;
}