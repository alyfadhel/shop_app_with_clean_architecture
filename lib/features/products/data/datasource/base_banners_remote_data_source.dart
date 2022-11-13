import 'package:shop_app_with_clean_architecture/core/network/dio_helper.dart';
import 'package:shop_app_with_clean_architecture/core/network/end-points.dart';
import 'package:shop_app_with_clean_architecture/features/products/data/model/banners_model.dart';
import 'package:shop_app_with_clean_architecture/features/products/data/model/products_model.dart';

abstract class BaseBannersRemoteDataSource
{
  Future<List<BannersDataModel>>getBanners();
  Future<List<ProductsDataModel>>getProducts();
}

class BannersRemoteDataSource extends BaseBannersRemoteDataSource
{
  final DioHelper dioHelper;

  BannersRemoteDataSource(this.dioHelper);
  @override
  Future<List<BannersDataModel>> getBanners() async{
    final response = await dioHelper.get(
        endPoint: bannersEndPoint,
    );

    return List<BannersDataModel>.from((response['data'] as List)
    .map((e) => BannersDataModel.fromJson(e)));
  }

  @override
  Future<List<ProductsDataModel>> getProducts() async{
    final response = await dioHelper.get(
      endPoint: productsDetailsEndPoint,
    );

    return List<ProductsDataModel>.from((response['data']['data'] as List)
        .map((e) => ProductsDataModel.fromJson(e)));
  }

}