import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final dynamic errorMessage;
  final StackTrace? stackTrace;

  const Failure({this.errorMessage, this.stackTrace});
  @override
  List<Object?> get props => [errorMessage, stackTrace];
}

class RevenueCatFailure extends Failure {
  const RevenueCatFailure({dynamic errorMessage, StackTrace? stackTrace})
      : super(errorMessage: errorMessage, stackTrace: stackTrace);

  @override
  List<Object?> get props => [errorMessage, stackTrace];
}
