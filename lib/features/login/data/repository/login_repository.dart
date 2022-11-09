import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/exception.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/login/data/datasource/base_login_remote_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/login/domain/entities/login.dart';
import 'package:shop_app_with_clean_architecture/features/login/domain/repository/base_login_repository.dart';

class LoginRepository extends BaseLoginRepository
{
  final BaseLoginRemoteDataSource baseLoginRemoteDataSource;

  LoginRepository(this.baseLoginRemoteDataSource);
  @override
  Future<Either<Failure, Login>> getLoginUser(LoginDetailsParameters parameters) async{
    final result = await baseLoginRemoteDataSource.getLoginUser(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

}