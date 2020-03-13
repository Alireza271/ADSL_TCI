import 'package:ADSLTCI/generated/json/base/json_convert_content.dart';
import 'package:ADSLTCI/generated/json/base/json_filed.dart';

class TrafficDitailsModelEntity with JsonConvert<TrafficDitailsModelEntity> {
	bool ok;
	String who;
	int code;
	String msg;
	TrafficDitailsModelResult result;
	String nonce;
}

class TrafficDitailsModelResult with JsonConvert<TrafficDitailsModelResult> {
	TrafficDitailsModelResultService service;
	List<TrafficDitailsModelResultBank> banks;
	TrafficDitailsModelResultCosts costs;
}

class TrafficDitailsModelResultService with JsonConvert<TrafficDitailsModelResultService> {
	@JSONField(name: "Serial")
	String serial;
	@JSONField(name: "Name")
	String name;
	@JSONField(name: "Comment")
	dynamic comment;
	@JSONField(name: "Credit")
	String credit;
	@JSONField(name: "SpeedClass")
	String speedClass;
	@JSONField(name: "ClassName")
	String className;
	@JSONField(name: "GroupName")
	String groupName;
}

class TrafficDitailsModelResultBank with JsonConvert<TrafficDitailsModelResultBank> {
	@JSONField(name: "Serial")
	String serial;
	@JSONField(name: "Name")
	String name;
	@JSONField(name: "Bank")
	String bank;
	@JSONField(name: "Logo")
	String logo;
}

class TrafficDitailsModelResultCosts with JsonConvert<TrafficDitailsModelResultCosts> {
	int error;
	@JSONField(name: "calc_tax")
	bool calcTax;
	int service;
	int tax;
	int abonman;
	int panel;
	int discount;
	int discountPercent;
	String discountLabel;
	String discountLabelPercent;
	int sumWithoutTax;
	int sum;
	int total;
}
