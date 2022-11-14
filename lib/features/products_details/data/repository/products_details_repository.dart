import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/exception.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/data/datasource/base_products_details_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/domain/entities/products_details.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/domain/repository/base_products_details_repository.dart';

class ProductsDetailsRepository extends BaseProductsDetailsRepository
{
  final BaseProductsDetailsRemoteDataSource baseProductsDetailsRemoteDataSource;

  ProductsDetailsRepository(this.baseProductsDetailsRemoteDataSource);
  @override
  Future<Either<Failure, ProductsDetails>> getProductsDetails(ProductsDetailsParameters parameters) async{
    final result = await baseProductsDetailsRemoteDataSource.getProductsDetails(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

}