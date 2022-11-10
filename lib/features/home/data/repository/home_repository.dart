import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/exception.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/home/data/datasource/base_home_remote_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/entities/home.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/repository/base_home_repository.dart';

class HomeRepository extends BaseHomeRepository
{
  final BaseHomeRemoteDataSource baseHomeRemoteDataSource;

  HomeRepository(this.baseHomeRemoteDataSource);
  @override
  Future<Either<Failure, Home>> getBanners(NoParameters parameters) async{
    final result = await baseHomeRemoteDataSource.getBanners(parameters);
    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

}