import 'config.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'dev_yookassa_payments_flutter_example';
      case Flavor.prod:
        return 'prod_yookassa_payments_flutter_example';
      default:
        return 'title';
    }
  }

  static Future<Config> getConfig() async {
    String json;
    switch (appFlavor) {
      case Flavor.dev:
        json = await loadAsset('assets/schemes/dev.json');
        break;
      case Flavor.prod:
        json = await loadAsset('assets/schemes/prod.json');
        break;
      default:
        json = await loadAsset('assets/schemes/prod.json');
    }
    return Config.fromJson(jsonDecode(json));
  }

  static Future<String> loadAsset(path) => rootBundle.loadString(path);

}
