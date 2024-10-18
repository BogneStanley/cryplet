import 'package:cryplet/core/exceptions/api_exception.dart';

abstract class Failure {
  const Failure({
    required this.message,
  });

  final String message;
}

class APIFailure extends Failure {
  const APIFailure({required super.message});

  APIFailure.fromException(ApiException exception)
      : this(
          message: exception.message,
        );
}
