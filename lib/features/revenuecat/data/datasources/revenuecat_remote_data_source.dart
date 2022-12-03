import 'package:purchases_flutter/purchases_flutter.dart';

abstract class RevenuecatRemoteDataSource {
  Future<void> addCustomerInfoUpdateListener(void Function(CustomerInfo) listener);
  Future<bool> canMakePayments([List<BillingFeature> features = const []]);
  Future<Map<String, IntroEligibility>> checkTrialOrIntroductoryPriceEligibility(List<String> productIdentifiers);
  Future<void> close();
  Future<void> collectDeviceIdentifiers();
  Future<void> configure(PurchasesConfiguration purchasesConfiguration);
  Future<void> enableAdServicesAttributionTokenCollection();
  Future<CustomerInfo> getCustomerInfo();
  Future<Offerings> getOfferings();
  Future<List<StoreProduct>> getProducts(List<String> productIdentifiers);
  Future<PromotionalOffer> getPromotionalOffer(
      {required StoreProduct productIdentifier, required StoreProductDiscount discount});
  Future<void> invalidateCustomerInfoCache();
  Future<LogInResult> login(String userId);
  Future<CustomerInfo> logout();
  Future<void> presentCodeRedemptionSheet();
  Future<CustomerInfo> purchaseDiscountedProduct({required StoreProduct product, required PromotionalOffer offer});
  Future<CustomerInfo> purchaseDiscountedPackage({required Package package, required PromotionalOffer offer});
  Future<CustomerInfo> purchasePackage(Package package, {UpgradeInfo? upgradeInfo});
  Future<CustomerInfo> purchaseProduct(String productId, {UpgradeInfo? upgradeInfo, PurchaseType type = PurchaseType.subs});
  Future<void> removeCustomerInfoUpdateListener(void Function(CustomerInfo) listener);
  Future<void> removeReadyForPromotedProductPurchaseListener(
      void Function(String, Future<PromotedPurchaseResult> Function()) listener);
  Future<CustomerInfo> restorePurchases();
  Future<void> setAdId(String ad);
  Future<void> setAdGroupId(String adGroup);
  Future<void> setAdjustID(String adjustId);
  Future<void> setAirshipChannelID(String airshipChannelId);
  Future<void> setAppsflyerID(String appsflyerId);
  Future<void> setAttributes(Map<String, String> attributes);
  Future<void> setCampaign(String campaign);
  Future<void> setCleverTapID(String cleverTapId);
  Future<void> setCreative(String creative);
  Future<void> setDebugLogsEnabled(bool enabled);
  Future<void> setDisplayName(String displayName);
  Future<void> setFBAnonymousID(String fbAnonymousID);
  Future<void> setFinishTransactions(bool finishTransactions);
  Future<void> setKeyword(String keyword);
  Future<void> setMediaSource(String mediaSource);
  Future<void> setMixpanelDistinctID(String mixpanelId);
  Future<void> setMparticleID(String mparticleID);
  Future<void> setOnesignalID(String onesignalId);
  Future<void> setPhoneNumber(String phoneNumber);
  Future<void> setProxyURL(String proxyURL);
  Future<void> setPushToken(String pushToken);
  Future<void> setSimulatesAskToBuyInSandbox(bool simulatesAskToBuyInSandbox);
  Future<void> syncPurchases();
}

class RevenuecatRemoteDataSourceImpl implements RevenuecatRemoteDataSource {
  RevenuecatRemoteDataSourceImpl();

  /// Add a listener to be notified when the customer info changes.
  ///
  /// Use this to listen to changes in the entitlements.
  @override
  Future<void> addCustomerInfoUpdateListener(void Function(CustomerInfo) listener) async =>
      Purchases.addCustomerInfoUpdateListener(listener);

  ///Check if billing is supported for the current user (meaning IN-APP purchases are supported) and optionally, whether a
  ///list of specified feature types are supported.
  ///
  /// Note: BillingFeatures are only relevant to Google Play users. For other stores, BillingFeatures won't be checked.
  ///
  /// [features] An optional list of [BillingFeature]s to check for support. By default, is an empty list and no feature
  /// support will be checked.
  @override
  Future<bool> canMakePayments([List<BillingFeature> features = const []]) async =>
      await Purchases.canMakePayments(features);

  /// Check if the user is eligible for a trial or introductory price for a given product.
  ///
  ///! IOS ONLY
  @override
  Future<Map<String, IntroEligibility>> checkTrialOrIntroductoryPriceEligibility(List<String> productIdentifiers) async =>
      await Purchases.checkTrialOrIntroductoryPriceEligibility(productIdentifiers);

  /// Call close when you are done with this instance of revcat to disconnect from the billing services and clean up resources
  ///
  ///! ANDROID ONLY
  @override
  Future<void> close() async => await Purchases.close();

