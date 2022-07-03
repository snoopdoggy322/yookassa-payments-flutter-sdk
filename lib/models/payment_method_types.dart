class PaymentMethodTypes {
  final List<PaymentMethod> paymentMethodTypes;
  const PaymentMethodTypes(this.paymentMethodTypes);

  List<String> jsonList() {
    return paymentMethodTypes.map((e) => e.toString()).toList();
  }

  static const PaymentMethodTypes bankCard = PaymentMethodTypes([PaymentMethod.bankCard]);
  static const PaymentMethodTypes yooMoney = PaymentMethodTypes([PaymentMethod.yooMoney]);
  static const PaymentMethodTypes sberbank = PaymentMethodTypes([PaymentMethod.sberbank]);
  static const PaymentMethodTypes applePay = PaymentMethodTypes([PaymentMethod.applePay]);
  static const PaymentMethodTypes googlePay = PaymentMethodTypes([PaymentMethod.googlePay]);
  static const PaymentMethodTypes all = PaymentMethodTypes([
    PaymentMethod.bankCard,
    PaymentMethod.yooMoney,
    PaymentMethod.sberbank,
    PaymentMethod.applePay,
    PaymentMethod.googlePay
  ]);
}

enum PaymentMethod {
  bankCard,
  yooMoney,
  applePay,
  googlePay,
  sberbank
}