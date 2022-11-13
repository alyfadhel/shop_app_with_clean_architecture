import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/entities/banners.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/repository/base_banners_repository.dart';

class GetBannersUseCase extends BaseUseCase<List<BannersData>,NoParameters>
{
  final BaseBannersRepository bannersRepository;

  GetBannersUseCase(this.bannersRepository);
  @override
  Future<Either<Failure, List<BannersData>>> call(NoParameters parameters)async {
    return await bannersRepository.getBanners();
  }

}