import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/entities/banners.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/entities/products.dart';

abstract class BaseBannersRepository
{
  Future<Either<Failure,List<BannersData>>>getBanners();
  Future<Either<Failure,List<ProductsData>>>getProducts();
  Future<Either<Failure,Data>>getProductsDetails(ProductsDetailsParameters parameters);
}

class ProductsDetailsParameters extends Equatable
{
  final int id;

 const ProductsDetailsParameters(this.id);
  @override
  // TODO: implement props
  List<Object?> get props => [id];

}