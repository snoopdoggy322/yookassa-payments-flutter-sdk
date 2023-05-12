# yookassa_payments_flutter_example

Demonstrates how to use the yookassa_payments_flutter plugin.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Run project

### Android
- Open terminal
- Input `cd ~/money-checkout-payments-flutter/demo`
- For prod input `flutter run --flavor prod -t lib/main_prod.dart`
- For dev input `flutter run --flavor dev -t lib/main_dev.dart`

### iOS
- Open terminal
- Input `cd ~/money-checkout-payments-flutter/demo/ios`
- Input `flutter pub get`
- Input `pod install`
- Run `fastlane match development --readonly`
- Paste hosts between <dict></dict> tags:
    `
    <key>wallet</key>
    <string>//front-main.appb2b1.cloud.yoomoney.ru</string>
    <key>payments</key>
    <string>//sdk.front-pcidss.appb2b1.cloud.yookassa.ru:9491/</string>
    <key>moneyAuth</key>
    <string>//front-main.appb2b1.cloud.yoomoney.ru/</string>
    <key>config</key>
    <string>//front-main.appb2b1.cloud.yookassa.ru/</string>
    `
in file `demo/ios/Pods/YooKassaPayments/YooKassaPayments/Public/Resources/Configurations/Hosts.plist`
- Open Xcode
- Open money-checkout-payments-flutter/demo/ios Runner.xcworkspace in Xcode
- Select `dev` or `prod` scheme for running
- Press Build

### если flutter-iOS не собирается, не запускается, падает при старте
- в Xcode сделай Menu->Product->Clean Build Folder
- закрой Xcode
- почисти DerivedData (можно проста папку удалить; путь `/Users/USERNAME/Library/Developer/Xcode/DerivedData`)
- перейди в диреторию -> `cd ~/money-checkout-payments-flutter/demo`
- тут флаттер магия -> `flutter pub upgrade`
- обнови cocoapods podspecs и переустанови зависимости -> `cd ios && pod update`
- еще флаттер-магия и запуск из терминала -> `flutter clean && flutter run --flavor dev`
- 
- если нужны логи и Xcode, то тормози запуск в терминале -> `control + С`
- запускай Xcode и жми `Build` (если так и не запуститься, то `press F` чтобы призвать разработчика)

## Configure hosts and tokenization data
- There is two files in money-checkout-payments-flutter/demo/assets/schemes:
    - dev.json - configuration for dev schemes;
    - prod.json - configuration for prod schemes;
- If you want to change parameters of configuration for specific scheme, you can do it by changing dev.json or prod.json depending on scheme;
