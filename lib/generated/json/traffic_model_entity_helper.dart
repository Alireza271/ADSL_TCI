import 'package:ADSLTCI/Models/traffic_model_entity.dart';

trafficModelEntityFromJson(TrafficModelEntity data, Map<String, dynamic> json) {
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
		data.result = new TrafficModelResult().fromJson(json['result']);
	}
	if (json['nonce'] != null) {
		data.nonce = json['nonce']?.toString();
	}
	return data;
}

Map<String, dynamic> trafficModelEntityToJson(TrafficModelEntity entity) {
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

trafficModelResultFromJson(TrafficModelResult data, Map<String, dynamic> json) {
	if (json['list'] != null) {
		data.xList = new List<TrafficModelResultList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new TrafficModelResultList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> trafficModelResultToJson(TrafficModelResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

trafficModelResultListFromJson(TrafficModelResultList data, Map<String, dynamic> json) {
	if (json['Serial'] != null) {
		data.serial = json['Serial']?.toString();
	}
	if (json['Name'] != null) {
		data.name = json['Name']?.toString();
	}
	if (json['Credit'] != null) {
		data.credit = json['Credit']?.toString();
	}
	if (json['Price'] != null) {
		data.price = json['Price']?.toString();
	}
	if (json['Special'] != null) {
		data.special = json['Special']?.toString();
	}
	if (json['GroupName'] != null) {
		data.groupName = json['GroupName']?.toString();
	}
	return data;
}

Map<String, dynamic> trafficModelResultListToJson(TrafficModelResultList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Serial'] = entity.serial;
	data['Name'] = entity.name;
	data['Credit'] = entity.credit;
	data['Price'] = entity.price;
	data['Special'] = entity.special;
	data['GroupName'] = entity.groupName;
	return data;
}