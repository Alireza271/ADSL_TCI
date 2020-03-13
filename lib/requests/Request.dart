import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Nonce.dart';

class Request {
  var Model;
  String action;
  Map params;
  String Url;

  Request(this.Model, this.Url, this.action, this.params);

  Response() async {
    Dio dio = new Dio();
    var db = await SharedPreferences.getInstance();
    var _nonce = new Nonce();
    log("getnonce:"+await _nonce.GetNonce());
    var header = {"cookie": db.getString("cookie")};
    var body = {
      "nonce": await _nonce.GetNonce(),
      "action": this.action,
      "params": this.params
    };
    var response = await dio.post(Url,
        data: FormData.fromMap(body), options: Options(headers: header));
    Model.fromJson(json.decode(response.toString()));
    Nonce().SetNonce(Model.nonce);
    if(!Model.ok && Model.who=="S"&& Model.code==1){
     return Response();
    }
    if (!Model.ok && Model.who == "U") {
      Fluttertoast.showToast(msg: Model.msg);
    }
    if (!Model.ok && Model.who == "S") {
      switch (Model.code) {
        case -131101:
          {
            Fluttertoast.showToast(
                toastLength: Toast.LENGTH_LONG,
                msg:
                    "امکان تغییر سرویس برای شما وجود ندارد، زیرا: با توجه به اینکه زمان پایان قرارداد شما به پایان نرسیده است، می تونید تا پایان زمان قرارداد نسبت به خرید حجم اضافی اقدام فرمایید");
          }
      }
    }

    return Model;
  }
}
