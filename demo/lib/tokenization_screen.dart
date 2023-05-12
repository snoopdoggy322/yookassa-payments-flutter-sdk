import 'package:flutter/material.dart';
import 'package:yookassa_payments_flutter/input_data/saved_card_module_input_data.dart';
import 'package:yookassa_payments_flutter/models/tokenization_result.dart';
import 'package:yookassa_payments_flutter/yookassa_payments_flutter.dart';
import 'package:yookassa_payments_flutter_example/success_tokenization_screen.dart';
import 'package:yookassa_payments_flutter_example/config.dart';
import 'package:yookassa_payments_flutter_example/flavors.dart';

class TokenizationScreen extends StatefulWidget {
  const TokenizationScreen({Key? key}) : super(key: key);

  @override
  State<TokenizationScreen> createState() => TokenizationScreenState();
}

class TokenizationScreenState extends State<TokenizationScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: "10.0");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Demo App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: controller,
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                Config config = await F.getConfig();
                startTokenization(config);
                //startBankCardRepeat(config, "29fb30f8-000f-5000-8000-107f20fa0136");
              },
              child: const Text("Оплатить"))
        ],
      ),
    );
  }

  void startTokenization(Config config) async {
    var clientApplicationKey = config.clientApplicationKey;
    var amount =
        Amount(value: double.parse(controller.text), currency: Currency.rub);
    var moneyAuthClientId = config.moneyAuthClientId;
    var applePayID = config.applePayID;
    var gatewayId = config.gatewayId;
    var applicationScheme = config.applicationScheme + "://";
    var shopId = config.shopId;
    // var testSettings = TestModeSettings(true, 5, amount, false);
    var tokenizationModuleInputData = TokenizationModuleInputData(
        clientApplicationKey: clientApplicationKey,
        title: "Космические объекты",
        subtitle: "Комета повышенной яркости, период обращения — 112 лет",
        amount: amount,
        savePaymentMethod: SavePaymentMethod.userSelects,
        isLoggingEnabled: true,
        moneyAuthClientId: moneyAuthClientId,
        applePayID: applePayID,
        shopId: shopId,
        customerId: "app.example.demo.payments.yookassa",
        gatewayId: gatewayId,
        applicationScheme: applicationScheme,
        hostParameters: config.hostParameters,
        tokenizationSettings: const TokenizationSettings(PaymentMethodTypes([
          PaymentMethod.bankCard,
          PaymentMethod.yooMoney,
          PaymentMethod.sberbank,
          PaymentMethod.applePay,
          PaymentMethod.googlePay
        ])),
        testModeSettings: null);
    var result =
        await YookassaPaymentsFlutter.tokenization(tokenizationModuleInputData);
    if (result is SuccessTokenizationResult) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => SuccessTokenizationScreen(
                  result: result,
                  tokenizationData: tokenizationModuleInputData)));
    } else if (result is ErrorTokenizationResult) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(content: Text(result.error)));
      return;
    }
  }

  void startBankCardRepeat(Config config, String paymentMethodId) async {
    var clientApplicationKey = config.clientApplicationKey;
    var amount =
        Amount(value: double.parse(controller.text), currency: Currency.rub);
    var applePayID = config.applePayID;
    var shopId = config.shopId;
    var gatewayId = config.gatewayId;
    //var testSettings = TestModeSettings(false, 1, amount, false);
    var savedBankCardModuleInputData = SavedBankCardModuleInputData(
      clientApplicationKey: clientApplicationKey,
      title: "Космические объекты",
      subtitle: "Комета повышенной яркости, период обращения — 112 лет",
      amount: amount,
      savePaymentMethod: SavePaymentMethod.on,
      applePayID: applePayID,
      shopId: shopId,
      paymentMethodId: paymentMethodId,
      isSafeDeal: false,
      gatewayId: gatewayId,
      testModeSettings: null,
      isLoggingEnabled: true,
      customizationSettings: const CustomizationSettings(),
      customerId: "app.example.demo.payments.yookassa",
      hostParameters: config.hostParameters,
    );
    var result = await YookassaPaymentsFlutter.bankCardRepeat(
        savedBankCardModuleInputData);
    if (result is SuccessTokenizationResult) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => SuccessTokenizationScreen(
                  result: result, repeatData: savedBankCardModuleInputData)));
    } else if (result is ErrorTokenizationResult) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(content: Text(result.error)));
      return;
    }
  }
}
