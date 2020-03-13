
import 'package:ADSLTCI/generated/json/base/json_convert_content.dart';

class BankRedirectorModelEntity with JsonConvert<BankRedirectorModelEntity> {
	bool ok;
	String who;
	int code;
	String msg;
	BankRedirectorModelResult result;
	String nonce;
}

class BankRedirectorModelResult with JsonConvert<BankRedirectorModelResult> {
	int order;
	String redirector;
}
