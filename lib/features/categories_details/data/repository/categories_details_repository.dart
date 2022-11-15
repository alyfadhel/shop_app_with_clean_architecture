import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/exception.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/data/datasource/base_categories_details_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/domain/entities/categories_details.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/domain/repository/base_categories_details_repository.dart';

class CategoriesDetailsRepository extends BaseCategoriesDetailsRepository
{
  final BaseCategoriesDetailsRemoteDataSource baseCategoriesDetailsRemoteDataSource;

  CategoriesDetailsRepository(this.baseCategoriesDetailsRemoteDataSource);
  @override
  Future<Either<Failure, List<CategoriesDataDetails>>> getCategoriesDetails(CategoriesDetailsParameters parameters) async{
    final result = await baseCategoriesDetailsRemoteDataSource.getCategoriesDetails(parameters);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

}