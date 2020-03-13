import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'List.dart';
import 'LoginPage.dart';
import 'Urls.dart';
import 'requests/RequestList.dart';

class ChangeServicePage extends StatefulWidget {
  @override
  _ChangeServicePageState createState() => _ChangeServicePageState();
}

class _ChangeServicePageState extends State<ChangeServicePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

//  ChangeServicesModelEntity _services = new ChangeServicesModelEntity();

  @override
  void initState() {
    StartState();
  }

  StartState() async {
//    _services = await GetChangeServices();
//    print(_services);
    setState(() {});
  }

  Future<void> _refresh() async {
//    _services = await GetChangeServices();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(),
            body: RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: _refresh,
              child: Center(child: service_detail_Content()),
            )));
  }

  service_detail_Content() {
    return FutureBuilder(
      future: GetChangeServices(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData&& snapshot.data.ok) {
          return items_list(snapshot.data, 'change-service', context);
        }
        return CircularProgressIndicator();
      },
    );

//    switch (_services.ok) {
//      case false:
//        {
//          if (_services.code == 2) {
//            return RaisedButton(
//              onPressed: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => LoginPage()));
//              },
//              child: Text(
//                "ورود مجدد",
//                style: TextStyle(color: Colors.white),
//              ),
//              color: Color(0xff1e87f0),
//            );
//          }
//          return RaisedButton(
//            onPressed: () async {
//              _services = await GetChangeServices();
//              setState(() {});
//            },
//            child: Text("تلاش مجدد"),
//            color: Color(0xff1e87f0),
//          );
//        }
//        break;
//      case true:
//        {
//          return items_list(_services, 'change-service', context);
//        }
//        break;
//      default:
//        {
//          return Column(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              CircularProgressIndicator(),
//              Text("لطفا صبر کنید...")
//            ],
//          );
//        }
//    }
  }
}

class currentservice extends StatefulWidget {
  @override
  _currentserviceState createState() => _currentserviceState();
}

class _currentserviceState extends State<currentservice> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: current_service_details(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Card(
              child: Container(
            child: Column(
              children: <Widget>[
                row_ditail_current_service("نام سرویس", snapshot.data["name"]),
                row_ditail_current_service(
                    "گروه سرویس", snapshot.data["group_name"]),
                row_ditail_current_service(
                    "نوع سرویس", snapshot.data["service_type"]),
                row_ditail_current_service(
                    "تعداد روز سرویس ", snapshot.data["days_of_service"]),
                row_ditail_current_service(
                    "ترافیک کل سرویس", snapshot.data["totall_service_traffic"]),
                row_ditail_current_service(
                    "تعداد روز استفاده شده", snapshot.data["used_day"]),
                row_ditail_current_service(
                    "ترافیک مصرف شده", snapshot.data["used_traffic"]),
                row_ditail_current_service(
                    "تعداد روز باقیمانده", snapshot.data["days_left"]),
                row_ditail_current_service(
                    "ترافیک باقیمانده", snapshot.data["traffic_left"]),
                row_ditail_current_service(
                    "هزينه پرداختي", snapshot.data["payed_price"]),
                row_ditail_current_service(
                    "پورسانت پرداختي", snapshot.data["porcant"]),
                row_ditail_current_service(
                    "مبلغ باقیمانده", snapshot.data["price_left"]),
                row_ditail_current_service("مبلغ ترافیک اضافه مصرف",
                    snapshot.data["Traffic_price_Excess"]),
                row_ditail_current_service(
                    "مبناي محاسبه", snapshot.data["Calculation_basis"]),
              ],
            ),
          ));
        }
        return Container();
      },
    );
  }

  row_ditail_current_service(title, value) {
    return Container(
        color: Color(0xfff7f7f7),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  title + ": ",
                  style: TextStyle(color: Color(0xff999999)),
                ),
                Flexible(
                  child: Text(
                    value,
                    style: TextStyle(
                        color: Color(0xff666666), fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ));
  }

  Future<Map> current_service_details() async {
    var db = await SharedPreferences.getInstance();
    var header = {"cookie": db.getString("cookie")};
    var response = await get(Urls.change_service_page, headers: header);
    dom.Document document = parse(response.body);
    Map Current_service = {
      "name": document.getElementsByTagName("b")[0].text,
      "group_name": document.getElementsByTagName("b")[1].text,
      "service_type": document.getElementsByTagName("b")[2].text,
      "days_of_service": document.getElementsByTagName("b")[3].text,
      "totall_service_traffic": document.getElementsByTagName("b")[4].text,
      "used_day": document.getElementsByTagName("b")[5].text,
      "used_traffic": document.getElementsByTagName("b")[6].text,
      "days_left": document.getElementsByTagName("b")[7].text,
      "traffic_left": document.getElementsByTagName("b")[8].text,
      "payed_price": document.getElementsByTagName("b")[9].text,
      "porcant": document.getElementsByTagName("b")[10].text,
      "price_left": document.getElementsByTagName("b")[11].text,
      "Traffic_price_Excess": document.getElementsByTagName("b")[12].text,
      "Calculation_basis": document.getElementsByTagName("b")[13].text,
    };
    return Current_service;
  }
}
