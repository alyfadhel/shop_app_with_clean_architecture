import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/exception.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/chage_favorites/data/datasource/base_change_favorites_remote_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/chage_favorites/domain/entities/change_favorites.dart';
import 'package:shop_app_with_clean_architecture/features/chage_favorites/domain/repository/base_change_favorites_repository.dart';

class ChangeFavoritesRepository extends BaseChangeFavoritesRepository
{
  final BaseChangeFavoritesRemoteDataSource baseChangeFavoritesRemoteDataSource;

  ChangeFavoritesRepository(this.baseChangeFavoritesRemoteDataSource);
  @override
  Future<Either<Failure, ChangeFavorites>> getChangeFavorites(ChangeFavoritesParameters parameters)async {
    final result = await baseChangeFavoritesRemoteDataSource.getChangeFavorites(parameters);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

}