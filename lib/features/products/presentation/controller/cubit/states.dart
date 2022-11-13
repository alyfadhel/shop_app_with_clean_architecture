import 'package:shop_app_with_clean_architecture/features/products/domain/entities/banners.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/entities/products.dart';

abstract class BannersStates {}

class InitialBannersState extends BannersStates{}

class GetBannersLoadingState extends BannersStates{}

class GetBannersSuccessState extends BannersStates
{
  final List<BannersData>bannersData;

  GetBannersSuccessState(this.bannersData);
}

class GetBannersErrorState extends BannersStates
{
  final String error;

  GetBannersErrorState(this.error);
}

class GetProductLoadingState extends BannersStates{}

class GetProductSuccessState extends BannersStates{
  final List<ProductsData>productsData;

  GetProductSuccessState(this.productsData);
}

class GetProductErrorState extends BannersStates
{
  final String error;

  GetProductErrorState(this.error);
}