import 'package:purchases_flutter/purchases_flutter.dart';

String getRevCatErrorFromCode(PurchasesErrorCode errorCode) {
  switch (errorCode) {
    case PurchasesErrorCode.unknownError:
      return 'Unknown error. Please try again or contact support.';

    case PurchasesErrorCode.purchaseCancelledError:
      return 'Purchase cancelled. Please try again.';

    case PurchasesErrorCode.storeProblemError:
      return 'Unable to connect to the store. Please try again.';

    case PurchasesErrorCode.purchaseNotAllowedError:
      return 'Purchase not allowed. Please try again.';

    case PurchasesErrorCode.purchaseInvalidError:
      return 'Purchase invalid. Please try again.';

    case PurchasesErrorCode.productNotAvailableForPurchaseError:
      return 'Product not available for purchase. Please try again.';

    case PurchasesErrorCode.productAlreadyPurchasedError:
      return 'Product already purchased. Please choose a different product.';

    case PurchasesErrorCode.receiptAlreadyInUseError:
      return 'Receipt already in use. Please contact support.';

    case PurchasesErrorCode.invalidReceiptError:
      return 'Receipt invalid. Please contact support.';

    case PurchasesErrorCode.missingReceiptFileError:
      return 'Receipt file missing. Please contact support.';

    case PurchasesErrorCode.networkError:
      return 'Network error. Please check your connection and try again.';

    case PurchasesErrorCode.invalidCredentialsError:
      return 'Credentials invalid. Please contact support.';

    case PurchasesErrorCode.unexpectedBackendResponseError:
      return 'Unexpected backend response. Please contact support.';

    case PurchasesErrorCode.receiptInUseByOtherSubscriberError:
      return 'Receipt in use by other subscriber. Please contact support.';

    case PurchasesErrorCode.invalidAppUserIdError:
      return 'App user ID invalid. Please contact support.';

    case PurchasesErrorCode.operationAlreadyInProgressError:
      return 'Operation already in progress. Please wait and try again.';

    case PurchasesErrorCode.unknownBackendError:
      return 'Unknown backend error. Please contact support.';

    case PurchasesErrorCode.invalidAppleSubscriptionKeyError:
      return 'Apple subscription key invalid. Please contact support.';

    case PurchasesErrorCode.ineligibleError:
      return 'You are ineligible to make this purchase. Please choose a different product.';

    case PurchasesErrorCode.insufficientPermissionsError:
      return 'Insufficient permissions. Please contact support.';

    case PurchasesErrorCode.paymentPendingError:
      return 'Payment pending. Please try again.';

    case PurchasesErrorCode.invalidSubscriberAttributesError:
      return 'Subscriber attributes invalid. Please contact support.';

    case PurchasesErrorCode.logOutWithAnonymousUserError:
      return 'Log out with anonymous user. Please contact support.';

    case PurchasesErrorCode.configurationError:
      return 'Configuration error. Please contact support.';

    case PurchasesErrorCode.unsupportedError:
      return 'Unsupported error. Please contact support.';
  }
}
