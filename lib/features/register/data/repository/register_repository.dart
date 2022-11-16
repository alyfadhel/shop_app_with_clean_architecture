import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/exception.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/register/data/datasource/base_register_remote_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/register/domain/entities/register.dart';
import 'package:shop_app_with_clean_architecture/features/register/domain/repository/base_register_repository.dart';

class RegisterRepository extends BaseRegisterRepository
{
  final BaseRegisterRemoteDataSource baseRegisterRemoteDataSource;

  RegisterRepository(this.baseRegisterRemoteDataSource);
  @override
  Future<Either<Failure, Register>> getRegisterUser(RegisterParameters parameters)async {
    final result =  await baseRegisterRemoteDataSource.getRegisterUser(parameters);

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

}