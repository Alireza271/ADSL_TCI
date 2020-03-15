import 'dart:developer';
import 'dart:io';
import 'package:ADSLTCI/changePassword.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ChangeNetPassword.dart';
import 'ChangeServicePage.dart';
import 'IncreaseCreditPage.dart';
import 'LoginPage.dart';
import 'ServicePage.dart';
import 'TrafficPage.dart';
import 'Urls.dart';
import 'requests/Nonce.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic> details;
  SharedPreferences db;
  Map<String, String> header;
  DateTime currentBackPressTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    StartState();
  }

  StartState() {
    get_user_info();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: exit_app,
        child: MaterialApp(
            routes: {
              '/loginpage': (context) => LoginPage(),
              '/homepage': (context) => HomePage(),
            },
            home: SafeArea(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Scaffold(
                    drawer: HomePage_drawer(),
                    appBar: AppBar(),
                    body: ListView(
                      children: <Widget>[
                        Container(
                            child: (details != null
                                ? info_card_box()
                                : Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      CircularProgressIndicator(),
                                      Text("لطفا صبر کنید...")
                                    ],
                                  ))),
                      ],
                    )),
              ),
            )));
  }

  get_user_info() async {
    Response response = await get_panel_source();
    var document = parse(response.body);

    //get user name
    String User_name = document.getElementsByTagName("h4")[2].text;
    //

    //connection_info
    var info_ul = document.getElementsByClassName(
        "uk-list uk-list-divider uk-margin-remove-bottom");
    var info_li_list = info_ul.first.children;
    List connection_info = [];
    info_li_list.forEach((li) {
      connection_info.add(li.getElementsByTagName("b").first.text);
    });
    String online_status_text =
        document.getElementsByClassName("uk-card-badge uk-label").first.text;
    bool online_status = (online_status_text == "آنلاین" ? true : false);
    //connection_info**

    //active_service
    Map<String, dynamic> active_service = {
      "service_name": document.getElementsByTagName("h5").first.text,
      "days_service":
          document.getElementsByClassName("percent").first.children.first.text,
      "total_days":
          document.getElementsByClassName("percent").first.children[2].text,
      "size_service":
          document.getElementsByClassName("percent")[1].children.first.text,
      "total_size":
          document.getElementsByClassName("percent")[1].children[2].text,
    };

    Map<String, dynamic> timing_trafic;
    try {
      timing_trafic = {
        "timing_trafic_name": document.getElementsByTagName("h5")[1].text,
        "days_service":
            document.getElementsByClassName("percent")[2].children.first.text,
        "total_days":
            document.getElementsByClassName("percent")[2].children[2].text,
        "size_service":
            document.getElementsByClassName("percent")[3].children.first.text,
        "total_size":
            document.getElementsByClassName("percent")[3].children[2].text
      };
    } catch (e) {
      timing_trafic = {
        "timing_trafic_name": document.getElementsByTagName("h5")[1].text,
        "days_service": "",
        "total_days": "",
        "size_service": "",
        "total_size": "",
      };
    }

    //active_service**

    //other_info
    String Reservation_service = document.getElementsByTagName("h3").first.text;
    String Reservation_trafic = document.getElementsByTagName("h3")[1].text;
    String ip_static = document.getElementsByTagName("h3")[2].text;
    String ip_route = document.getElementsByTagName("h3")[3].text;

    details = {
      "user_name": User_name,
      "online_status": online_status,
      "state": connection_info[0],
      "city": connection_info[1],
      "call_center": connection_info[2],
      "register_date": connection_info[3],
      "sharing_type": connection_info[4],
      "authentication_status": connection_info[5],
      "internet_status": connection_info[6],
      "date_status": connection_info[7],
      "account_status": connection_info[8],
      "financial_credit_panel": connection_info[9],
      "internet_username": connection_info[10],
      "connection_type": connection_info[11],
      "active_service": active_service,
      "timing_trafic": timing_trafic,
      "Reservation_service": Reservation_service,
      "Reservation_trafic": Reservation_trafic,
      "ip_static": ip_static,
      "ip_route": ip_route
    };
    setState(() {});
  }

  get_panel_source() async {
    db = await SharedPreferences.getInstance();
    header = {"cookie": db.getString("cookie")};
    log("home page header:"+header.toString());
    var response = await get(Urls.panel, headers: header);
    //set init nonce
    Nonce().SetNonceByHtml(response.body);
    //

    return response;
  }

  circel_chart(remaining_title, String total_range, String remaining_renge,
      {chart_label}) {
    List total_number = extract_number(total_range);
    List remaining_number = extract_number(remaining_renge);
    print(remaining_number[0]);

    final GlobalKey<AnimatedCircularChartState> _chartKey =
        new GlobalKey<AnimatedCircularChartState>();
    List<CircularStackEntry> data = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(
            (double.parse(total_number[0]) -
                (double.parse(total_number[0]) -
                    double.parse(remaining_number[0]))),
            Colors.white,
            rankKey: 'completed',
          ),
          new CircularSegmentEntry(
            double.parse(total_number[0]) - double.parse(remaining_number[0]),
            Color(0xff176dc4),
            rankKey: 'remaining',
          ),
        ],
        rankKey: remaining_title,
      ),
    ];

    return Container(
      child: Column(
        children: <Widget>[
          (chart_label != null
              ? Container(
                  padding: EdgeInsets.all(9),
                  child: Text(
                    chart_label,
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : Divider(
                  color: Colors.transparent,
                )),
          Stack(
            children: <Widget>[
              AnimatedCircularChart(
                key: _chartKey,
                size: const Size(150.0, 150.0),
                initialChartData: data,
              ),
              Container(
                width: 150,
                height: 150,
                color: Colors.transparent,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        remaining_number.first + " " + remaining_number.last,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Samim",
                          fontSize: 15,
                        ),
                      ),
                      Divider(
                        endIndent: 50,
                        thickness: 1,
                        color: Colors.white,
                        indent: 50,
                      ),
                      Text(
                        total_number[0] + " " + remaining_number.last,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Samim",
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  List extract_number(String text) {
    String result = text.replaceAll("۰", "0");
    result = result.replaceAll("۱", "1");
    result = result.replaceAll("۲", "2");
    result = result.replaceAll("۳", "3");
    result = result.replaceAll("۴", "4");
    result = result.replaceAll("۵", "5");
    result = result.replaceAll("۶", "6");
    result = result.replaceAll("۷", "7");
    result = result.replaceAll("۸", "8");
    result = result.replaceAll("۹", "9");
    result = result.replaceAll(" ", "");
    result = result.replaceAll("-", "");
//    final doubleRegex = RegExp("\\d*\\.?\\d+|//.", multiLine: true);
//    var double_list = doubleRegex.allMatches(result).map((m) => m.group(0));

    final wordRegex = RegExp(
        "(?<Alpha>([\u0600-\u06FF\s]|[a-zA-Z])*)(?<Numeric>[\\d*\\.?\\d+|//.]*)",
        multiLine: true);
    var number_list =
        wordRegex.allMatches(result).map((m) => m.group(0)).toList();
    log(number_list.toString());
    if (number_list.length < 3) number_list.insert(0, "0");
    number_list.removeLast();
    return number_list.toList();
//[\u0600-\u06FF\s]
    //[a-zA-Z]
  }

  info_card_box() {
    return Container(
      child: Column(
        children: <Widget>[
          row_info_profile(),
          details_widget(),
          service_chart(),
          trafic_chart(),
          other_info()
        ],
      ),
    );
  }

  row_info_profile() {
    return Card(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                SvgPicture.network(
                    "https://adsl.tci.ir/panel/assets/images/icon/man.svg",
                    height: 80),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        details["internet_username"],
                        style:
                            TextStyle(color: Color(0xff999999), fontSize: 15),
                      ),
                      Text(details['user_name'],
                          style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                Spacer(),
                online_status()
              ],
            )));
  }

  row_charts(
    List<Widget> chart_list,
    chart_title_key,
    chart_title_value, {
    int color = 0xff1e87f0,
  }) {
    Widget Chart_title_box = Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          chart_title_key,
          style: TextStyle(color: Colors.grey[300]),
        ),
        Text(
          chart_title_value,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    ));
    chart_list.insert(0, Chart_title_box);
    return Card(
        elevation: 1,
        child: Container(
          color: Color(color),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: chart_list,
          ),
        ));
  }

  details_widget() {
    return Card(
      elevation: 1,
      child: Container(
        child: Column(
          children: <Widget>[
            line_info_widget("استان", details["state"]),
            line_info_widget("شهرستان", details["city"]),
            line_info_widget("مرکز مخابراتی", details["call_center"]),
            line_info_widget("تاریخ ثبت نام", details["register_date"]),
            line_info_widget("شیوه اشتراک", details["sharing_type"]),
            line_info_widget(
                "وضعیت احراز هویت", details["authentication_status"]),
            line_info_widget("وضعیت اینترنت", details["internet_status"]),
            line_info_widget("تاریخ وضعیت", details["date_status"]),
            line_info_widget("وضعیت حساب", details["account_status"]),
            line_info_widget(
                "اعتبار مالی پنل", details["financial_credit_panel"]),
            line_info_widget(
                "نام کاربری اینترنت", details["internet_username"]),
            line_info_widget("بستر ارتباطی", details["connection_type"]),
          ],
        ),
      ),
    );
  }

  line_info_widget(key, value) {
    return Column(
      children: <Widget>[
        Divider(),
        Container(
          child: Row(
            children: <Widget>[
              Icon(
                Icons.adjust,
                size: 20,
              ),
              Text(" " + key + ": "),
              Text(
                value,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }

  online_status() {
    return Container(
        decoration: BoxDecoration(
            color: Color((details['online_status'] ? 0xff1e87f0 : 0xffc62828)),
            borderRadius: BorderRadius.all(Radius.circular(3))),
        padding: EdgeInsets.all(10),
        child: Text(
          (details['online_status'] ? "آنلاین" : "آفلاین"),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ));
  }

  other_info() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          other_info_item("سرویس رزرو شما", details["Reservation_service"],
              Icons.settings, "_",
              reserve_service: true),
          other_info_item("ترافیک رزرو شما", details["Reservation_trafic"],
              Icons.swap_vert, "_"),
          other_info_item("IP Static شما", details["ip_static"], Icons.storage,
              "تاریخ انقضا: " + "-"),
          other_info_item("IP Route شما", details["ip_static"], Icons.router,
              "تاریخ انقضا: " + "-"),
        ],
      ),
    );
  }

  other_info_item(header_title, header_value, icon, footer_value,
      {reserve_service = false}) {
    return Card(
        elevation: 2,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            header_title,
                            style: TextStyle(
                              color: Color(0xff666666),
                            ),
                          ),

//
                          Text(
                            header_value,
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                    (reserve_service && header_value != "سرویس رزرو ندارد"
                        ? RaisedButton(
                            child: Text("فعال سازی"),
                            onPressed: _ActivateReservedService,
                          )
                        : Container()),
                    Icon(
                      icon,
                      size: 50,
                      color: Color(0xff666666),
                    )
                  ],
                ),
              ),
              Divider(),
              Container(
                child: Row(
                  children: <Widget>[
                    Text(footer_value),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  service_chart() {
    String title_key = "سرویس فعال شما";
    String title_value = details["active_service"]["service_name"];
    List<Widget> charts = [
      circel_chart("روز", details["active_service"]["total_days"],
          details["active_service"]["days_service"],
          chart_label: "روز های باقی مانده"),
      Directionality(
          textDirection: TextDirection.ltr,
          child: circel_chart("حجم", details["active_service"]["total_size"],
              details["active_service"]["size_service"],
              chart_label: "حجم باقی مانده")),
    ];

    return row_charts(charts, title_key, title_value);
  }

  trafic_chart() {
    String title_key = "ترافیک زمان‌دار فعال شما";
    String title_value = details["timing_trafic"]["timing_trafic_name"];
    List<Widget> charts = [
      circel_chart("روز", details["timing_trafic"]["total_days"],
          details["timing_trafic"]["days_service"],
          chart_label: "روز های باقی مانده"),
      Directionality(
        textDirection: TextDirection.ltr,
        child: circel_chart("حجم", details["timing_trafic"]["total_size"],
            details["timing_trafic"]["size_service"],
            chart_label: "حجم باقی مانده"),
      )
    ];

    return row_charts(charts, title_key, title_value, color: 0xff28b779);
  }

  Future<bool> exit_app() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "برای خرج دو بار کلیک کنید");
      return Future.value(false);
    }
    exit(0);
  }

  HomePage_drawer() {
    return Drawer(
        child: Column(
      children: <Widget>[
        Flexible(
          child: ListView(
            // Important: Remove any padding from the ListView.
            children: <Widget>[
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.add_shopping_cart),
                    Text('خرید سرویس'),
                  ],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ServicePage()));
                },
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.add_shopping_cart),
                    Text('خرید ترافیک'),
                  ],
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TrafficPage()));
                },
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.loop),
                    Text('تغییر سرویس'),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangeServicePage()));
                },
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.visibility_off),
                    Text('تغییر رمز عبور پنل'),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangePasswordPage()));
                },
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.visibility_off),
                    Text('تغییر رمز عبور اینترنت'),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChangeNetPasswordPage()));
                },
              ),
              ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(Icons.attach_money),
                    Text('افزایش اعتبار مالی پنل'),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>IncreaseCreditPage()));
                },
              ),
            ],
          ),
        ),
        ListTile(
          title: Row(
            children: <Widget>[
              Icon(Icons.exit_to_app),
              Text('خروج از حساب'),
            ],
          ),
          onTap: () async {
            get(Urls.logout, headers: {"cookie": db.getString("cookie")});
            Navigator.pop(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
        ListTile(
          title: Row(
            children: <Widget>[
              Icon(Icons.info_outline),
              Text('درباره'),
            ],
          ),
          onTap: () async {
            showDialog(
                context: context,
                child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 100, right: 100, top: 200, bottom: 200),
                      child: Material(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "درباره",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Column(children: <Widget>[
                                Image.asset(
                                  'assets/icon.png',
                                  height: 200,
                                ),
                                Text(
                                  "271Developer@Gmail.Com",
                                  style:
                                      TextStyle(fontFamily: "", fontSize: 15),
                                )
                              ])
                            ]),
                      ),
                    )));
            ;
            // Update the state of the app
            // ...
            // Then close the drawer
          },
        ),
      ],
    ));
  }

  _ActivateReservedService() {
    showDialog(
        context: context,
        child: AlertDialog(
          title: Text(
            "فعال سازی سرویس رزرو",
            textAlign: TextAlign.center,
          ),
          content: Text(
            "با این کار سرویس فعلی شما سوزانده شده و سرویس رزرو جایگزین میشود",
            textAlign: TextAlign.center,
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("بسوزان"),
              onPressed: () async {
                var response = await post(Urls.servicePage,
                    headers: {"cookie": db.getString("cookie")},
                    body: {"act": "ActivateReservedService"});

                Fluttertoast.showToast(
                    msg: parse(response.body)
                        .getElementsByClassName("uk-width-expand")[0]
                        .text);
                Navigator.pop(context);
                setState(() {});
              },
            ),
            FlatButton(
              child: Text('لغو'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
