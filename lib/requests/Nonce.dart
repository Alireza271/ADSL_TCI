import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class Nonce {

  void SetNonceByHtml(source) async {
    source = source;
    var nonce = source.split('var ajaxNonce = "')[1];
    nonce = nonce.split('"')[0].toString();
    log(nonce);
    var db = await SharedPreferences.getInstance();
    db.setString("nonce", nonce);
  }

  Future<String> GetNonce() async {
    var db = await SharedPreferences.getInstance();
    return db.getString("nonce");
  }
  void SetNonce(String nonce) async {
    var db = await SharedPreferences.getInstance();
    db.setString("nonce", nonce);
  }

}
