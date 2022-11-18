import 'package:shop_app_with_clean_architecture/features/search/domain/entities/search.dart';

abstract class SearchStates{}

class InitialSearchState extends SearchStates{}

class GetSearchLoadingState extends SearchStates{}

class GetSearchSuccessState extends SearchStates{
  final List<SearchData> model;

  GetSearchSuccessState(this.model);
}

class GetSearchErrorState extends SearchStates
{
  final String error;

  GetSearchErrorState(this.error);
}