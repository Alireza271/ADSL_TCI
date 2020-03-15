import 'dart:developer';

import 'package:ADSLTCI/HomePage.dart';
import 'package:ADSLTCI/Models/increase_credit_mopdel_entity.dart';
import 'package:ADSLTCI/Models/service_ditails_model_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'LoginPage.dart';
import 'Models/bank_redirector_model_entity.dart';
import 'Models/change_service_ditail_model_entity.dart';
import 'PaymentPage.dart';
import 'TrafficPage.dart';
import 'requests/RequestList.dart';

class IncrementDialog extends StatefulWidget {
  int Increment;

  IncrementDialog(this.Increment);

  @override
  _IncrementDialog createState() => _IncrementDialog(this.Increment);
}

class _IncrementDialog extends State<IncrementDialog> {
  IncreaseCreditMopdelEntity _Increase = new IncreaseCreditMopdelEntity();
  BankRedirectorModelEntity BankRedirector;
  bool pay_state = false;
  var Content;
  String order_id = "_";
  int Increment;
  String selected_bank;

  _IncrementDialog(this.Increment);

  @override
  void initState() {
    StartState();
    // TODO: implement initState
    super.initState();
  }

  StartState() async {
    _Increase = await GetIncreaseCredit(Increment);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Content = dialog_content();

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
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
            value.toString(),
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
    switch (_Increase.ok) {
      case false:
        {
          if (_Increase.code == 2) {
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
            onPressed: () async {},
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
              row_text("مقدار افزایش	", _Increase.result.increment,
                  title_color: 0xff1e87f0, rial: true),
              SizedBox(
                height: 15,
              ),
              Divider(),
              SizedBox(
                height: 15,
              ),
              row_text("اعتبار کنونی	", _Increase.result.panel,
                  title_color: 0xff32d296, rial: true),
              SizedBox(
                height: 15,
              ),
              row_text("اعتبار پس از افزایش	",
                  _Increase.result.panel + _Increase.result.increment,
                  rial: true),
              SizedBox(
                height: 15,
              ),
              Divider(),
              SizedBox(
                height: 15,
              ),
              row_text("هزینه نهایی	", _Increase.result.total),
              SizedBox(
                height: 15,
              ),
              Divider(),

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
                        selected_bank = _Increase.result.banks[0].serial;

                        setState(() {});
                      },
                      child: Container(
                        decoration: (selected_bank ==
                                _Increase.result.banks[0].serial
                            ? BoxDecoration(
                                border: Border.all(color: Color(0xff1e87f0)))
                            : BoxDecoration()),
                        child: Image.network(
                          _Increase.result.banks[0].logo,
                          height: 150,
                        ),
                      )),
                  GestureDetector(
                      onTap: () {
                        selected_bank = _Increase.result.banks[1].serial;

                        setState(() {});
                      },
                      child: Container(
                        decoration: (selected_bank ==
                                _Increase.result.banks[1].serial
                            ? BoxDecoration(
                                border: Border.all(color: Color(0xff1e87f0)))
                            : BoxDecoration()),
                        child: Image.network(
                          _Increase.result.banks[1].logo,
                          height: 150,
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
                        return HomePage();
                      }));
                    } else {
                      BankRedirector = await GetBankRedirector("wallet",
                          _Increase.result.increment.toString(), selected_bank);
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
