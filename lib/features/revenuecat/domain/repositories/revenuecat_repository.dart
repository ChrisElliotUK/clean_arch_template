import 'package:dartz/dartz.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../../../core/error/failure.dart';

abstract class RevenuecatRepository {
  Future<Either<Failure, void>> addCustomerInfoUpdateListener(void Function(CustomerInfo) listener);
  Future<Either<Failure, bool>> canMakePayments([List<BillingFeature> features = const []]);
  Future<Either<Failure, Map<String, IntroEligibility>>> checkTrialOrIntroductoryPriceEligibility(
      List<String> productIdentifiers);
  Future<Either<Failure, void>> close();
  Future<Either<Failure, void>> collectDeviceIdentifiers();
  Future<Either<Failure, void>> configure(PurchasesConfiguration purchasesConfiguration);
  Future<Either<Failure, void>> enableAdServicesAttributionTokenCollection();
  Future<Either<Failure, CustomerInfo>> getCustomerInfo();
  Future<Either<Failure, Offerings>> getOfferings();
  Future<Either<Failure, List<StoreProduct>>> getProducts(List<String> productIdentifiers);
  Future<Either<Failure, PromotionalOffer>> getPromotionalOffer(
      {required StoreProduct productIdentifier, required StoreProductDiscount discount});
  Future<Either<Failure, void>> invalidateCustomerInfoCache();
  Future<Either<Failure, LogInResult>> login(String userId);
  Future<Either<Failure, CustomerInfo>> logout();
  Future<Either<Failure, void>> presentCodeRedemptionSheet();
  Future<Either<Failure, CustomerInfo>> purchaseDiscountedProduct(
      {required StoreProduct product, required PromotionalOffer offer});
  Future<Either<Failure, CustomerInfo>> purchaseDiscountedPackage(
      {required Package package, required PromotionalOffer offer});
  Future<Either<Failure, CustomerInfo>> purchasePackage(Package package, {UpgradeInfo? upgradeInfo});
  Future<Either<Failure, CustomerInfo>> purchaseProduct(String productId,
      {UpgradeInfo? upgradeInfo, PurchaseType type = PurchaseType.subs});
  Future<Either<Failure, void>> removeCustomerInfoUpdateListener(void Function(CustomerInfo) listener);
  Future<Either<Failure, void>> removeReadyForPromotedProductPurchaseListener(
      void Function(String, Future<PromotedPurchaseResult> Function()) listener);
  Future<Either<Failure, CustomerInfo>> restorePurchases();
  Future<Either<Failure, void>> setAdId(String ad);
  Future<Either<Failure, void>> setAdGroupId(String adGroup);
  Future<Either<Failure, void>> setAdjustID(String adjustId);
  Future<Either<Failure, void>> setAirshipChannelID(String airshipChannelId);
  Future<Either<Failure, void>> setAppsflyerID(String appsflyerId);
  Future<Either<Failure, void>> setAttributes(Map<String, String> attributes);
  Future<Either<Failure, void>> setCampaign(String campaign);
  Future<Either<Failure, void>> setCleverTapID(String cleverTapId);
  Future<Either<Failure, void>> setCreative(String creative);
  Future<Either<Failure, void>> setDebugLogsEnabled(bool enabled);
  Future<Either<Failure, void>> setDisplayName(String displayName);
  Future<Either<Failure, void>> setFBAnonymousID(String fbAnonymousID);
  Future<Either<Failure, void>> setFinishTransactions(bool finishTransactions);
  Future<Either<Failure, void>> setKeyword(String keyword);
  Future<Either<Failure, void>> setMediaSource(String mediaSource);
  Future<Either<Failure, void>> setMixpanelDistinctID(String mixpanelId);
  Future<Either<Failure, void>> setMparticleID(String mparticleID);
  Future<Either<Failure, void>> setOnesignalID(String onesignalId);
  Future<Either<Failure, void>> setPhoneNumber(String phoneNumber);
  Future<Either<Failure, void>> setProxyURL(String proxyURL);
  Future<Either<Failure, void>> setPushToken(String pushToken);
  Future<Either<Failure, void>> setSimulatesAskToBuyInSandbox(bool simulatesAskToBuyInSandbox);
  Future<Either<Failure, void>> syncPurchases();
}
