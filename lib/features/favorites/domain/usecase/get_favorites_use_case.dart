import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/favorites/domain/entities/favorites.dart';
import 'package:shop_app_with_clean_architecture/features/favorites/domain/repository/base-favorites_repository.dart';

class GetFavoritesUseCase extends BaseUseCase<List<FavoritesData>,NoParameters>
{
  final BaseFavoritesRepository baseFavoritesRepository;

  GetFavoritesUseCase(this.baseFavoritesRepository);
  @override
  Future<Either<Failure, List<FavoritesData>>> call(NoParameters parameters)async {
    return await baseFavoritesRepository.getFavorites();
  }

}