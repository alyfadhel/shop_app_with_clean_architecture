import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/exception.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/products/data/datasource/base_banners_remote_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/entities/banners.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/entities/products.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/repository/base_banners_repository.dart';

class BannersRepository extends BaseBannersRepository
{
  final BaseBannersRemoteDataSource bannersRemoteDataSource;

  BannersRepository(this.bannersRemoteDataSource);
  @override
  Future<Either<Failure, List<BannersData>>> getBanners() async{
    final result = await bannersRemoteDataSource.getBanners();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }

  }

  @override
  Future<Either<Failure, List<ProductsData>>> getProducts() async{
    final result = await bannersRemoteDataSource.getProducts();
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, Data>> getProductsDetails(ProductsDetailsParameters parameters) async{
    final result = await bannersRemoteDataSource.getProductsDetails(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

}