import 'package:ADSLTCI/Models/bank_redirector_model_entity.dart';
import 'package:ADSLTCI/Models/change_service_ditail_model_entity.dart';
import 'package:ADSLTCI/Models/change_services_model_entity.dart';
import 'package:ADSLTCI/Models/increase_credit_mopdel_entity.dart';
import 'package:ADSLTCI/Models/service_ditails_model_entity.dart';
import 'package:ADSLTCI/Models/service_model_entity.dart';
import 'package:ADSLTCI/Models/traffic_ditails_model_entity.dart';
import 'package:ADSLTCI/Models/traffic_model_entity.dart';

import '../Urls.dart';
import 'Request.dart';

GetTraffic() async {
  Request request =
      new Request(new TrafficModelEntity(), Urls.traffics, "GetTrafficList", {
    "filters": {
      "credit": {"mode": "none"}
    }
  });
  TrafficModelEntity response = await request.Response();
  return response;
}

GetService() async {
  Request request =
      new Request(new ServiceModelEntity(), Urls.service, "GetServiceList", {
    "filters": {
      "credit": {"mode": "none"}
    }
  });
  ServiceModelEntity response = await request.Response();
  return response;
}

GetTerafficDitails(String service_id) async {
  Request request = new Request(new TrafficDitailsModelEntity(), Urls.traffics,
      "GetTrafficInvoice", {"service": service_id});
  TrafficDitailsModelEntity response = await request.Response();
  return response;
}

GetServiceDitails(String service_id) async {
  Request request = new Request(new ServiceDitailsModelEntity(), Urls.service,
      "GetServiceInvoice", {"service": service_id});
  ServiceDitailsModelEntity response = await request.Response();
  return response;
}

GetBankRedirector(type, String service_id, getway) async {
  String url;
  switch (type) {
    case "traffice":
      {
        url = Urls.traffics;
      }
      break;
    case "change-service":
      {
        url = Urls.change_service;
      }
      break;
    case "service":
      {
        url = Urls.service;
      }
      break;
    case "wallet":
      {
        url = Urls.wallet;
      }
  }

  Request request = new Request(
      new BankRedirectorModelEntity(), url, "RequestBankRedirector", {
    (type == "wallet" ? "increment" : "service"): service_id,
    "gateway": getway
  });
  BankRedirectorModelEntity response = await request.Response();
  return response;
}

GetChangeServices() async {
  Request request = new Request(
      new ChangeServicesModelEntity(), Urls.change_service, "GetServiceList", {
    "filters": {
      "credit": {"mode": "none"}
    }
  });
  ChangeServicesModelEntity response = await request.Response();
  return response;
}

GetChangeServiceDitails(String service_id) async {
  Request request = new Request(new ChangeServiceDitailModelEntity(),
      Urls.change_service, "GetServiceInvoice", {"service": service_id});
  ChangeServiceDitailModelEntity response = await request.Response();
  return response;
}

GetIncreaseCredit(int increment) async {
  Request request = new Request(new IncreaseCreditMopdelEntity(), Urls.wallet,
      "GetRechargeInvoice", {"increment": increment});
  IncreaseCreditMopdelEntity response = await request.Response();
  return response;
}
