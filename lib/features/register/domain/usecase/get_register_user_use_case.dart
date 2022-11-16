
import 'package:dartz/dartz.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/register/domain/entities/register.dart';
import 'package:shop_app_with_clean_architecture/features/register/domain/repository/base_register_repository.dart';

class GetRegisterUserUseCase extends BaseUseCase<Register,RegisterParameters>
{
  final BaseRegisterRepository baseRegisterRepository;

  GetRegisterUserUseCase(this.baseRegisterRepository);
  @override
  Future<Either<Failure, Register>> call(RegisterParameters parameters) async{
    return await baseRegisterRepository.getRegisterUser(parameters);
  }
}