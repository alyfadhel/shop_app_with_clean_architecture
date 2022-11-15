import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/domain/entities/categories_details.dart';

abstract class BaseCategoriesDetailsRepository
{
  Future<Either<Failure,List<CategoriesDataDetails>>>getCategoriesDetails(CategoriesDetailsParameters parameters);
}

class CategoriesDetailsParameters extends Equatable
{
  final int id;

 const CategoriesDetailsParameters({
   required this.id,
 });

  @override
  List<Object?> get props => [id];
}