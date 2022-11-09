import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/login/domain/entities/login.dart';

abstract class BaseLoginRepository
{
  Future<Either<Failure,Login>>getLoginUser(LoginDetailsParameters parameters);
}

class LoginDetailsParameters extends Equatable
{
  final String email;
  final String password;

 const LoginDetailsParameters({
   required this.email,
   required this.password,
 });

  @override
  List<Object?> get props => [
    email,
    password,
  ];

}