  /// Collect the device identifiers for the current user.
  @override
  Future<void> collectDeviceIdentifiers() async => await Purchases.collectDeviceIdentifiers();

  ///Configure the revcat sdk
  @override
  Future<void> configure(PurchasesConfiguration purchasesConfiguration) async =>
      await Purchases.configure(purchasesConfiguration);

  /// Enable automatic collection of Apple Search Ad attribution. Disabled by default
  ///
  ///! IOS ONLY
  @override
  Future<void> enableAdServicesAttributionTokenCollection() async =>
      await Purchases.enableAdServicesAttributionTokenCollection();

  /// Get the current customer info.
  @override
  Future<CustomerInfo> getCustomerInfo() async => await Purchases.getCustomerInfo();

  /// Get the current offerings configured in the RevenueCat dashboard.
  @override
  Future<Offerings> getOfferings() async => await Purchases.getOfferings();

  /// Get product info for a list of product identifiers.
  @override
  Future<List<StoreProduct>> getProducts(List<String> productIdentifiers) async =>
      await Purchases.getProducts(productIdentifiers);

  /// Get promo offer for a given product and discount.
  ///
  /// ! IOS ONLY
  @override
  Future<PromotionalOffer> getPromotionalOffer(
          {required StoreProduct productIdentifier, required StoreProductDiscount discount}) async =>
      await Purchases.getPromotionalOffer(productIdentifier, discount);

  /// Invalidate the cached customer info.
  @override
  Future<void> invalidateCustomerInfoCache() async => await Purchases.invalidateCustomerInfoCache();

  /// Login to revcat and identify the user with the backend id.
  @override
  Future<LogInResult> login(String userId) => Purchases.logIn(userId);

  /// Log out the current user.
  @override
  Future<CustomerInfo> logout() async => await Purchases.logOut();

  /// Present ios code redemption sheet.
  ///
  /// ? This has been unstable in the past, so it is not recommended to use this.
  /// ? See the revcat docs for more info.
  ///
  /// ! IOS ONLY
  @override
  Future<void> presentCodeRedemptionSheet() async => await Purchases.presentCodeRedemptionSheet();

  /// Purchase discounted product.
  ///
  /// You must call [getPromotionalOffer] to get the [PromotionalOffer] object.
  ///
  /// ! IOS ONLY
  @override
  Future<CustomerInfo> purchaseDiscountedProduct({required StoreProduct product, required PromotionalOffer offer}) async =>
      await Purchases.purchaseDiscountedProduct(product, offer);

  /// Purchase discounted package.
  ///
  /// You must call [getPromotionalOffer] to get the [PromotionalOffer] object.
  ///
  /// ! IOS ONLY
  @override
  Future<CustomerInfo> purchaseDiscountedPackage({required Package package, required PromotionalOffer offer}) async =>
      await Purchases.purchaseDiscountedPackage(package, offer);

  /// Purchase a package.
  @override
  Future<CustomerInfo> purchasePackage(Package package, {UpgradeInfo? upgradeInfo}) async =>
      await Purchases.purchasePackage(package, upgradeInfo: upgradeInfo);

  /// Purchase a product.
  @override
  Future<CustomerInfo> purchaseProduct(String productId,
          {UpgradeInfo? upgradeInfo, PurchaseType type = PurchaseType.subs}) async =>
      await Purchases.purchaseProduct(productId, upgradeInfo: upgradeInfo, type: type);

  /// Remove a listener to be notified when the customer info changes.
  @override
  Future<void> removeCustomerInfoUpdateListener(void Function(CustomerInfo) listener) async =>
      Purchases.removeCustomerInfoUpdateListener(listener);

  /// Remove ready for promoted product purchase listener
  ///
  /// ! IOS ONLY
  @override
  Future<void> removeReadyForPromotedProductPurchaseListener(
          void Function(String, Future<PromotedPurchaseResult> Function()) listener) async =>
      Purchases.removeReadyForPromotedProductPurchaseListener(listener);

  /// Restore transactions for the current user.
  @override
  Future<CustomerInfo> restorePurchases() async => await Purchases.restorePurchases();

  /// Set the ad id for the current user.
  ///
  /// Subscriber attribute associated with the install ad for the user
  ///
  /// [ad] Empty String or null will delete the subscriber attribute.
  @override
  Future<void> setAdId(String ad) async => await Purchases.setAd(ad);

  /// Subscriber attribute associated with the install ad group for the user
  /// [adGroup] Empty String or null will delete the subscriber attribute.
  @override
  Future<void> setAdGroupId(String adGroup) async => await Purchases.setAdGroup(adGroup);

  /// Set the adjust id for the current user.
  @override
  Future<void> setAdjustID(String adjustId) async => await Purchases.setAdjustID(adjustId);

  /// Set the airship channel id for the current user.
  @override
  Future<void> setAirshipChannelID(String airshipChannelId) async => await Purchases.setAirshipChannelID(airshipChannelId);

