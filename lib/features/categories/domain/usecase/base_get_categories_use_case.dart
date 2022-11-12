import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/categories/domain/entities/categories.dart';
import 'package:shop_app_with_clean_architecture/features/categories/domain/repository/base_categories_repository.dart';

class GetCategoriesUseCase extends BaseUseCase<List<CategoriesData>,NoParameters>
{
  final BaseCategoriesRepository baseCategoriesRepository;

  GetCategoriesUseCase(this.baseCategoriesRepository);
  @override
  Future<Either<Failure, List<CategoriesData>>> call(NoParameters parameters)async {
    return await baseCategoriesRepository.getCategories();
  }

}