import 'package:ADSLTCI/Models/bank_redirector_model_entity.dart';

bankRedirectorModelEntityFromJson(BankRedirectorModelEntity data, Map<String, dynamic> json) {
	if (json['ok'] != null) {
		data.ok = json['ok'];
	}
	if (json['who'] != null) {
		data.who = json['who']?.toString();
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['result'] != null) {
		data.result = new BankRedirectorModelResult().fromJson(json['result']);
	}
	if (json['nonce'] != null) {
		data.nonce = json['nonce']?.toString();
	}
	return data;
}

Map<String, dynamic> bankRedirectorModelEntityToJson(BankRedirectorModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ok'] = entity.ok;
	data['who'] = entity.who;
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	if (entity.result != null) {
		data['result'] = entity.result.toJson();
	}
	data['nonce'] = entity.nonce;
	return data;
}

bankRedirectorModelResultFromJson(BankRedirectorModelResult data, Map<String, dynamic> json) {
	if (json['order'] != null) {
		data.order = json['order']?.toInt();
	}
	if (json['redirector'] != null) {
		data.redirector = json['redirector']?.toString();
	}
	return data;
}

Map<String, dynamic> bankRedirectorModelResultToJson(BankRedirectorModelResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['order'] = entity.order;
	data['redirector'] = entity.redirector;
	return data;
}