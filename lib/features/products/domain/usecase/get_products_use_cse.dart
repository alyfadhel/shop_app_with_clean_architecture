import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/entities/products.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/repository/base_banners_repository.dart';

class GetProductsUseCase extends BaseUseCase<List<ProductsData>,NoParameters>
{
  final BaseBannersRepository baseBannersRepository;

  GetProductsUseCase(this.baseBannersRepository);
  @override
  Future<Either<Failure, List<ProductsData>>> call(NoParameters parameters) async{
    return await baseBannersRepository.getProducts();
  }

}