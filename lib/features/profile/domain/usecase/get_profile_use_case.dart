import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/profile/domain/entities/profile.dart';
import 'package:shop_app_with_clean_architecture/features/profile/domain/repository/base_profile_repository.dart';

class GetProfileUseCae extends BaseUseCase<Profile,NoParameters>
{
  final BaseProfileRepository baseProfileRepository;

  GetProfileUseCae(this.baseProfileRepository);
  @override
  Future<Either<Failure, Profile>> call(NoParameters parameters) async{
    return await baseProfileRepository.getProfile();
  }

}