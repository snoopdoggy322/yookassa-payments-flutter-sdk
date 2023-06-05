# 1.0.5

* Fix bug with return confirmation result for iOS platform

# 1.0.4

* Added processing of Mintsifra certificates in webView to keep banking services working
* Moved the field for customizing the display of the YooKassa logo from TokenizationSettings to CustomizationSettings
* Made UI changes and updated profiling

# 1.0.3

* Fixed iOS confirmation flow. Refactored TokenizationResult, now it's have SuccessTokenizationResult, ErrorTokenizationResult and CanceledTokenizationResult versions. Not to get token from TokenizationResult you need to check it's type:
var result = await YookassaPaymentsFlutter.tokenization(tokenizationModuleInputData);
if (result is SuccessTokenizationResult) {
    result.token
}

# 1.0.2

* Made applePayID and moneyAuthClientId fields optional.

# 1.0.1

* Formatted code. Added homepage and repo urls.

# 1.0.0

* Initial development release.
