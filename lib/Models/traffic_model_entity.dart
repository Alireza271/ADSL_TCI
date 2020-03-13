import 'package:ADSLTCI/generated/json/base/json_convert_content.dart';
import 'package:ADSLTCI/generated/json/base/json_convert_content.dart';
import 'package:ADSLTCI/generated/json/base/json_filed.dart';

class TrafficModelEntity with JsonConvert<TrafficModelEntity> {
	bool ok;
	String who;
	int code;
	String msg;
	TrafficModelResult result;
	String nonce;
}

class TrafficModelResult with JsonConvert<TrafficModelResult> {
	@JSONField(name: "list")
	List<TrafficModelResultList> xList;
}

class TrafficModelResultList with JsonConvert<TrafficModelResultList> {
	@JSONField(name: "Serial")
	String serial;
	@JSONField(name: "Name")
	String name;
	@JSONField(name: "Credit")
	String credit;
	@JSONField(name: "Price")
	String price;
	@JSONField(name: "Special")
	String special;
	@JSONField(name: "GroupName")
	String groupName;
}