  /// Set the appsflyer id for the current user.
  @override
  Future<void> setAppsflyerID(String appsflyerId) async => await Purchases.setAppsflyerID(appsflyerId);

  /// Subscriber attributes are useful for storing additional, structured information on a user.
  /// Since attributes are writable using a public key they should not be used for
  /// managing secure or sensitive information such as subscription status, coins, etc.
  ///
  /// Key names starting with "$" are reserved names used by RevenueCat. For a full list of key
  /// restrictions refer to our guide: https://docs.revenuecat.com/docs/subscriber-attributes
  ///
  /// [attributes] Map of attributes by key. Set the value as an empty string to delete an attribute.
  @override
  Future<void> setAttributes(Map<String, String> attributes) async => await Purchases.setAttributes(attributes);

  /// Set campaign for the current user.
  @override
  Future<void> setCampaign(String campaign) async => await Purchases.setCampaign(campaign);

  /// Set the clever tap id for the current user.
  @override
  Future<void> setCleverTapID(String cleverTapId) async => await Purchases.setCleverTapID(cleverTapId);

  /// Subscriber attribute associated with the install ad creative for the user
  ///
  /// [creative] Empty String or null will delete the subscriber attribute.
  @override
  Future<void> setCreative(String creative) async => await Purchases.setCreative(creative);

  /// Set the log level for the RevenueCat SDK.
  @override
  Future<void> setDebugLogsEnabled(bool enabled) async => await Purchases.setDebugLogsEnabled(enabled);

  /// Set the [displayName] for the current user.
  @override
  Future<void> setDisplayName(String displayName) async => await Purchases.setDisplayName(displayName);

  /// Set Facebook anonymous [fbAnonymousID] id for the current user.
  @override
  Future<void> setFBAnonymousID(String fbAnonymousID) async => await Purchases.setFBAnonymousID(fbAnonymousID);

  /// Set Finish Transactions
  ///
  /// Default to TRUE, set this to FALSE if you are consuming and acknowledging transactions outside of the Purchases SDK.
  ///
  /// [finishTransactions] The value to be passed to finishTransactions.
  @override
  Future<void> setFinishTransactions(bool finishTransactions) async =>
      await Purchases.setFinishTransactions(finishTransactions);

  /// Set the keyword associated with the app install for the current user.
  ///
  /// [keyword] Empty String or null will delete the subscriber attribute.
  @override
  Future<void> setKeyword(String keyword) async => await Purchases.setKeyword(keyword);

  /// Set the media source associated with the app install for the current user.
  @override
  Future<void> setMediaSource(String mediaSource) async => await Purchases.setMediaSource(mediaSource);

  /// Set the Mixpanel Distinct Id for the current user.
  @override
  Future<void> setMixpanelDistinctID(String mixpanelId) async => await Purchases.setMixpanelDistinctID(mixpanelId);

  /// Set the Mparticle ID [mparticleID] for the current user.
  @override
  Future<void> setMparticleID(String mparticleID) async => await Purchases.setMparticleID(mparticleID);

  /// Set the OneSignal ID [onesignalId] for the current user.
  @override
  Future<void> setOnesignalID(String onesignalId) async => await Purchases.setOnesignalID(onesignalId);

  /// Set the phone number for the current user.
  @override
  Future<void> setPhoneNumber(String phoneNumber) async => await Purchases.setPhoneNumber(phoneNumber);

  /// Set the proxy URL for RevenueCat API calls.
  ///
  /// ! Set this property to your proxy URL before configuring Purchases only if you've received a proxy key value from your RevenueCat contact.
  @override
  Future<void> setProxyURL(String proxyURL) async => await Purchases.setProxyURL(proxyURL);

  /// Set the push token for the current user.
  ///
  /// Push tokens can be used to engage with your users through Apple apns or Google cloud messaging.
  ///
  /// These can be saved in RevenueCat through system callbacks after the user accepts the push notification permissions in your app.
  @override
  Future<void> setPushToken(String pushToken) async => await Purchases.setPushToken(pushToken);

  /// set Simulates a purchase being made by the user.
  ///
  /// Set this property to true only when testing the ask-to-buy / SCA purchases flow. More information: http://errors.rev.cat/ask-to-buy
  ///
  /// ! IOS ONLY
  @override
  Future<void> setSimulatesAskToBuyInSandbox(bool simulatesAskToBuyInSandbox) async =>
      await Purchases.setSimulatesAskToBuyInSandbox(simulatesAskToBuyInSandbox);

  /// This method will send all the purchases to the RevenueCat backend.
  ///
  /// WARNING: Call this when using your own implementation of in-app purchases.
  ///
  ///This method should be called anytime a sync is needed, like after a successful purchase.
  @override
  Future<void> syncPurchases() async => await Purchases.syncPurchases();
}
