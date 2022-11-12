import 'package:shop_app_with_clean_architecture/features/categories/domain/entities/categories.dart';

abstract class CategoriesStates{}

class InitialCategoriesState extends CategoriesStates{}

class GetCategoriesLoadingState extends CategoriesStates{}

class GetCategoriesSuccessState extends CategoriesStates
{
  final List<CategoriesData> categoriesData;

  GetCategoriesSuccessState(this.categoriesData);
}

class GetCategoriesErrorState extends CategoriesStates{
  final String error;

  GetCategoriesErrorState(this.error);
}