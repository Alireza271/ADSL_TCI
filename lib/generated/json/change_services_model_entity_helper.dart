import 'package:ADSLTCI/Models/change_services_model_entity.dart';

changeServicesModelEntityFromJson(ChangeServicesModelEntity data, Map<String, dynamic> json) {
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
		data.result = new ChangeServicesModelResult().fromJson(json['result']);
	}
	if (json['nonce'] != null) {
		data.nonce = json['nonce']?.toString();
	}
	return data;
}

Map<String, dynamic> changeServicesModelEntityToJson(ChangeServicesModelEntity entity) {
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

changeServicesModelResultFromJson(ChangeServicesModelResult data, Map<String, dynamic> json) {
	if (json['list'] != null) {
		data.xList = new List<ChangeServicesModelResultList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new ChangeServicesModelResultList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> changeServicesModelResultToJson(ChangeServicesModelResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

changeServicesModelResultListFromJson(ChangeServicesModelResultList data, Map<String, dynamic> json) {
	if (json['Serial'] != null) {
		data.serial = json['Serial']?.toInt();
	}
	if (json['Name'] != null) {
		data.name = json['Name']?.toString();
	}
	if (json['ServiceType'] != null) {
		data.serviceType = json['ServiceType']?.toString();
	}
	if (json['Credit'] != null) {
		data.credit = json['Credit']?.toInt();
	}
	if (json['Price'] != null) {
		data.price = json['Price']?.toInt();
	}
	if (json['Ghest'] != null) {
		data.ghest = json['Ghest']?.toInt();
	}
	if (json['FreeGig'] != null) {
		data.freeGig = json['FreeGig']?.toInt();
	}
	if (json['MinPrice'] != null) {
		data.minPrice = json['MinPrice']?.toInt();
	}
	if (json['SpeedClass'] != null) {
		data.speedClass = json['SpeedClass']?.toInt();
	}
	if (json['Special'] != null) {
		data.special = json['Special'];
	}
	if (json['ClassName'] != null) {
		data.className = json['ClassName']?.toString();
	}
	if (json['Days'] != null) {
		data.days = json['Days']?.toInt();
	}
	if (json['Class'] != null) {
		data.xClass = json['Class']?.toString();
	}
	if (json['Mah'] != null) {
		data.mah = json['Mah']?.toInt();
	}
	return data;
}

Map<String, dynamic> changeServicesModelResultListToJson(ChangeServicesModelResultList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Serial'] = entity.serial;
	data['Name'] = entity.name;
	data['ServiceType'] = entity.serviceType;
	data['Credit'] = entity.credit;
	data['Price'] = entity.price;
	data['Ghest'] = entity.ghest;
	data['FreeGig'] = entity.freeGig;
	data['MinPrice'] = entity.minPrice;
	data['SpeedClass'] = entity.speedClass;
	data['Special'] = entity.special;
	data['ClassName'] = entity.className;
	data['Days'] = entity.days;
	data['Class'] = entity.xClass;
	data['Mah'] = entity.mah;
	return data;
}