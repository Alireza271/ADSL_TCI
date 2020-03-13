import 'dart:developer';
import 'package:ADSLTCI/ServiceDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ADSLTCI/ChangeServicePage.dart';
import 'ChangeServiceDialog.dart';
import 'TrafficPageDialog.dart';

items_list(list, String type, context) {
  return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: (type == "change-service"
          ? list.result.xList.length + 1
          : list.result.xList.length),
      itemBuilder: (
        BuildContext context,
        int Index,
      ) {
        if (type == "change-service") {
          if (Index == 0) return currentservice();
          return _item(list.result.xList[Index - 1], context, type);
        }
        return _item(list.result.xList[Index], context, type);
      });
}

_item(item, context, type) {
  return Card(
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            (int.parse(item.credit.toString()) / 1000).toInt().toString() +
                " گیگابایت",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            item.name,
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xff666666)),
          ),
          Text(
              (type == "traffic"
                  ? item.groupName
                  : (item.speedClass < 1000
                      ? item.speedClass.toString() +
                          " کیلوبیت بر ثانیه /" +
                          item.className
                      : (item.speedClass / 1000).toInt().toString() +
                          "مگابیت بر ثانیه /" +
                          item.className)),
              style: TextStyle(color: Color(0xff32d296))),
          Divider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton(
                  color: Color(0xff1e87f0),
                  child: Container(
                    child: Text(
                      "خرید",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () async {
                    log(item.serial.toString());
                    showDialog(
                        context: context,
                        child: (type == 'traffic'
                            ? new TrafficPageDialog(item.serial)
                            : (type == 'change-service'
                                ? ChangeServicePageDialog(
                                    item.serial.toString())
                                : ServicePageDialog(item.serial))));
                  }),
              Text(
                item.price.toString() + " ریال  ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
