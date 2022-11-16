import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/profile/domain/entities/profile.dart';

abstract class BaseProfileRepository
{
  Future<Either<Failure,Profile>>getProfile();
}