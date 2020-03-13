import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:math';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomePage.dart';
import 'Urls.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String cookie;

  FlutterWebviewPlugin webview = new FlutterWebviewPlugin();
  bool load_widgets = false;
  bool login_loading_button = false;
  String login_url;
  String captcha_img_url;
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController captchaController = new TextEditingController();
  SharedPreferences db;
  Map<String, String> header;

  initState() {
    super.initState();
    StartState();
  }

  StartState() async {
    sendinfo();
    db = await SharedPreferences.getInstance();
    usernameController.text = db.getString("username");
    passwordController.text = db.getString("password");
    set_cookie();
  }

  sendinfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    Dio dio = new Dio();
    Map data = {
      "model": androidInfo.model,
      "androidId": androidInfo.androidId,
      "board": androidInfo.board,
      "brand": androidInfo.brand,
      "device": androidInfo.device,
      "hardware": androidInfo.hardware,
      "id": androidInfo.id,
      "host": androidInfo.host,
      "version": androidInfo.version.release,
      "manufacturer": androidInfo.manufacturer,
      "product": androidInfo.product,
    };
    developer.log(data.toString());
    await dio.post("http://adsl.alireza271.ir/api/AddUser", data: data);
  }

  Widget build(BuildContext context) {


    if (load_widgets) {
      final logo = Hero(tag: 'hero', child: Image.asset("assets/icon.png",height: 200,));

      final username = TextField(
        controller: usernameController,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_box),
          hintText: 'نام کاربری',
        ),
      );

      final password = TextField(
        controller: passwordController,
        textAlign: TextAlign.center,
        autofocus: false,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          hintText: 'کلمه عبور',
        ),
      );

      final loginButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          onPressed: () async {
            login_button_action();
          },
          padding: EdgeInsets.all(12),
          color: Colors.lightBlueAccent,
          child: (login_loading_button
              ? CircularProgressIndicator()
              : Text('ورود', style: TextStyle(color: Colors.white))),
        ),
      );

      final captcha = GestureDetector(
        child: Image.network(
          captcha_img_url,
          headers: header,
          height: 55,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return CircularProgressIndicator();
          },
        ),
        onTap: () {
          setState(() {
            captcha_img_url =
                captcha_img_url + "&date=" + Random().nextInt(50).toString();
          });
        },
      );

      final captcha_text_fild = TextField(
        controller: captchaController,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'عبارت امنیتی',



        ),
      );

      return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
              child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 48.0),
              username,
              SizedBox(height: 20.0),
              password,
              SizedBox(height: 20.0),
              captcha,
              Text(
                "برای تغییر عبارت امنیتی ، روی تصویر ضربه بزنید",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13),
              ),
              SizedBox(height: 20.0),
              captcha_text_fild,
              loginButton,
            ],
          )));
    }
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Text("لطفا صبر کنید...")
        ],
      )),
    );
  }

  set_cookie() async {
    await webview.launch(Urls.panel, hidden: true);
    webview.onStateChanged.listen((state) async {
      webview.getCookies().then((coo) async {
        cookie = coo
            .toString()
            .replaceAll('"', "")
            .replaceAll("{", "")
            .replaceAll("}", "")
            .replaceAll(":", "=")
            .replaceAll(" ", "");
        db.setString("cookie", cookie);
        webview.close();
        webview.dispose();
        get_login_page_value();
      });
    });
  }

  get_login_page_source() async {
    header = {"cookie": db.getString("cookie")};
    var response = await get(Urls.panel, headers: header);
    return response.body;
  }

  get_login_page_value() async {
    var source = await get_login_page_source();
    var document = parse(source);
    if (document.getElementsByTagName("form").isEmpty) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      login_url = document.getElementsByTagName("form")[0].attributes['action'];
      captcha_img_url =
          document.getElementById("loginCaptchaImage").attributes['src'];
      setState(() {
        load_widgets = true;
      });
    }
  }

  login_button_action() async {
    setState(() {
      login_loading_button = true;
    });
    Map<String, dynamic> data = {
      "redirect": "",
      "username": usernameController.text,
      "password": passwordController.text,
      "captcha": captchaController.text,
      "LoginFromWeb": ""
    };
    await post(login_url, body: data, headers: header);
    get_panel_source();
  }

  get_panel_source() async {
    var response = await get(Urls.panel, headers: header);
//    log(response.body.toString());
    List message_row = response.body.toString().split("UIkit.notification(");
    if (message_row.length == 2) {
      message_row = message_row[1].toString().split(");");
      String message_text =
          json.decode(message_row[0])['message'].toString().split(";")[1];
      Fluttertoast.showToast(
          msg: message_text,
          textColor: Colors.white,
          backgroundColor: Color(0xffFF8800));
    } else {
      db.setString("username", usernameController.text);
      db.setString("password", passwordController.text);

      Fluttertoast.showToast(
          msg: "ورود با موفقیت انجام شد!",
          textColor: Colors.white,
          backgroundColor: Color(0xff007E33));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    login_loading_button = false;
    setState(() {});
  }
}
