import 'dart:developer' as developer;
import 'dart:math';

import 'package:ADSLTCI/IncrementDialog.dart';
import 'package:ADSLTCI/Urls.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncreaseCreditPage extends StatefulWidget {
  @override
  _IncreaseCreditPage createState() => _IncreaseCreditPage();
}

class _IncreaseCreditPage extends State<IncreaseCreditPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool submit_loading = false;
  TextEditingController incrementController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(),
            body: Container(
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.all(50),
                  children: <Widget>[
                    TextFormField(
                      cursorWidth: 10,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        int increment = int.parse(value);
                        if (value.isEmpty) return " نمیتواند خالی باشد";
                        if (increment < 10000)
                          return " حداقل مقدار 10000 ریال میباشد";
                        return null;
                      },
                      controller: incrementController,
                      textAlign: TextAlign.center,
                      autofocus: false,
                      decoration: InputDecoration(
                          labelText: 'مقدار افزایش اعتبار',
                          suffixText: "ریال",
                          suffixStyle: TextStyle(color: Colors.green)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              submit_loading = true;
                            });
                            showDialog(
                                context: context,
                                child: IncrementDialog(
                                    int.parse(incrementController.text)));
                            setState(() {
                              submit_loading = false;
                            });
                          }
                        },
                        padding: EdgeInsets.all(12),
                        color: Colors.lightBlueAccent,
                        child: (submit_loading
                            ? CircularProgressIndicator()
                            : Text('ذخیره',
                                style: TextStyle(color: Colors.white))),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
