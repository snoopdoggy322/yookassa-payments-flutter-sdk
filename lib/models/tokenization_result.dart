import 'package:yookassa_payments_flutter/models/payment_method_types.dart';

class TokenizationResult {
  String token;
  PaymentMethod? paymentMethodType;

  TokenizationResult(this.token, this.paymentMethodType);

  factory TokenizationResult.fromJson(Map<String, dynamic> json) {
    var token = json['paymentToken'];

    PaymentMethod? paymentMethodType;
    switch(json['paymentMethodType']){
      case "sberbank":
        paymentMethodType = PaymentMethod.sberbank;
        break;
      case "bank_card":
        paymentMethodType = PaymentMethod.bankCard;
        break;
      case "yoo_money":
        paymentMethodType = PaymentMethod.yooMoney;
        break;
      case "apple_pay":
        paymentMethodType = PaymentMethod.applePay;
        break;
      case "google_pay":
        paymentMethodType = PaymentMethod.googlePay;
        break;
      default:
        break;
    }

    return TokenizationResult(token, paymentMethodType);
  }
}