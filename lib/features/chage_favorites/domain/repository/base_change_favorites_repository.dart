import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/chage_favorites/domain/entities/change_favorites.dart';

abstract class BaseChangeFavoritesRepository
{
  Future<Either<Failure,ChangeFavorites>>getChangeFavorites(ChangeFavoritesParameters parameters);
}

class ChangeFavoritesParameters extends Equatable
{
  final int productId;

 const ChangeFavoritesParameters({required this.productId});

  @override
  List<Object?> get props => [productId];
}