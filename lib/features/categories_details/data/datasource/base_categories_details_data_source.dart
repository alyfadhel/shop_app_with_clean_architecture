import 'package:shop_app_with_clean_architecture/core/network/dio_helper.dart';
import 'package:shop_app_with_clean_architecture/core/network/end-points.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/data/model/categories_details_model.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/domain/repository/base_categories_details_repository.dart';

abstract class BaseCategoriesDetailsRemoteDataSource
{
  Future<List<CategoriesDataDetailsModel>>getCategoriesDetails(CategoriesDetailsParameters parameters);
}

class CategoriesDetailsRemoteDataSource extends BaseCategoriesDetailsRemoteDataSource
{
  final DioHelper dioHelper;

  CategoriesDetailsRemoteDataSource(this.dioHelper);
  @override
  Future<List<CategoriesDataDetailsModel>> getCategoriesDetails(CategoriesDetailsParameters parameters)async {
    final response =  await dioHelper.get(
        endPoint: categoriesDetailsEndPoint(parameters.id),
        Authorization: token,
    );
    return List<CategoriesDataDetailsModel>.from((response['data']['data'] as List)
    .map((e) => CategoriesDataDetailsModel.fromJson(e)));
  }


}