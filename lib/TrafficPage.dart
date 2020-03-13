
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'List.dart';
import 'LoginPage.dart';
import 'Models/traffic_model_entity.dart';
import 'requests/RequestList.dart';

class TrafficPage extends StatefulWidget {
  @override
  _TrafficPageState createState() => _TrafficPageState();
}

class _TrafficPageState extends State<TrafficPage> {
  TrafficModelEntity _Traffic = new TrafficModelEntity();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    Startstate();
  }

  Startstate() async {
    _Traffic = await GetTraffic();
    log(_Traffic.toString());
    setState(() {});
  }

  Future<void> _refresh() async {
    _Traffic = await GetTraffic();
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
              child: Center(child: traffic_detail_Content()),
            )));
  }

  traffic_detail_Content() {
    switch (_Traffic.ok) {
      case false:
        {
          if (_Traffic.code == 2) {
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
              _Traffic = await GetTraffic();

              setState(() {});
            },
            child: Text("تلاش مجدد"),
            color: Color(0xff1e87f0),
          );
        }
        break;
      case true:
        {
          return items_list(_Traffic, 'traffic', context);
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
