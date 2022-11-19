import 'package:shop_app_with_clean_architecture/features/chage_favorites/domain/entities/change_favorites.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/entities/home.dart';

abstract class HomeStates{}

class InitialHomeState extends HomeStates{}

class GetHomeLoadingState extends HomeStates{}

class GetHomeSuccessState extends HomeStates{
  final Home home;

  GetHomeSuccessState(this.home);
}

class GetHomeErrorState extends HomeStates{
  final String error;

  GetHomeErrorState(this.error);
}

class GetChangeFavoritesSuccessState extends HomeStates
{
  final ChangeFavorites model;

  GetChangeFavoritesSuccessState(this.model);
}

class GetChangeFavoritesErrorState extends HomeStates
{
  final String error;

  GetChangeFavoritesErrorState(this.error);
}

class ChangeFavoritesState extends HomeStates{}