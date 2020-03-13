import 'dart:developer' as developer;
import 'dart:math';

import 'package:ADSLTCI/Urls.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeNetPasswordPage extends StatefulWidget {
  @override
  _ChangeNetPasswordPage createState() => _ChangeNetPasswordPage();
}

class _ChangeNetPasswordPage extends State<ChangeNetPasswordPage> {
final GlobalKey<ScaffoldState> _scaffoldKey= new GlobalKey<ScaffoldState>();
  bool submit_loading = false;
  TextEditingController currentpasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController CpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {


    final _formKey = GlobalKey<FormState>();
    return Directionality(
        textDirection: TextDirection.rtl,
        child:Scaffold(
          key: _scaffoldKey,
        appBar: AppBar(),
        body: Container(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(50),
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) if (value.isEmpty)
                      return "کلمه عبور نمیتواند خالی باشد";
                    return null;
                  },
                  controller: currentpasswordController,
                  textAlign: TextAlign.center,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'رمز عبور فعلی ',
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) return "کلمه عبور نمیتواند خالی باشد";
                    return null;
                  },
                  controller: passwordController,
                  textAlign: TextAlign.center,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'رمز عبور جدید',
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) return "کلمه عبور نمیتواند خالی باشد";
                    if (value != passwordController.text)
                      return "کلمه عبور و تکرار آن یکسان نیست";
                    return null;
                  },
                  controller: CpasswordController,
                  textAlign: TextAlign.center,
                  autofocus: false,
                  decoration: InputDecoration(
                    labelText: 'تکرار رمز عبور',
                  ),
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
                        change_password(context);
                      }
                    },
                    padding: EdgeInsets.all(12),
                    color: Colors.lightBlueAccent,
                    child: (submit_loading
                        ? CircularProgressIndicator()
                        : Text('ذخیره', style: TextStyle(color: Colors.white))),
                  ),
                )
              ],
            ),
          ),
        )));
  }

  change_password(context) async {
    var body = {
      "current_pass": currentpasswordController.text,
      "new_pass": passwordController.text,
      "repeat_pass": CpasswordController.text,
      "act": "ChangeNetPassword"
    };
    SharedPreferences db = await SharedPreferences.getInstance();

    var header = {"cookie": db.getString("cookie")};
    Dio dio = new Dio();
    var response = await dio.post(Urls.change_net_pass,
        data: FormData.fromMap(body), options: Options(headers: header));

    dom.Document document = parse(response.toString());
    final snackbar = SnackBar(
      content: Text(document
          .getElementsByClassName("uk-width-expand")[0]
          .firstChild
          .text),
    );

    _scaffoldKey.currentState.showSnackBar(snackbar);
    setState(() {
      submit_loading = false;
    });
  }
}
