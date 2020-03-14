import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Models/bank_redirector_model_entity.dart';

Payment(BankRedirectorModelEntity BankRedirector, context) async {
  Document form = parse(BankRedirector.result.redirector);
  Map data = {};
  data["form"] = json.encode(form.getElementsByTagName("form")[0].attributes);
  List inputs = [];
  form.getElementsByTagName("form")[0].children.forEach((child) {
    inputs.add({
      "name": child.attributes["name"],
      "value": child.attributes["value"],
      "type": child.attributes['type']
    });
  });

  data["inputs"] = json.encode(inputs);
  log(data.toString());

  launch("http://adsl.developer271.ir/api/redirect_to_bank?address=" +
      json.encode(data));
}
//  FlutterWebviewPlugin webview = new FlutterWebviewPlugin();
//
//  var db = await SharedPreferences.getInstance();
//
//  webview.launch(
//    new Uri.dataFromString(_loadHTML(BankRedirector), mimeType: 'text/html')
//        .toString(),
//  );
//  webview.onUrlChanged.listen((url) {
//
//    if (url == "https://adsl.tci.ir/panel/payment-result") {
//      webview.hide();
//      webview.getSource().then((source) async {
//        db.setString("source", source.toString());
//        dom.Document payment_result = parse(source);
//        webview.close();
//        webview.dispose();
//
//        show_result_alert(payment_result, context);
//      });
//    }
//  });
//}

//_loadHTML(BankRedirector) {
//  String submit_id = parse(BankRedirector.result.redirector)
//      .getElementsByTagName("form")
//      .first
//      .attributes['id'];
//  String _html_source = '''<html>
//                  <body onload="document.''' +
//      submit_id +
//      '''.submit();">
//                ''' +
//      BankRedirector.result.redirector +
//      '''
//                  </body>
//                  </html>''';
//  return _html_source;
//}

//show_result_alert(dom.Document payment_result, context) {
//  if (payment_result
//      .getElementsByClassName("uk-alert-success uk-alert")
//      .isNotEmpty) {
//    var success =
//        payment_result.getElementsByClassName("uk-alert-success uk-alert");
//    String order_id_status = success[0].firstChild.children[1].firstChild.text;
//    String description = success[1].firstChild.children[1].firstChild.text;
//    String payment_port = payment_result
//        .getElementsByTagName("table")
//        .first
//        .children[0]
//        .children[0]
//        .children[1]
//        .text;
//    var payment_port_logo = payment_result
//        .getElementsByTagName("table")
//        .first
//        .children[0]
//        .children[0]
//        .children[1]
//        .children[0]
//        .attributes['src'];
//    String traffic_name = payment_result
//        .getElementsByTagName("table")
//        .first
//        .children[0]
//        .children[1]
//        .children[1]
//        .text;
//    String amount_pay = payment_result
//        .getElementsByTagName("table")
//        .first
//        .children[0]
//        .children[2]
//        .children[1]
//        .text;
//
//       showDialog(
//        context: context,
//        child: SimpleDialog(
//          backgroundColor: Color(0xff5cb860),
//          title: Text(
//            "گزارش خرید",
//            textAlign: TextAlign.center,
//            style: TextStyle(color: Colors.white),
//          ),
//          children: <Widget>[
//            Text(
//              order_id_status,
//              textAlign: TextAlign.center,
//              style: TextStyle(color: Colors.white),
//            ),
//            Text(
//              description,
//              textAlign: TextAlign.center,
//              style: TextStyle(color: Colors.white),
//            ),
//            Text(
//              payment_port,
//              textAlign: TextAlign.center,
//              style: TextStyle(color: Colors.white),
//            ),
//            Text(
//              traffic_name,
//              textAlign: TextAlign.center,
//              style: TextStyle(color: Colors.white),
//            ),
//            Text(
//              amount_pay,
//              textAlign: TextAlign.center,
//              style: TextStyle(color: Colors.white),
//            ),
//          ],
//        ));
//  }
//
//  if (payment_result
//      .getElementsByClassName("uk-alert-danger uk-alert")
//      .isNotEmpty) {
//    var danger =
//        payment_result.getElementsByClassName("uk-alert-danger uk-alert");
//    String payment_result_message =
//        danger[0].children[0].children[1].children[0].children[0].text;
//    String paymentport_message =
//        danger[0].children[0].children[1].children[0].children[1].text;
//    String order_id =
//        danger[0].children[0].children[1].children[0].children[2].text;
//
//
//    showDialog(
//        context: context,
//        child: SimpleDialog(
//          backgroundColor: Color(0xfff55a4e),
//          title: Text(
//            "گزارش خرید",
//            textAlign: TextAlign.center,
//            style: TextStyle(color: Colors.white),
//          ),
//          children: <Widget>[
//            Text(
//              payment_result_message,
//              textAlign: TextAlign.center,
//              style: TextStyle(color: Colors.white),
//            ),
//            Text(
//              paymentport_message,
//              textAlign: TextAlign.center,
//              style: TextStyle(color: Colors.white),
//            ),
//            Text(
//              order_id,
//              textAlign: TextAlign.center,
//              style: TextStyle(color: Colors.white),
//            ),
//          ],
//        ));
//  }
//}
