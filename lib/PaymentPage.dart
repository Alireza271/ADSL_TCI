import 'dart:convert';
import 'dart:developer';

import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Models/bank_redirector_model_entity.dart';

Payment(BankRedirectorModelEntity BankRedirector) async {
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
