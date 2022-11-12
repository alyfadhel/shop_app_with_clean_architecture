import 'package:shop_app_with_clean_architecture/core/network/dio_helper.dart';
import 'package:shop_app_with_clean_architecture/core/network/end-points.dart';
import 'package:shop_app_with_clean_architecture/features/categories/datasource/models/categories_model.dart';

abstract class BaseCategoriesRemoteDataSource {
  Future<List<CategoriesDataModel>> getCategories();
}

class CategoriesRemoteDataSource extends BaseCategoriesRemoteDataSource {
  final DioHelper dioHelper;

  CategoriesRemoteDataSource(this.dioHelper);

  @override
  Future<List<CategoriesDataModel>> getCategories() async {
    final response = await dioHelper.get(
      endPoint: categoriesDetailsEndPoint,
    );
    return List<CategoriesDataModel>.from((response['data']['data'] as List)
    .map((e) => CategoriesDataModel.fromJson(e)));
  }
}
