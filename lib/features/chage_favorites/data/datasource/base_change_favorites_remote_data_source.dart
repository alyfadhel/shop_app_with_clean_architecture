import 'package:shop_app_with_clean_architecture/core/network/dio_helper.dart';
import 'package:shop_app_with_clean_architecture/core/network/end-points.dart';
import 'package:shop_app_with_clean_architecture/features/chage_favorites/data/model/change_favorites_model.dart';
import 'package:shop_app_with_clean_architecture/features/chage_favorites/domain/repository/base_change_favorites_repository.dart';

abstract class BaseChangeFavoritesRemoteDataSource
{
  Future<ChangeFavoritesModel>getChangeFavorites(ChangeFavoritesParameters parameters);
}

class ChangeFavoritesRemoteDataSource extends BaseChangeFavoritesRemoteDataSource
{
  final DioHelper dioHelper;

  ChangeFavoritesRemoteDataSource(this.dioHelper);
  @override
  Future<ChangeFavoritesModel> getChangeFavorites(ChangeFavoritesParameters parameters)async {
    final response = await dioHelper.post(
        endPoint: changeFavoritesEndPoint,
      data: {
          'product_id' : parameters.productId,
      },
      Authorization: token,
    );
    return ChangeFavoritesModel.fromJson(response);
  }

}