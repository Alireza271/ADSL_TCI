import 'dart:developer' as developer;
import 'dart:math';

import 'package:ADSLTCI/Urls.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController currentpasswordController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController CpasswordController = TextEditingController();
TextEditingController captchaController = TextEditingController();
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
bool submit_loading = false;
var header;

final _formKey = GlobalKey<FormState>();

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPage createState() => _ChangePasswordPage();
}

class _ChangePasswordPage extends State<ChangePasswordPage> {
  final GlobalKey<State> _Bkey = new GlobalKey();

  captcha() async {
    SharedPreferences db = await SharedPreferences.getInstance();

    header = {"cookie": db.getString("cookie")};
    return GestureDetector(
      child: Image.network(
        "https://adsl.tci.ir/panel/captcha/?r=" +
            Random().nextInt(50).toString(),
        headers: header,
      ),
      onTap: () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
                        if (value.isEmpty)
                          return "کلمه عبور نمیتواند خالی باشد";
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
                        if (value.isEmpty)
                          return "کلمه عبور نمیتواند خالی باشد";
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
                    FutureBuilder(
                      future: captcha(),
                      builder: (context, snapdata) {
                        return Container(
                            height: 65,
                            child: (snapdata.hasData
                                ? snapdata.data
                                : CircularProgressIndicator()));
                      },
                    ),
                    TextFormField(
                      controller: captchaController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      autofocus: false,
                      decoration: InputDecoration(
                        labelText: 'عبارت امنیتی',
                      ),
                    ),
                    savebuttuon()
                  ],
                ),
              ),
            )));
  }
}

class savebuttuon extends StatefulWidget {
  @override
  _savebuttuonState createState() => _savebuttuonState();
}

class _savebuttuonState extends State<savebuttuon> {
  change_password() async {
    var body = {
      "current_pass": currentpasswordController.text,
      "new_pass": passwordController.text,
      "repeat_pass": CpasswordController.text,
      "captcha": captchaController.text,
      "act": "ChangeWebPassword"
    };
    Dio dio = new Dio();
    var response = await dio.post(Urls.change_web_pass,
        data: FormData.fromMap(body), options: Options(headers: header));
    dom.Document document = parse(response.toString());
    final snackbar = SnackBar(
      duration: Duration(seconds: 10),
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            change_password();
            setState(() {
              submit_loading = true;
            });
          }
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: (submit_loading
            ? CircularProgressIndicator()
            : Text('ذخیره', style: TextStyle(color: Colors.white))),
      ),
    );
  }
}
