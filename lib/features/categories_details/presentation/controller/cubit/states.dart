import 'package:shop_app_with_clean_architecture/features/categories_details/domain/entities/categories_details.dart';

abstract class CategoriesDetailsStates{}

class InitialCategoriesDetailsState extends CategoriesDetailsStates{}

class GetCategoriesDetailsLoadingState extends CategoriesDetailsStates{}

class GetCategoriesDetailsSuccessState extends CategoriesDetailsStates
{
  final List<CategoriesDataDetails>model;

  GetCategoriesDetailsSuccessState(this.model);
}

class GetCategoriesDetailsErrorState extends CategoriesDetailsStates
{
  final String error;

  GetCategoriesDetailsErrorState(this.error);
}