import 'package:shop_app_with_clean_architecture/features/products_details/domain/entities/products_details.dart';

abstract class ProductsDetailsStates{}

class InitialProductsDetailsState extends ProductsDetailsStates{}

class GetProductsDetailsLoadingState extends ProductsDetailsStates{}

class GetProductsDetailsSuccessState extends ProductsDetailsStates
{
  final ProductsDetails productsDetails;

  GetProductsDetailsSuccessState(this.productsDetails);
}

class GetProductsDetailsErrorState extends ProductsDetailsStates
{
  final String error;

  GetProductsDetailsErrorState(this.error);
}