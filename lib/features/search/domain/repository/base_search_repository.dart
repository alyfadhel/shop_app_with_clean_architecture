import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/search/domain/entities/search.dart';

abstract class BaseSearchRepository
{
  Future<Either<Failure,List<SearchData>>>getSearch(SearchParameters parameters);
}

class SearchParameters extends Equatable
{
  final String text;

 const SearchParameters({
    required this.text,
  });

  @override
  List<Object?> get props => [text];
}