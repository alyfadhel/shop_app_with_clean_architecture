import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/exception.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/data/datasource/base_profile_remote_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/domain/entities/profile.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/domain/repository/base_profile_repository.dart';

class ProfileRepository extends BaseProfileRepository
{
  final BaseProfileRemoteDataSource baseProfileRemoteDataSource;

  ProfileRepository(this.baseProfileRemoteDataSource);
  @override
  Future<Either<Failure, Profile>> getProfile() async{
    final result = await baseProfileRemoteDataSource.getProfile();

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

}