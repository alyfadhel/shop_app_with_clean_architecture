import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/entities/home.dart';

abstract class BaseHomeRepository
{
  Future<Either<Failure,Home>>getBanners(NoParameters parameters);
}