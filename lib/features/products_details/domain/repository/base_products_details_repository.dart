import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/domain/entities/products_details.dart';

abstract class BaseProductsDetailsRepository
{
  Future<Either<Failure,ProductsDetails>>getProductsDetails(ProductsDetailsParameters parameters);
}

class ProductsDetailsParameters extends Equatable
{
  final int id;

 const ProductsDetailsParameters({
    required this.id,
  });
  @override
  List<Object?> get props => [id];

}