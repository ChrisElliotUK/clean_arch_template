import 'package:clean_arch_template/features/revenuecat/data/models/revenuecat_error_helper.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/revenuecat_repository.dart';
import '../datasources/revenuecat_remote_data_source.dart';

class RevenuecatRepositoryImpl implements RevenuecatRepository {
  final RevenuecatRemoteDataSource remoteDataSource;

  RevenuecatRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> addCustomerInfoUpdateListener(void Function(CustomerInfo info) listener) async {
    try {
      final result = remoteDataSource.addCustomerInfoUpdateListener(listener);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> canMakePayments([List<BillingFeature> features = const []]) async {
    try {
      final result = await remoteDataSource.canMakePayments(features);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, IntroEligibility>>> checkTrialOrIntroductoryPriceEligibility(
      List<String> productIdentifiers) async {
    try {
      final result = await remoteDataSource.checkTrialOrIntroductoryPriceEligibility(productIdentifiers);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> close() async {
    try {
      final result = await remoteDataSource.close();

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> collectDeviceIdentifiers() async {
    try {
      final result = await remoteDataSource.collectDeviceIdentifiers();

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> configure(PurchasesConfiguration purchasesConfiguration) async {
    try {
      final result = await remoteDataSource.configure(purchasesConfiguration);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> enableAdServicesAttributionTokenCollection() async {
    try {
      final result = await remoteDataSource.enableAdServicesAttributionTokenCollection();

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CustomerInfo>> getCustomerInfo() async {
    try {
      final result = await remoteDataSource.getCustomerInfo();

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Offerings>> getOfferings() async {
    try {
      final result = await remoteDataSource.getOfferings();

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<StoreProduct>>> getProducts(List<String> productIdentifiers) async {
    try {
      final result = await remoteDataSource.getProducts(productIdentifiers);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PromotionalOffer>> getPromotionalOffer(
      {required StoreProduct productIdentifier, required StoreProductDiscount discount}) async {
    try {
      final result = await remoteDataSource.getPromotionalOffer(productIdentifier: productIdentifier, discount: discount);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> invalidateCustomerInfoCache() async {
    try {
      final result = await remoteDataSource.invalidateCustomerInfoCache();

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, LogInResult>> login(String userId) async {
    try {
      final result = await remoteDataSource.login(userId);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CustomerInfo>> logout() async {
    try {
      final result = await remoteDataSource.logout();

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> presentCodeRedemptionSheet() async {
    try {
      final result = await remoteDataSource.presentCodeRedemptionSheet();

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CustomerInfo>> purchaseDiscountedPackage(
      {required Package package, required PromotionalOffer offer}) async {
    try {
      final result = await remoteDataSource.purchaseDiscountedPackage(package: package, offer: offer);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CustomerInfo>> purchaseDiscountedProduct(
      {required StoreProduct product, required PromotionalOffer offer}) async {
    try {
      final result = await remoteDataSource.purchaseDiscountedProduct(product: product, offer: offer);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CustomerInfo>> purchasePackage(Package package, {UpgradeInfo? upgradeInfo}) async {
    try {
      final result = await remoteDataSource.purchasePackage(package, upgradeInfo: upgradeInfo);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CustomerInfo>> purchaseProduct(String productId,
      {UpgradeInfo? upgradeInfo, PurchaseType type = PurchaseType.subs}) async {
    try {
      final result = await remoteDataSource.purchaseProduct(productId, upgradeInfo: upgradeInfo, type: type);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeCustomerInfoUpdateListener(void Function(CustomerInfo p1) listener) async {
    try {
      final result = await remoteDataSource.removeCustomerInfoUpdateListener(listener);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeReadyForPromotedProductPurchaseListener(
      void Function(String p1, Future<PromotedPurchaseResult> Function() p2) listener) async {
    try {
      final result = await remoteDataSource.removeReadyForPromotedProductPurchaseListener(listener);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CustomerInfo>> restorePurchases() async {
    try {
      final result = await remoteDataSource.restorePurchases();

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setAdGroupId(String adGroup) async {
    try {
      final result = await remoteDataSource.setAdGroupId(adGroup);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setAdId(String ad) async {
    try {
      final result = await remoteDataSource.setAdId(ad);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setAdjustID(String adjustId) async {
    try {
      final result = await remoteDataSource.setAdjustID(adjustId);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setAirshipChannelID(String airshipChannelId) async {
    try {
      final result = await remoteDataSource.setAirshipChannelID(airshipChannelId);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setAppsflyerID(String appsflyerId) async {
    try {
      final result = await remoteDataSource.setAppsflyerID(appsflyerId);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setAttributes(Map<String, String> attributes) async {
    try {
      final result = await remoteDataSource.setAttributes(attributes);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setCampaign(String campaign) async {
    try {
      final result = await remoteDataSource.setCampaign(campaign);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setCleverTapID(String cleverTapId) async {
    try {
      final result = await remoteDataSource.setCleverTapID(cleverTapId);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setCreative(String creative) async {
    try {
      final result = await remoteDataSource.setCreative(creative);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setDebugLogsEnabled(bool enabled) async {
    try {
      final result = await remoteDataSource.setDebugLogsEnabled(enabled);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setDisplayName(String displayName) async {
    try {
      final result = await remoteDataSource.setDisplayName(displayName);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setFBAnonymousID(String fbAnonymousID) async {
    try {
      final result = await remoteDataSource.setFBAnonymousID(fbAnonymousID);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setFinishTransactions(bool finishTransactions) async {
    try {
      final result = await remoteDataSource.setFinishTransactions(finishTransactions);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setKeyword(String keyword) async {
    try {
      final result = await remoteDataSource.setKeyword(keyword);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setMediaSource(String mediaSource) async {
    try {
      final result = await remoteDataSource.setMediaSource(mediaSource);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setMixpanelDistinctID(String mixpanelId) async {
    try {
      final result = await remoteDataSource.setMixpanelDistinctID(mixpanelId);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setMparticleID(String mparticleID) async {
    try {
      final result = await remoteDataSource.setMparticleID(mparticleID);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setOnesignalID(String onesignalId) async {
    try {
      final result = await remoteDataSource.setOnesignalID(onesignalId);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setPhoneNumber(String phoneNumber) async {
    try {
      final result = await remoteDataSource.setPhoneNumber(phoneNumber);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setProxyURL(String proxyURL) async {
    try {
      final result = await remoteDataSource.setProxyURL(proxyURL);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setPushToken(String pushToken) async {
    try {
      final result = await remoteDataSource.setPushToken(pushToken);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setSimulatesAskToBuyInSandbox(bool simulatesAskToBuyInSandbox) async {
    try {
      final result = await remoteDataSource.setSimulatesAskToBuyInSandbox(simulatesAskToBuyInSandbox);

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> syncPurchases() async {
    try {
      final result = await remoteDataSource.syncPurchases();

      return Right(result);
    } on PlatformException catch (e) {
      var errorCode = PurchasesErrorHelper.getErrorCode(e);

      return Left(RevenueCatFailure(errorMessage: getRevCatErrorFromCode(errorCode).toString()));
    } catch (e) {
      return Left(RevenueCatFailure(errorMessage: e.toString()));
    }
  }
}
