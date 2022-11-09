import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/login/domain/entities/login.dart';
import 'package:shop_app_with_clean_architecture/features/login/domain/repository/base_login_repository.dart';

class GetUserLoginUseCase extends BaseUseCase<Login,LoginDetailsParameters>
{
  final BaseLoginRepository baseLoginRepository;

  GetUserLoginUseCase(this.baseLoginRepository);
  @override
  Future<Either<Failure, Login>> call(parameters) async{
    return await baseLoginRepository.getLoginUser(parameters);
  }

}