import 'package:shop_app_with_clean_architecture/core/network/dio_helper.dart';
import 'package:shop_app_with_clean_architecture/core/network/end-points.dart';
import 'package:shop_app_with_clean_architecture/features/search/data/model/search_model.dart';
import 'package:shop_app_with_clean_architecture/features/search/domain/repository/base_search_repository.dart';

abstract class BaseSearchRemoteDataSource
{
  Future<List<SearchDataModel>>getSearch(SearchParameters parameters);
}

class SearchRemoteDataSource extends BaseSearchRemoteDataSource
{
  final DioHelper dioHelper;

  SearchRemoteDataSource(this.dioHelper);
  @override
  Future<List<SearchDataModel>> getSearch(SearchParameters parameters) async{
    final response = await dioHelper.post(
        endPoint: searchEndPoint,
      data: {
          'text' : parameters.text,
      },
      Authorization: token,
    );
    return List<SearchDataModel>.from((response['data']['data'] as List)
    .map((e) => SearchDataModel.fromJson(e)));
  }

}