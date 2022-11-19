import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/favorites/domain/entities/favorites.dart';

abstract class BaseFavoritesRepository
{
  Future<Either<Failure,List<FavoritesData>>>getFavorites();
}