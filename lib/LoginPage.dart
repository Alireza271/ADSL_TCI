import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:math';
import 'package:ADSLTCI/RulesDialog.dart';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'HomePage.dart';
import 'Urls.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String rules_message = null;

  String cookie;

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
    get_login_page_value();
  }

  sendinfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    Dio dio = new Dio();
    Map data = {
      "buildnumber": packageInfo.buildNumber,
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
    var response =
        await dio.post("http://adsl.developer271.ir/api/AddUser", data: data);

    if (!response.data['need_update']) {
      List<Widget> s = [
        Text(
          "بروز رسانی جدید موجود است",
          textAlign: TextAlign.center,
        ),
        Divider(),
        Text("ارتقا به نسخه " + response.data['update_version']),
      ];
      response.data['description'].forEach((value) {
        s.add(Text(value));
      });

      showDialog(
          context: context,
          child: Container(
            margin: EdgeInsets.only(top: 200, right: 50, left: 50, bottom: 200),
            child: Material(
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 10,
                    child: Column(
                      children: s,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            launch(
                                "https://cafebazaar.ir/app/ir.developer271.ADSLTCI");
                          },
                          child: Text("بروزرسانی"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
    }
  }

  Widget build(BuildContext context) {
    if (load_widgets) {
      final _formKey = GlobalKey<FormState>();

      final logo = Hero(
          tag: 'hero',
          child: Image.asset(
            "assets/icon.png",
            height: 150,
          ));

      final username = TextFormField(
        validator: (value) {
          if (value.isEmpty) return "نام کاربری خودرا وارد کنید";
          if (value.length != 10 || value.split('')[0] == "0")
            return "نام کاربری خود را به صورت 10 رقمی بدون صفر وارد کنید";
          return null;
        },
        controller: usernameController,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.account_box),
          hintText: 'نام کاربری',
        ),
      );

      final password = TextFormField(
        validator: (value) {
          if (value.isEmpty) return "کلمه عبور خودرا وارد کنید";
          return null;
        },
        controller: passwordController,
        textAlign: TextAlign.center,
        autofocus: false,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.vpn_key),
          hintText: 'کلمه عبور',
        ),
      );

      final loginButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: RaisedButton(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          onPressed:(db.getBool("rules")??false ?() async {
            if (_formKey.currentState.validate()) {

              login_button_action();


            }
          }:null) ,
          padding: EdgeInsets.all(12),
          color: Colors.lightBlueAccent,
          child: (login_loading_button
              ? CircularProgressIndicator()
              : Text('ورود', style: TextStyle(color: Colors.white))),
        ),
      );

      final Rules = Row(
        children: <Widget>[
          Checkbox(
            activeColor: Colors.green,
            value: db.getBool("rules") ?? false,
            onChanged: (value) {
              db.setBool("rules", value);
              setState(() {

              });

            },
          ),
          InkWell(
            child: Text(
              "قوانین",
              style: TextStyle(color: Colors.blue),
            ),
            onTap: () {
              RulesDialog(context);
            },
          ),
          Text(" را مطالعه کرده و میپذیرم."),
          Text(
            rules_message ?? "",
            style: TextStyle(color: Colors.red, fontSize: 10),
          ),
        ],
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

      final captcha_text_fild = TextFormField(
        validator: (value) {
          if (value.isEmpty) return "عبارت امنیتی وارد کنید";
          return null;
        },
        controller: captchaController,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        autofocus: false,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.autorenew),
          hintText: 'عبارت امنیتی',
        ),
      );

      return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                  child: Form(
                      key: _formKey,
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(left: 24.0, right: 24.0),
                        children: <Widget>[
                          logo,
                          SizedBox(height: 30.0),
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
                          SizedBox(height: 20.0),

                          Rules,

                          loginButton,
                        ],
                      )))));
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

  get_login_page_source() async {
    header = {"cookie": db.getString("cookie")};
    var response = await get(Urls.panel, headers: header);
    if (response.headers["set-cookie"] != null) {
      db.setString(
          "cookie", response.headers["set-cookie"].toString().split(";")[0]);
      header = {"cookie": db.getString("cookie")};
    }

    return response;
  }

  get_login_page_value() async {
    var source = await get_login_page_source();
    var document = parse(source.body);
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
    developer.log("login headr:" + header.toString());
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
