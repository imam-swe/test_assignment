/*
Company application details controller
@Author Soton Ahmed <soton.m360ict@gmail.com>
Start Date: 01-11-2023
Last Update: 01-11-2023
*/


import 'package:flutter/material.dart';

class AppSizes{
  static const double bodyPadding = 15;

  static double height(context) => MediaQuery.of(context).size.height;
  static double width(context) => MediaQuery.of(context).size.width;
}