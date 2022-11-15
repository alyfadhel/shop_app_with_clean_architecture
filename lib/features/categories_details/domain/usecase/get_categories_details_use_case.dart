import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/domain/entities/categories_details.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/domain/repository/base_categories_details_repository.dart';

class GetCategoriesDetailsUseCase extends BaseUseCase<List<CategoriesDataDetails>,CategoriesDetailsParameters>
{
  final BaseCategoriesDetailsRepository baseCategoriesDetailsRepository;

  GetCategoriesDetailsUseCase(this.baseCategoriesDetailsRepository);
  @override
  Future<Either<Failure, List<CategoriesDataDetails>>> call(CategoriesDetailsParameters parameters) async{
    return baseCategoriesDetailsRepository.getCategoriesDetails(parameters);
  }

}