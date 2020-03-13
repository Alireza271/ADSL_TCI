import 'package:ADSLTCI/Models/change_service_ditail_model_entity.dart';

changeServiceDitailModelEntityFromJson(ChangeServiceDitailModelEntity data, Map<String, dynamic> json) {
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
		data.result = new ChangeServiceDitailModelResult().fromJson(json['result']);
	}
	if (json['nonce'] != null) {
		data.nonce = json['nonce']?.toString();
	}
	return data;
}

Map<String, dynamic> changeServiceDitailModelEntityToJson(ChangeServiceDitailModelEntity entity) {
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

changeServiceDitailModelResultFromJson(ChangeServiceDitailModelResult data, Map<String, dynamic> json) {
	if (json['service'] != null) {
		data.service = new ChangeServiceDitailModelResultService().fromJson(json['service']);
	}
	if (json['banks'] != null) {
		data.banks = new List<ChangeServiceDitailModelResultBank>();
		(json['banks'] as List).forEach((v) {
			data.banks.add(new ChangeServiceDitailModelResultBank().fromJson(v));
		});
	}
	if (json['costs'] != null) {
		data.costs = new ChangeServiceDitailModelResultCosts().fromJson(json['costs']);
	}
	if (json['KhesaratPrice'] != null) {
		data.khesaratPrice = json['KhesaratPrice']?.toInt();
	}
	return data;
}

Map<String, dynamic> changeServiceDitailModelResultToJson(ChangeServiceDitailModelResult entity) {
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
	data['KhesaratPrice'] = entity.khesaratPrice;
	return data;
}

changeServiceDitailModelResultServiceFromJson(ChangeServiceDitailModelResultService data, Map<String, dynamic> json) {
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

Map<String, dynamic> changeServiceDitailModelResultServiceToJson(ChangeServiceDitailModelResultService entity) {
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

changeServiceDitailModelResultBankFromJson(ChangeServiceDitailModelResultBank data, Map<String, dynamic> json) {
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

Map<String, dynamic> changeServiceDitailModelResultBankToJson(ChangeServiceDitailModelResultBank entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['Serial'] = entity.serial;
	data['Name'] = entity.name;
	data['Bank'] = entity.bank;
	data['Logo'] = entity.logo;
	return data;
}

changeServiceDitailModelResultCostsFromJson(ChangeServiceDitailModelResultCosts data, Map<String, dynamic> json) {
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
	if (json['remain'] != null) {
		data.remain = json['remain']?.toInt();
	}
	if (json['sum'] != null) {
		data.sum = json['sum']?.toInt();
	}
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	if (json['ExtraPrice'] != null) {
		data.extraPrice = json['ExtraPrice']?.toInt();
	}
	if (json['changeinfo'] != null) {
		data.changeinfo = new ChangeServiceDitailModelResultCostsChangeinfo().fromJson(json['changeinfo']);
	}
	if (json['confirminfo'] != null) {
		data.confirminfo = new ChangeServiceDitailModelResultCostsConfirminfo().fromJson(json['confirminfo']);
	}
	return data;
}

Map<String, dynamic> changeServiceDitailModelResultCostsToJson(ChangeServiceDitailModelResultCosts entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['error'] = entity.error;
	data['calc_tax'] = entity.calcTax;
	data['tax'] = entity.tax;
	data['service'] = entity.service;
	data['abonman'] = entity.abonman;
	data['panel'] = entity.panel;
	data['discount'] = entity.discount;
	data['remain'] = entity.remain;
	data['sum'] = entity.sum;
	data['total'] = entity.total;
	data['ExtraPrice'] = entity.extraPrice;
	if (entity.changeinfo != null) {
		data['changeinfo'] = entity.changeinfo.toJson();
	}
	if (entity.confirminfo != null) {
		data['confirminfo'] = entity.confirminfo.toJson();
	}
	return data;
}

changeServiceDitailModelResultCostsChangeinfoFromJson(ChangeServiceDitailModelResultCostsChangeinfo data, Map<String, dynamic> json) {
	if (json['ServicePrice'] != null) {
		data.servicePrice = json['ServicePrice']?.toInt();
	}
	if (json['PorsantPrice'] != null) {
		data.porsantPrice = json['PorsantPrice']?.toInt();
	}
	if (json['RealPrice'] != null) {
		data.realPrice = json['RealPrice']?.toInt();
	}
	if (json['ExpDate'] != null) {
		data.expDate = json['ExpDate']?.toString();
	}
	if (json['Type'] != null) {
		data.type = json['Type']?.toString();
	}
	if (json['ServiceType'] != null) {
		data.serviceType = json['ServiceType']?.toString();
	}
	if (json['ServiceName'] != null) {
		data.serviceName = json['ServiceName']?.toString();
	}
	if (json['ServiceGroupName'] != null) {
		data.serviceGroupName = json['ServiceGroupName']?.toString();
	}
	if (json['ServiceRef'] != null) {
		data.serviceRef = json['ServiceRef']?.toString();
	}
	if (json['ServiceDate'] != null) {
		data.serviceDate = json['ServiceDate']?.toString();
	}
	if (json['NetType'] != null) {
		data.netType = json['NetType']?.toString();
	}
	if (json['RealServicePrice'] != null) {
		data.realServicePrice = json['RealServicePrice']?.toString();
	}
	if (json['ExtraPrice'] != null) {
		data.extraPrice = json['ExtraPrice']?.toInt();
	}
	if (json['ServiceTypeName'] != null) {
		data.serviceTypeName = json['ServiceTypeName']?.toString();
	}
	if (json['TotalDays'] != null) {
		data.totalDays = json['TotalDays']?.toString();
	}
	if (json['RemainDays'] != null) {
		data.remainDays = json['RemainDays']?.toInt();
	}
	if (json['UsedDays'] != null) {
		data.usedDays = json['UsedDays']?.toInt();
	}
	if (json['TotalCredit'] != null) {
		data.totalCredit = json['TotalCredit']?.toInt();
	}
	if (json['RealRemainCredit'] != null) {
		data.realRemainCredit = json['RealRemainCredit']?.toInt();
	}
	if (json['UsedCredit'] != null) {
		data.usedCredit = json['UsedCredit']?.toInt();
	}
	if (json['IsApprove'] != null) {
		data.isApprove = json['IsApprove']?.toInt();
	}
	if (json['RemainPrice'] != null) {
		data.remainPrice = json['RemainPrice']?.toInt();
	}
	if (json['Mabna'] != null) {
		data.mabna = json['Mabna']?.toString();
	}
	if (json['0'] != null) {
		data.ziro = json['0']?.toInt();
	}
	return data;
}

Map<String, dynamic> changeServiceDitailModelResultCostsChangeinfoToJson(ChangeServiceDitailModelResultCostsChangeinfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['ServicePrice'] = entity.servicePrice;
	data['PorsantPrice'] = entity.porsantPrice;
	data['RealPrice'] = entity.realPrice;
	data['ExpDate'] = entity.expDate;
	data['Type'] = entity.type;
	data['ServiceType'] = entity.serviceType;
	data['ServiceName'] = entity.serviceName;
	data['ServiceGroupName'] = entity.serviceGroupName;
	data['ServiceRef'] = entity.serviceRef;
	data['ServiceDate'] = entity.serviceDate;
	data['NetType'] = entity.netType;
	data['RealServicePrice'] = entity.realServicePrice;
	data['ExtraPrice'] = entity.extraPrice;
	data['ServiceTypeName'] = entity.serviceTypeName;
	data['TotalDays'] = entity.totalDays;
	data['RemainDays'] = entity.remainDays;
	data['UsedDays'] = entity.usedDays;
	data['TotalCredit'] = entity.totalCredit;
	data['RealRemainCredit'] = entity.realRemainCredit;
	data['UsedCredit'] = entity.usedCredit;
	data['IsApprove'] = entity.isApprove;
	data['RemainPrice'] = entity.remainPrice;
	data['Mabna'] = entity.mabna;
	data['0'] = entity.ziro;
	return data;
}

changeServiceDitailModelResultCostsConfirminfoFromJson(ChangeServiceDitailModelResultCostsConfirminfo data, Map<String, dynamic> json) {
	if (json['NewServiceRef'] != null) {
		data.newServiceRef = json['NewServiceRef']?.toString();
	}
	if (json['NewServiceName'] != null) {
		data.newServiceName = json['NewServiceName']?.toString();
	}
	if (json['NewServiceGroupName'] != null) {
		data.newServiceGroupName = json['NewServiceGroupName']?.toString();
	}
	if (json['NewType'] != null) {
		data.newType = json['NewType']?.toString();
	}
	if (json['NewServiceType'] != null) {
		data.newServiceType = json['NewServiceType']?.toString();
	}
	if (json['NewGhest'] != null) {
		data.newGhest = json['NewGhest']?.toString();
	}
	if (json['NewMinPrice'] != null) {
		data.newMinPrice = json['NewMinPrice'];
	}
	if (json['NetType'] != null) {
		data.netType = json['NetType']?.toString();
	}
	if (json['KhesaratPrice'] != null) {
		data.khesaratPrice = json['KhesaratPrice']?.toInt();
	}
	if (json['methodprice'] != null) {
		data.methodprice = json['methodprice']?.toString();
	}
	if (json['TaxPrice'] != null) {
		data.taxPrice = json['TaxPrice']?.toInt();
	}
	if (json['OffPrice'] != null) {
		data.offPrice = json['OffPrice']?.toInt();
	}
	if (json['OffPriceTax'] != null) {
		data.offPriceTax = json['OffPriceTax']?.toInt();
	}
	if (json['NewPrice'] != null) {
		data.newPrice = json['NewPrice']?.toInt();
	}
	if (json['PayPrice'] != null) {
		data.payPrice = json['PayPrice']?.toInt();
	}
	if (json['PayPriceFinal'] != null) {
		data.payPriceFinal = json['PayPriceFinal']?.toInt();
	}
	if (json['0'] != null) {
		data.ziro = json['0']?.toInt();
	}
	return data;
}

Map<String, dynamic> changeServiceDitailModelResultCostsConfirminfoToJson(ChangeServiceDitailModelResultCostsConfirminfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['NewServiceRef'] = entity.newServiceRef;
	data['NewServiceName'] = entity.newServiceName;
	data['NewServiceGroupName'] = entity.newServiceGroupName;
	data['NewType'] = entity.newType;
	data['NewServiceType'] = entity.newServiceType;
	data['NewGhest'] = entity.newGhest;
	data['NewMinPrice'] = entity.newMinPrice;
	data['NetType'] = entity.netType;
	data['KhesaratPrice'] = entity.khesaratPrice;
	data['methodprice'] = entity.methodprice;
	data['TaxPrice'] = entity.taxPrice;
	data['OffPrice'] = entity.offPrice;
	data['OffPriceTax'] = entity.offPriceTax;
	data['NewPrice'] = entity.newPrice;
	data['PayPrice'] = entity.payPrice;
	data['PayPriceFinal'] = entity.payPriceFinal;
	data['0'] = entity.ziro;
	return data;
}