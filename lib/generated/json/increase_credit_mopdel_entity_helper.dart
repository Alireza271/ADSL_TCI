import 'package:ADSLTCI/Models/increase_credit_mopdel_entity.dart';

increaseCreditMopdelEntityFromJson(IncreaseCreditMopdelEntity data, Map<String, dynamic> json) {
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
		data.result = new IncreaseCreditMopdelResult().fromJson(json['result']);
	}
	if (json['nonce'] != null) {
		data.nonce = json['nonce']?.toString();
	}
	return data;
}

Map<String, dynamic> increaseCreditMopdelEntityToJson(IncreaseCreditMopdelEntity entity) {
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

increaseCreditMopdelResultFromJson(IncreaseCreditMopdelResult data, Map<String, dynamic> json) {
	if (json['increment'] != null) {
		data.increment = json['increment']?.toInt();
	}
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	if (json['panel'] != null) {
		data.panel = json['panel']?.toInt();
	}
	if (json['banks'] != null) {
		data.banks = new List<IncreaseCreditMopdelResultBank>();
		(json['banks'] as List).forEach((v) {
			data.banks.add(new IncreaseCreditMopdelResultBank().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> increaseCreditMopdelResultToJson(IncreaseCreditMopdelResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['increment'] = entity.increment;
	data['total'] = entity.total;
	data['panel'] = entity.panel;
	if (entity.banks != null) {
		data['banks'] =  entity.banks.map((v) => v.toJson()).toList();
	}
	return data;
}

increaseCreditMopdelResultBankFromJson(IncreaseCreditMopdelResultBank data, Map<String, dynamic> json) {
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

Map<String, dynamic> increaseCreditMopdelResultBankToJson(IncreaseCreditMopdelResultBank entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Serial'] = entity.serial;
	data['Name'] = entity.name;
	data['Bank'] = entity.bank;
	data['Logo'] = entity.logo;
	return data;
}