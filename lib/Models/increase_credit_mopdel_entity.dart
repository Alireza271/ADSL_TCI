import 'package:ADSLTCI/generated/json/base/json_convert_content.dart';
import 'package:ADSLTCI/generated/json/base/json_filed.dart';

class IncreaseCreditMopdelEntity with JsonConvert<IncreaseCreditMopdelEntity> {
	bool ok;
	String who;
	int code;
	String msg;
	IncreaseCreditMopdelResult result;
	String nonce;
}

class IncreaseCreditMopdelResult with JsonConvert<IncreaseCreditMopdelResult> {
	int increment;
	int total;
	int panel;
	List<IncreaseCreditMopdelResultBank> banks;
}

class IncreaseCreditMopdelResultBank with JsonConvert<IncreaseCreditMopdelResultBank> {
	@JSONField(name: "Serial")
	String serial;
	@JSONField(name: "Name")
	String name;
	@JSONField(name: "Bank")
	String bank;
	@JSONField(name: "Logo")
	String logo;
}
