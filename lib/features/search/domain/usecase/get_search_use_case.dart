import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/search/domain/entities/search.dart';
import 'package:shop_app_with_clean_architecture/features/search/domain/repository/base_search_repository.dart';

class GetSearchUseCase extends BaseUseCase<List<SearchData>,SearchParameters>{
  final BaseSearchRepository baseSearchRepository;

  GetSearchUseCase(this.baseSearchRepository);
  @override
  Future<Either<Failure, List<SearchData>>> call(SearchParameters parameters)async {
    return await baseSearchRepository.getSearch(parameters);
  }
}
