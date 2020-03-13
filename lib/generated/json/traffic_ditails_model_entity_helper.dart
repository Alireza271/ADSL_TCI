import 'package:ADSLTCI/Models/traffic_ditails_model_entity.dart';

trafficDitailsModelEntityFromJson(TrafficDitailsModelEntity data, Map<String, dynamic> json) {
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
		data.result = new TrafficDitailsModelResult().fromJson(json['result']);
	}
	if (json['nonce'] != null) {
		data.nonce = json['nonce']?.toString();
	}
	return data;
}

Map<String, dynamic> trafficDitailsModelEntityToJson(TrafficDitailsModelEntity entity) {
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

trafficDitailsModelResultFromJson(TrafficDitailsModelResult data, Map<String, dynamic> json) {
	if (json['service'] != null) {
		data.service = new TrafficDitailsModelResultService().fromJson(json['service']);
	}
	if (json['banks'] != null) {
		data.banks = new List<TrafficDitailsModelResultBank>();
		(json['banks'] as List).forEach((v) {
			data.banks.add(new TrafficDitailsModelResultBank().fromJson(v));
		});
	}
	if (json['costs'] != null) {
		data.costs = new TrafficDitailsModelResultCosts().fromJson(json['costs']);
	}
	return data;
}

Map<String, dynamic> trafficDitailsModelResultToJson(TrafficDitailsModelResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.service != null) {
		data['service'] = entity.service.toJson();
	}
	if (entity.banks != null) {
		data['banks'] =  entity.banks.map((v) => v.toJson()).toList();
	}
	if (entity.costs != null) {
		data['costs'] = entity.costs.toJson();
	}
	return data;
}

trafficDitailsModelResultServiceFromJson(TrafficDitailsModelResultService data, Map<String, dynamic> json) {
	if (json['Serial'] != null) {
		data.serial = json['Serial']?.toString();
	}
	if (json['Name'] != null) {
		data.name = json['Name']?.toString();
	}
	if (json['Comment'] != null) {
		data.comment = json['Comment'];
	}
	if (json['Credit'] != null) {
		data.credit = json['Credit']?.toString();
	}
	if (json['SpeedClass'] != null) {
		data.speedClass = json['SpeedClass']?.toString();
	}
	if (json['ClassName'] != null) {
		data.className = json['ClassName']?.toString();
	}
	if (json['GroupName'] != null) {
		data.groupName = json['GroupName']?.toString();
	}
	return data;
}

Map<String, dynamic> trafficDitailsModelResultServiceToJson(TrafficDitailsModelResultService entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Serial'] = entity.serial;
	data['Name'] = entity.name;
	data['Comment'] = entity.comment;
	data['Credit'] = entity.credit;
	data['SpeedClass'] = entity.speedClass;
	data['ClassName'] = entity.className;
	data['GroupName'] = entity.groupName;
	return data;
}

trafficDitailsModelResultBankFromJson(TrafficDitailsModelResultBank data, Map<String, dynamic> json) {
	if (json['Serial'] != null) {
		data.serial = json['Serial']?.toString();
	}
	if (json['Name'] != null) {
		data.name = json['Name']?.toString();
	}
	if (json['Bank'] != null) {
		data.bank = json['Bank']?.toString();
	}
	if (json['Logo'] != null) {
		data.logo = json['Logo']?.toString();
	}
	return data;
}

Map<String, dynamic> trafficDitailsModelResultBankToJson(TrafficDitailsModelResultBank entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Serial'] = entity.serial;
	data['Name'] = entity.name;
	data['Bank'] = entity.bank;
	data['Logo'] = entity.logo;
	return data;
}

trafficDitailsModelResultCostsFromJson(TrafficDitailsModelResultCosts data, Map<String, dynamic> json) {
	if (json['error'] != null) {
		data.error = json['error']?.toInt();
	}
	if (json['calc_tax'] != null) {
		data.calcTax = json['calc_tax'];
	}
	if (json['service'] != null) {
		data.service = json['service']?.toInt();
	}
	if (json['tax'] != null) {
		data.tax = json['tax']?.toInt();
	}
	if (json['abonman'] != null) {
		data.abonman = json['abonman']?.toInt();
	}
	if (json['panel'] != null) {
		data.panel = json['panel']?.toInt();
	}
	if (json['discount'] != null) {
		data.discount = json['discount']?.toInt();
	}
	if (json['discountPercent'] != null) {
		data.discountPercent = json['discountPercent']?.toInt();
	}
	if (json['discountLabel'] != null) {
		data.discountLabel = json['discountLabel']?.toString();
	}
	if (json['discountLabelPercent'] != null) {
		data.discountLabelPercent = json['discountLabelPercent']?.toString();
	}
	if (json['sumWithoutTax'] != null) {
		data.sumWithoutTax = json['sumWithoutTax']?.toInt();
	}
	if (json['sum'] != null) {
		data.sum = json['sum']?.toInt();
	}
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	return data;
}

Map<String, dynamic> trafficDitailsModelResultCostsToJson(TrafficDitailsModelResultCosts entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['error'] = entity.error;
	data['calc_tax'] = entity.calcTax;
	data['service'] = entity.service;
	data['tax'] = entity.tax;
	data['abonman'] = entity.abonman;
	data['panel'] = entity.panel;
	data['discount'] = entity.discount;
	data['discountPercent'] = entity.discountPercent;
	data['discountLabel'] = entity.discountLabel;
	data['discountLabelPercent'] = entity.discountLabelPercent;
	data['sumWithoutTax'] = entity.sumWithoutTax;
	data['sum'] = entity.sum;
	data['total'] = entity.total;
	return data;
}