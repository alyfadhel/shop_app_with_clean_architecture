import 'package:shop_app_with_clean_architecture/core/network/dio_helper.dart';
import 'package:shop_app_with_clean_architecture/core/network/end-points.dart';
import 'package:shop_app_with_clean_architecture/features/favorites/data/model/favorites_model.dart';

abstract class BaseFavoritesRemoteDataSource
{
  Future<List<FavoritesDataModel>>getFavorites();
}

class FavoritesRemoteDataSource extends BaseFavoritesRemoteDataSource
{
  final DioHelper dioHelper;

  FavoritesRemoteDataSource(this.dioHelper);
  @override
  Future<List<FavoritesDataModel>> getFavorites() async{
    final response = await dioHelper.get(
        endPoint: favoritesEndPoint,
      Authorization: token,
    );
    return List<FavoritesDataModel>.from((response['data']['data'] as List)
    .map((e) => FavoritesDataModel.fromJson(e)));
  }

}