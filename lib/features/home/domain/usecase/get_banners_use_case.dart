import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/entities/home.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/repository/base_home_repository.dart';

class GetBannersUseCase extends BaseUseCase<Home,NoParameters>
{
  final BaseHomeRepository baseHomeRepository;

  GetBannersUseCase(this.baseHomeRepository);
  @override
  Future<Either<Failure, Home>> call(NoParameters parameters) async{
    return await baseHomeRepository.getBanners(parameters);
  }

}