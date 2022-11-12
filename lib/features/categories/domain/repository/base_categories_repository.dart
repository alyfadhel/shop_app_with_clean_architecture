import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/categories/domain/entities/categories.dart';

abstract class BaseCategoriesRepository
{
  Future<Either<Failure,List<CategoriesData>>>getCategories();
}