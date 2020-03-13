import 'dart:developer';

import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'LoginPage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Samim'),
    home: StartApp(),
  ));
}

class StartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return LoginPage();
  }


}
