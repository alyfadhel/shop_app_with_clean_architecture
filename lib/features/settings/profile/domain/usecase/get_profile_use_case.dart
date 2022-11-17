import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/domain/entities/profile.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/domain/repository/base_profile_repository.dart';


class GetProfileUseCase extends BaseUseCase<Profile,NoParameters>
{
  final BaseProfileRepository baseProfileRepository;

  GetProfileUseCase(this.baseProfileRepository);
  @override
  Future<Either<Failure, Profile>> call(NoParameters parameters) async{
    return await baseProfileRepository.getProfile();
  }

}