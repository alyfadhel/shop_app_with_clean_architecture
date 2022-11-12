import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/exception.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/categories/datasource/datasource/base_categories_remote_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/categories/domain/entities/categories.dart';
import 'package:shop_app_with_clean_architecture/features/categories/domain/repository/base_categories_repository.dart';

class CategoriesRepository extends BaseCategoriesRepository
{
  final BaseCategoriesRemoteDataSource baseCategoriesRemoteDataSource;

  CategoriesRepository(this.baseCategoriesRemoteDataSource);
  @override
  Future<Either<Failure, List<CategoriesData>>> getCategories() async{
    final result = await baseCategoriesRemoteDataSource.getCategories();

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

}