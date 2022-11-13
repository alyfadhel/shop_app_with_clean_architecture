import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/entities/products.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/repository/base_banners_repository.dart';

class GetProductsDetailsUseCase extends BaseUseCase<Data,ProductsDetailsParameters>
{
  final BaseBannersRepository baseBannersRepository;

  GetProductsDetailsUseCase(this.baseBannersRepository);
  @override
  Future<Either<Failure, Data>> call(ProductsDetailsParameters parameters) async{
    return await baseBannersRepository.getProductsDetails(parameters);
  }

}