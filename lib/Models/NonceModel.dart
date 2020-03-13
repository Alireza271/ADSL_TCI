// To parse this JSON data, do
//
//     final nonceModel = nonceModelFromJson(jsonString);

import 'dart:convert';

NonceModel nonceModelFromJson(String str) => NonceModel.fromMap(json.decode(str));

String nonceModelToJson(NonceModel data) => json.encode(data.toMap());

class NonceModel {
  bool ok;
  String who;
  int code;
  String msg;
  List<dynamic> meta;
  String nonce;

  NonceModel({
    this.ok,
    this.who,
    this.code,
    this.msg,
    this.meta,
    this.nonce,
  });

  factory NonceModel.fromMap(Map<String, dynamic> json) => NonceModel(
    ok: json["ok"],
    who: json["who"],
    code: json["code"],
    msg: json["msg"],
    meta: List<dynamic>.from(json["meta"].map((x) => x)),
    nonce: json["nonce"],
  );

  Map<String, dynamic> toMap() => {
    "ok": ok,
    "who": who,
    "code": code,
    "msg": msg,
    "meta": List<dynamic>.from(meta.map((x) => x)),
    "nonce": nonce,
  };
}
