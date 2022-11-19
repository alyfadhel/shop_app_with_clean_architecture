import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/exception.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/favorites/data/datasource/base_favorites_remote_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/favorites/domain/entities/favorites.dart';
import 'package:shop_app_with_clean_architecture/features/favorites/domain/repository/base-favorites_repository.dart';

class FavoritesRepository extends BaseFavoritesRepository
{
  final BaseFavoritesRemoteDataSource baseFavoritesRemoteDataSource;

  FavoritesRepository(this.baseFavoritesRemoteDataSource);
  @override
  Future<Either<Failure, List<FavoritesData>>> getFavorites() async{
    final result = await baseFavoritesRemoteDataSource.getFavorites();

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

}