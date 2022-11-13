import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/entities/banners.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/entities/products.dart';

abstract class BaseBannersRepository
{
  Future<Either<Failure,List<BannersData>>>getBanners();
  Future<Either<Failure,List<ProductsData>>>getProducts();
}