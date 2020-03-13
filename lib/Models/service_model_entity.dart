import 'package:ADSLTCI/generated/json/base/json_convert_content.dart';
import 'package:ADSLTCI/generated/json/base/json_filed.dart';

class ServiceModelEntity with JsonConvert<ServiceModelEntity> {
	bool ok;
	String who;
	int code;
	String msg;
	ServiceModelResult result;
	String nonce;
}

class ServiceModelResult with JsonConvert<ServiceModelResult> {
	@JSONField(name: "list")
	List<ServiceModelResultList> xList;
}

class ServiceModelResultList with JsonConvert<ServiceModelResultList> {
	@JSONField(name: "Serial")
	String serial;
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
