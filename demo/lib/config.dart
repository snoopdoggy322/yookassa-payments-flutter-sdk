import 'package:yookassa_payments_flutter/models/host_parameters.dart';

class Config {

  String shopId;
  String? gatewayId;
  String clientApplicationKey;
  String moneyAuthClientId;
  String applePayID;
  String applicationScheme;
  HostParameters? hostParameters;

  Config(
    this.shopId,
    this.gatewayId,
    this.clientApplicationKey,
    this.moneyAuthClientId,
    this.applePayID,
    this.applicationScheme,
    this.hostParameters
  );

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config(
      json['shopId'] as String,
      json['gatewayId'] as String?,
      json['clientApplicationKey'] as String,
      json['moneyAuthClientId'] as String,
      json['applePayID'] as String,
      json['applicationScheme'] as String,
      json['hostParameters'] == null ? null : HostParameters.fromJson(json['hostParameters']),
    );
  }
}