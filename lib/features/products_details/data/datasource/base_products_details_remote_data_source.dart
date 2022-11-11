import 'package:shop_app_with_clean_architecture/core/network/dio_helper.dart';
import 'package:shop_app_with_clean_architecture/core/network/end-points.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/data/models/products_details_model.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/domain/repository/base_products_details_repository.dart';

abstract class BaseProductsDetailsRemoteDataSource {
  Future<ProductsDetailsModel> getProductsDetails(
      ProductsDetailsParameters parameters);
}

class ProductsDetailsRemoteDataSource
    extends BaseProductsDetailsRemoteDataSource {
  final DioHelper dioHelper;

  ProductsDetailsRemoteDataSource(this.dioHelper);

  @override
  Future<ProductsDetailsModel> getProductsDetails(
      ProductsDetailsParameters parameters) async {
    final response = await dioHelper.get(
      endPoint: productsDetailsEndPoint,
      data: {
        'id': parameters.id,
      },
      Authorization: token,
    );
    return ProductsDetailsModel.fromJson(response);
  }
}
