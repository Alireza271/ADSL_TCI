import 'package:ADSLTCI/generated/json/base/json_convert_content.dart';
import 'package:ADSLTCI/generated/json/base/json_filed.dart';

class ChangeServicesModelEntity with JsonConvert<ChangeServicesModelEntity> {
	bool ok;
	String who;
	int code;
	String msg;
	ChangeServicesModelResult result;
	String nonce;
}

class ChangeServicesModelResult with JsonConvert<ChangeServicesModelResult> {
	@JSONField(name: "list")
	List<ChangeServicesModelResultList> xList;
}

class ChangeServicesModelResultList with JsonConvert<ChangeServicesModelResultList> {
	@JSONField(name: "Serial")
	int serial;
	@JSONField(name: "Name")
	String name;
	@JSONField(name: "ServiceType")
	String serviceType;
	@JSONField(name: "Credit")
	int credit;
	@JSONField(name: "Price")
	int price;
	@JSONField(name: "Ghest")
	int ghest;
	@JSONField(name: "FreeGig")
	int freeGig;
	@JSONField(name: "MinPrice")
	int minPrice;
	@JSONField(name: "SpeedClass")
	int speedClass;
	@JSONField(name: "Special")
	bool special;
	@JSONField(name: "ClassName")
	String className;
	@JSONField(name: "Days")
	int days;
	@JSONField(name: "Class")
	String xClass;
	@JSONField(name: "Mah")
	int mah;
}
