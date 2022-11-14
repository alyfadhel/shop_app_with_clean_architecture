import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/domain/entities/products_details.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/domain/repository/base_products_details_repository.dart';

class GetProductsDetailsUseCase extends BaseUseCase<ProductsDetails,ProductsDetailsParameters>
{
  final BaseProductsDetailsRepository baseProductsDetailsRepository;

  GetProductsDetailsUseCase(this.baseProductsDetailsRepository);
  @override
  Future<Either<Failure, ProductsDetails>> call(ProductsDetailsParameters parameters)async {
    return await baseProductsDetailsRepository.getProductsDetails(parameters);
  }

}