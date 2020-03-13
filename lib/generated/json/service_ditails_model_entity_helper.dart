import 'package:ADSLTCI/Models/service_ditails_model_entity.dart';

serviceDitailsModelEntityFromJson(ServiceDitailsModelEntity data, Map<String, dynamic> json) {
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
		data.result = new ServiceDitailsModelResult().fromJson(json['result']);
	}
	if (json['nonce'] != null) {
		data.nonce = json['nonce']?.toString();
	}
	return data;
}

Map<String, dynamic> serviceDitailsModelEntityToJson(ServiceDitailsModelEntity entity) {
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

serviceDitailsModelResultFromJson(ServiceDitailsModelResult data, Map<String, dynamic> json) {
	if (json['service'] != null) {
		data.service = new ServiceDitailsModelResultService().fromJson(json['service']);
	}
	if (json['banks'] != null) {
		data.banks = new List<ServiceDitailsModelResultBank>();
		(json['banks'] as List).forEach((v) {
			data.banks.add(new ServiceDitailsModelResultBank().fromJson(v));
		});
	}
	if (json['costs'] != null) {
		data.costs = new ServiceDitailsModelResultCosts().fromJson(json['costs']);
	}
	return data;
}

Map<String, dynamic> serviceDitailsModelResultToJson(ServiceDitailsModelResult entity) {
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

serviceDitailsModelResultServiceFromJson(ServiceDitailsModelResultService data, Map<String, dynamic> json) {
	if (json['Serial'] != null) {
		data.serial = json['Serial']?.toString();
	}
	if (json['ServiceGroup'] != null) {
		data.serviceGroup = json['ServiceGroup']?.toInt();
	}
	if (json['Name'] != null) {
		data.name = json['Name']?.toString();
	}
	if (json['IBSName'] != null) {
		data.iBSName = json['IBSName']?.toString();
	}
	if (json['Credit'] != null) {
		data.credit = json['Credit']?.toInt();
	}
	if (json['FreeCredit'] != null) {
		data.freeCredit = json['FreeCredit']?.toInt();
	}
	if (json['ID'] != null) {
		data.iD = json['ID']?.toString();
	}
	if (json['Price'] != null) {
		data.price = json['Price']?.toInt();
	}
	if (json['Class'] != null) {
		data.xClass = json['Class']?.toString();
	}
	if (json['AAAClass'] != null) {
		data.aAAClass = json['AAAClass']?.toString();
	}
	if (json['DayClass'] != null) {
		data.dayClass = json['DayClass']?.toInt();
	}
	if (json['FreeDays'] != null) {
		data.freeDays = json['FreeDays'];
	}
	if (json['SpeedClass'] != null) {
		data.speedClass = json['SpeedClass']?.toInt();
	}
	if (json['Special'] != null) {
		data.special = json['Special'];
	}
	if (json['Active'] != null) {
		data.active = json['Active'];
	}
	if (json['Visible'] != null) {
		data.visible = json['Visible'];
	}
	if (json['Agent'] != null) {
		data.agent = json['Agent']?.toString();
	}
	if (json['Staff'] != null) {
		data.staff = json['Staff']?.toString();
	}
	if (json['Register'] != null) {
		data.register = json['Register']?.toString();
	}
	if (json['ForRanje'] != null) {
		data.forRanje = json['ForRanje']?.toString();
	}
	if (json['ForSharj'] != null) {
		data.forSharj = json['ForSharj']?.toString();
	}
	if (json['Bestankar'] != null) {
		data.bestankar = json['Bestankar']?.toString();
	}
	if (json['TownshipRef'] != null) {
		data.townshipRef = json['TownshipRef']?.toInt();
	}
	if (json['BranchRef'] != null) {
		data.branchRef = json['BranchRef']?.toInt();
	}
	if (json['Created'] != null) {
		data.created = json['Created']?.toString();
	}
	if (json['ServiceType'] != null) {
		data.serviceType = json['ServiceType']?.toString();
	}
	if (json['Ranje'] != null) {
		data.ranje = json['Ranje']?.toString();
	}
	if (json['Nasb'] != null) {
		data.nasb = json['Nasb']?.toString();
	}
	if (json['Modem'] != null) {
		data.modem = json['Modem']?.toString();
	}
	if (json['Ghest'] != null) {
		data.ghest = json['Ghest']?.toInt();
	}
	if (json['FreeDay'] != null) {
		data.freeDay = json['FreeDay'];
	}
	if (json['FreeGig'] != null) {
		data.freeGig = json['FreeGig']?.toInt();
	}
	if (json['MinPrice'] != null) {
		data.minPrice = json['MinPrice']?.toInt();
	}
	if (json['CalcType'] != null) {
		data.calcType = json['CalcType'];
	}
	if (json['PerGigPrice'] != null) {
		data.perGigPrice = json['PerGigPrice'];
	}
	if (json['Type'] != null) {
		data.type = json['Type']?.toString();
	}
	if (json['Comment'] != null) {
		data.comment = json['Comment']?.toString();
	}
	if (json['AddIn'] != null) {
		data.addIn = json['AddIn'];
	}
	if (json['ArpoPrice'] != null) {
		data.arpoPrice = json['ArpoPrice']?.toString();
	}
	if (json['IsNotMoveable'] != null) {
		data.isNotMoveable = json['IsNotMoveable']?.toString();
	}
	if (json['FOM'] != null) {
		data.fOM = json['FOM'];
	}
	if (json['FOY'] != null) {
		data.fOY = json['FOY']?.toString();
	}
	if (json['IsDel'] != null) {
		data.isDel = json['IsDel']?.toString();
	}
	if (json['IsMoveAble'] != null) {
		data.isMoveAble = json['IsMoveAble']?.toString();
	}
	if (json['IsExtraday'] != null) {
		data.isExtraday = json['IsExtraday']?.toString();
	}
	if (json['IsKart'] != null) {
		data.isKart = json['IsKart']?.toString();
	}
	if (json['IsMesi'] != null) {
		data.isMesi = json['IsMesi']?.toString();
	}
	if (json['HasMobileSim'] != null) {
		data.hasMobileSim = json['HasMobileSim']?.toString();
	}
	if (json['NetType'] != null) {
		data.netType = json['NetType']?.toString();
	}
	if (json['AutoRenew'] != null) {
		data.autoRenew = json['AutoRenew']?.toString();
	}
	if (json['InIvr'] != null) {
		data.inIvr = json['InIvr'];
	}
	if (json['IvrRef'] != null) {
		data.ivrRef = json['IvrRef'];
	}
	if (json['UssdRef'] != null) {
		data.ussdRef = json['UssdRef'];
	}
	if (json['UssdName'] != null) {
		data.ussdName = json['UssdName'];
	}
	if (json['FTTHProductId'] != null) {
		data.fTTHProductId = json['FTTHProductId']?.toString();
	}
	if (json['PaID'] != null) {
		data.paID = json['PaID']?.toString();
	}
	if (json['AC'] != null) {
		data.aC = json['AC']?.toString();
	}
	if (json['NetMedia'] != null) {
		data.netMedia = json['NetMedia']?.toString();
	}
	if (json['Renew'] != null) {
		data.renew = json['Renew']?.toString();
	}
	if (json['CharjeType'] != null) {
		data.charjeType = json['CharjeType']?.toString();
	}
	if (json['ExtraFupTrafic'] != null) {
		data.extraFupTrafic = json['ExtraFupTrafic']?.toString();
	}
	if (json['CharjeRoll'] != null) {
		data.charjeRoll = json['CharjeRoll'];
	}
	if (json['IsCard'] != null) {
		data.isCard = json['IsCard'];
	}
	if (json['FreeNightCredit'] != null) {
		data.freeNightCredit = json['FreeNightCredit']?.toString();
	}
	if (json['ConvertID'] != null) {
		data.convertID = json['ConvertID']?.toString();
	}
	if (json['isapprove_ibsname'] != null) {
		data.isapproveIbsname = json['isapprove_ibsname']?.toString();
	}
	if (json['SID'] != null) {
		data.sID = json['SID']?.toString();
	}
	if (json['OldActive'] != null) {
		data.oldActive = json['OldActive']?.toString();
	}
	if (json['NetBillGroup'] != null) {
		data.netBillGroup = json['NetBillGroup']?.toString();
	}
	if (json['CanReserve'] != null) {
		data.canReserve = json['CanReserve']?.toString();
	}
	if (json['ShahkarBypass'] != null) {
		data.shahkarBypass = json['ShahkarBypass']?.toString();
	}
	if (json['GroupName'] != null) {
		data.groupName = json['GroupName']?.toString();
	}
	if (json['IsApprove'] != null) {
		data.isApprove = json['IsApprove'];
	}
	if (json['SpeedControl'] != null) {
		data.speedControl = json['SpeedControl'];
	}
	if (json['ClassName'] != null) {
		data.className = json['ClassName']?.toString();
	}
	if (json['ClassMonth'] != null) {
		data.classMonth = json['ClassMonth']?.toString();
	}
	return data;
}

Map<String, dynamic> serviceDitailsModelResultServiceToJson(ServiceDitailsModelResultService entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Serial'] = entity.serial;
	data['ServiceGroup'] = entity.serviceGroup;
	data['Name'] = entity.name;
	data['IBSName'] = entity.iBSName;
	data['Credit'] = entity.credit;
	data['FreeCredit'] = entity.freeCredit;
	data['ID'] = entity.iD;
	data['Price'] = entity.price;
	data['Class'] = entity.xClass;
	data['AAAClass'] = entity.aAAClass;
	data['DayClass'] = entity.dayClass;
	data['FreeDays'] = entity.freeDays;
	data['SpeedClass'] = entity.speedClass;
	data['Special'] = entity.special;
	data['Active'] = entity.active;
	data['Visible'] = entity.visible;
	data['Agent'] = entity.agent;
	data['Staff'] = entity.staff;
	data['Register'] = entity.register;
	data['ForRanje'] = entity.forRanje;
	data['ForSharj'] = entity.forSharj;
	data['Bestankar'] = entity.bestankar;
	data['TownshipRef'] = entity.townshipRef;
	data['BranchRef'] = entity.branchRef;
	data['Created'] = entity.created;
	data['ServiceType'] = entity.serviceType;
	data['Ranje'] = entity.ranje;
	data['Nasb'] = entity.nasb;
	data['Modem'] = entity.modem;
	data['Ghest'] = entity.ghest;
	data['FreeDay'] = entity.freeDay;
	data['FreeGig'] = entity.freeGig;
	data['MinPrice'] = entity.minPrice;
	data['CalcType'] = entity.calcType;
	data['PerGigPrice'] = entity.perGigPrice;
	data['Type'] = entity.type;
	data['Comment'] = entity.comment;
	data['AddIn'] = entity.addIn;
	data['ArpoPrice'] = entity.arpoPrice;
	data['IsNotMoveable'] = entity.isNotMoveable;
	data['FOM'] = entity.fOM;
	data['FOY'] = entity.fOY;
	data['IsDel'] = entity.isDel;
	data['IsMoveAble'] = entity.isMoveAble;
	data['IsExtraday'] = entity.isExtraday;
	data['IsKart'] = entity.isKart;
	data['IsMesi'] = entity.isMesi;
	data['HasMobileSim'] = entity.hasMobileSim;
	data['NetType'] = entity.netType;
	data['AutoRenew'] = entity.autoRenew;
	data['InIvr'] = entity.inIvr;
	data['IvrRef'] = entity.ivrRef;
	data['UssdRef'] = entity.ussdRef;
	data['UssdName'] = entity.ussdName;
	data['FTTHProductId'] = entity.fTTHProductId;
	data['PaID'] = entity.paID;
	data['AC'] = entity.aC;
	data['NetMedia'] = entity.netMedia;
	data['Renew'] = entity.renew;
	data['CharjeType'] = entity.charjeType;
	data['ExtraFupTrafic'] = entity.extraFupTrafic;
	data['CharjeRoll'] = entity.charjeRoll;
	data['IsCard'] = entity.isCard;
	data['FreeNightCredit'] = entity.freeNightCredit;
	data['ConvertID'] = entity.convertID;
	data['isapprove_ibsname'] = entity.isapproveIbsname;
	data['SID'] = entity.sID;
	data['OldActive'] = entity.oldActive;
	data['NetBillGroup'] = entity.netBillGroup;
	data['CanReserve'] = entity.canReserve;
	data['ShahkarBypass'] = entity.shahkarBypass;
	data['GroupName'] = entity.groupName;
	data['IsApprove'] = entity.isApprove;
	data['SpeedControl'] = entity.speedControl;
	data['ClassName'] = entity.className;
	data['ClassMonth'] = entity.classMonth;
	return data;
}

serviceDitailsModelResultBankFromJson(ServiceDitailsModelResultBank data, Map<String, dynamic> json) {
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

Map<String, dynamic> serviceDitailsModelResultBankToJson(ServiceDitailsModelResultBank entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Serial'] = entity.serial;
	data['Name'] = entity.name;
	data['Bank'] = entity.bank;
	data['Logo'] = entity.logo;
	return data;
}

serviceDitailsModelResultCostsFromJson(ServiceDitailsModelResultCosts data, Map<String, dynamic> json) {
	if (json['error'] != null) {
		data.error = json['error']?.toInt();
	}
	if (json['calc_tax'] != null) {
		data.calcTax = json['calc_tax'];
	}
	if (json['tax'] != null) {
		data.tax = json['tax']?.toInt();
	}
	if (json['service'] != null) {
		data.service = json['service']?.toInt();
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
	if (json['discountLabel'] != null) {
		data.discountLabel = json['discountLabel']?.toString();
	}
	if (json['discountPercent'] != null) {
		data.discountPercent = json['discountPercent']?.toInt();
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

Map<String, dynamic> serviceDitailsModelResultCostsToJson(ServiceDitailsModelResultCosts entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['error'] = entity.error;
	data['calc_tax'] = entity.calcTax;
	data['tax'] = entity.tax;
	data['service'] = entity.service;
	data['abonman'] = entity.abonman;
	data['panel'] = entity.panel;
	data['discount'] = entity.discount;
	data['discountLabel'] = entity.discountLabel;
	data['discountPercent'] = entity.discountPercent;
	data['discountLabelPercent'] = entity.discountLabelPercent;
	data['sumWithoutTax'] = entity.sumWithoutTax;
	data['sum'] = entity.sum;
	data['total'] = entity.total;
	return data;
}