import 'package:cryplet/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

typedef ValidatorFunction = String? Function(String? value);
typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultSync<T> = Either<Failure, T>;
