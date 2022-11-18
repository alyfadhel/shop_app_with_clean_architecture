import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/exception.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/search/data/datasource/base_search_remote_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/search/domain/entities/search.dart';
import 'package:shop_app_with_clean_architecture/features/search/domain/repository/base_search_repository.dart';

class SearchRepository extends BaseSearchRepository
{
  final BaseSearchRemoteDataSource baseSearchRemoteDataSource;

  SearchRepository(this.baseSearchRemoteDataSource);
  @override
  Future<Either<Failure, List<SearchData>>> getSearch(SearchParameters parameters)async {
    final result = await baseSearchRemoteDataSource.getSearch(parameters);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.error));
    }
  }

}