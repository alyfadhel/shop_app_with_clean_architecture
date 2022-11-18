import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/domain/entities/update_profile.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/domain/repository/base_profile_repository.dart';

class GetUpdateProfileUseCase extends BaseUseCase<UpdateProfile,UpdateProfileParameters>
{
  final BaseProfileRepository baseProfileRepository;

  GetUpdateProfileUseCase(this.baseProfileRepository);
  @override
  Future<Either<Failure, UpdateProfile>> call(UpdateProfileParameters parameters) async{
    return await baseProfileRepository.getUpdateProfile(parameters);
  }

}