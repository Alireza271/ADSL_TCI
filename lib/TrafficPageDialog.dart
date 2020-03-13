import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'LoginPage.dart';
import 'Models/bank_redirector_model_entity.dart';
import 'Models/traffic_ditails_model_entity.dart';
import 'PaymentPage.dart';
import 'TrafficPage.dart';
import 'requests/RequestList.dart';

class TrafficPageDialog extends StatefulWidget {
  String serial;

  TrafficPageDialog(this.serial);

  @override
  _DialogState createState() => _DialogState(this.serial);
}

class _DialogState extends State<TrafficPageDialog> {
  TrafficDitailsModelEntity _Traffic_details = new TrafficDitailsModelEntity();
  BankRedirectorModelEntity BankRedirector;
  bool pay_state = false;
  var Content;
  String order_id = "_";
  String serial;
  String selected_bank;

  _DialogState(this.serial);

  @override
  void initState() {
    StartState();
    // TODO: implement initState
    super.initState();
  }

  StartState() async {
    _Traffic_details = await GetTerafficDitails(serial);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Content = dialog_content();

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.only(top: 80, bottom: 50, right: 10, left: 10),
          child: Material(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Content),
        ));
  }

  row_text(title, value, {title_color = 0xff333333, rial = false}) {
    var row = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          title + ":     ",
          style: TextStyle(
              color: Color(
                title_color,
              ),
              fontWeight: FontWeight.bold),
        ),
        Flexible(
          child: Text(
            value,
            style: TextStyle(color: Color(0xff666666)),
          ),
        ),
        Text("  ریال"),
      ],
    );

    (rial ? null : row.children.removeLast());
    return row;
  }

  dialog_content() {
    switch (_Traffic_details.ok) {
      case false:
        {
          if (_Traffic_details.code == 2) {
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
              _Traffic_details = await GetTraffic();

              setState(() {});

              _Traffic_details = await GetTraffic();

              setState(() {});
            },
            child: Text("تلاش مجدد"),
            color: Color(0xff1e87f0),
          );
        }
        break;
      case true:
        {
          return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "ویژگی‌های سفارش",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xff333333)),
                  ),
                  IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      })
                ],
              ),
              Divider(),
              SizedBox(
                height: 5,
              ),
              row_text("نام ترافیک", _Traffic_details.result.service.name),
              SizedBox(
                height: 15,
              ),
              row_text("توضیحات",
                  _Traffic_details.result.service.comment.toString()),
              SizedBox(
                height: 15,
              ),
              row_text(
                  "حجم ترافیک",
                  (int.parse(_Traffic_details.result.service.credit) / 1000)
                      .toString() +
                      " گیگابایت"),
              Divider(),
              row_text(
                  "اعتبار پنل", _Traffic_details.result.costs.panel.toString(),
                  rial: true, title_color: 0xff32d296),
              Divider(),
              SizedBox(
                height: 15,
              ),
              row_text("قیمت ترافیک",
                  _Traffic_details.result.costs.service.toString(),
                  title_color: 0xff1e87f0, rial: true),
              SizedBox(
                height: 15,
              ),
              row_text("مالیات ارزش افزوده",
                  _Traffic_details.result.costs.tax.toString(),
                  rial: true),
              SizedBox(
                height: 15,
              ),
              row_text("هزینه نهایی + ۹٪",
                  _Traffic_details.result.costs.total.toString(),
                  rial: true, title_color: 0xfffaa05a),
              SizedBox(
                height: 15,
              ),
              Divider(),
              SizedBox(
                height: 15,
              ),
              Text(
                "درگاه پرداخت آنلاین مورد نظر را انتخاب کنید:",
                style: TextStyle(color: Color(0xff666666), fontSize: 20),
              ),
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            selected_bank = _Traffic_details.result.banks[0].serial;

                            setState(() {});
                          },
                          child: Container(
                            decoration: (selected_bank ==
                                _Traffic_details.result.banks[0].serial
                                ? BoxDecoration(
                                border: Border.all(color: Color(0xff1e87f0)))
                                : BoxDecoration()),
                            child: Image.network(
                              _Traffic_details.result.banks[0].logo,
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            selected_bank = _Traffic_details.result.banks[1].serial;

                            setState(() {});
                          },
                          child: Container(
                            decoration: (selected_bank ==
                                _Traffic_details.result.banks[1].serial
                                ? BoxDecoration(
                                border: Border.all(color: Color(0xff1e87f0)))
                                : BoxDecoration()),
                            child: Image.network(
                              _Traffic_details.result.banks[1].logo,
                            ),
                          )),
                    ],
                  )),
              row_text("شماره سفارش", order_id),
              RaisedButton(
                onPressed: () async {
                  if (selected_bank == null) {
                    Fluttertoast.showToast(
                        msg: "درگاه پرداخت آنلاین مورد نظر را انتخاب کنید");
                  } else {
                    if (pay_state) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            Payment(BankRedirector, context);
                            return TrafficPage();
                          }));
                    } else {
                      BankRedirector = await GetBankRedirector("traffice",
                          _Traffic_details.result.service.serial,
                          selected_bank);

                      if (BankRedirector.ok) {
                        order_id = BankRedirector.result.order.toString();
                        pay_state = true;
                      } else {
                        Fluttertoast.showToast(
                            msg: "مشکلی در اتصال به بانک وجود دارد");
                      }
                    }

                    setState(() {});
                  }
//
                },
                child: Text(
                  (pay_state ? "پرداخت" : "ادامه"),
                  style: TextStyle(color: Colors.white),
                ),
                color: Color(0xff1e87f0),
              )
            ],
          );
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
