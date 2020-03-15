
import 'package:ADSLTCI/Models/service_model_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'List.dart';
import 'LoginPage.dart';
import 'requests/RequestList.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  ServiceModelEntity _serrvice = new ServiceModelEntity();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    Startstate();
  }

  Startstate() async {
    _serrvice = await GetService();
    log(_serrvice.toString());
    setState(() {});
  }

  Future<void> _refresh() async {
    _serrvice = await GetService();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: _refresh,
              child: Center(child: traffic_detail_Content()),
            )));
  }

  traffic_detail_Content() {
    switch (_serrvice.ok) {
      case false:
        {
          if (_serrvice.code == 2) {
            return RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Text(
                "ورود مجدد",
                style: TextStyle(color: Colors.white),
              ),
              color: Color(0xff1e87f0),
            );
          }
          return RaisedButton(
            onPressed: () async {
              _serrvice = await GetService();

              setState(() {});
            },
            child: Text("تلاش مجدد"),
            color: Color(0xff1e87f0),
          );
        }
        break;
      case true:
        {
          return items_list(_serrvice, 'service', context);
        }
        break;
      default:
        {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              Text("لطفا صبر کنید...")
            ],
          );
        }
    }
  }
}
