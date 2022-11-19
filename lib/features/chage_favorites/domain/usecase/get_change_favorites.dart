import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/chage_favorites/domain/entities/change_favorites.dart';
import 'package:shop_app_with_clean_architecture/features/chage_favorites/domain/repository/base_change_favorites_repository.dart';

class GetChangeFavoritesUseCase extends BaseUseCase<ChangeFavorites,ChangeFavoritesParameters>
{
  final BaseChangeFavoritesRepository baseChangeFavoritesRepository;

  GetChangeFavoritesUseCase(this.baseChangeFavoritesRepository);
  @override
  Future<Either<Failure, ChangeFavorites>> call(ChangeFavoritesParameters parameters)async {
    return await baseChangeFavoritesRepository.getChangeFavorites(parameters);
  }

}
