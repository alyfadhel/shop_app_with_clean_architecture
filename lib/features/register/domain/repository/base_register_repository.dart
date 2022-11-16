import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/register/domain/entities/register.dart';

abstract class BaseRegisterRepository
{
  Future<Either<Failure,Register>>getRegisterUser(RegisterParameters parameters);
}

class RegisterParameters extends Equatable
{
  final String name;
  final String email;
  final String phone;
  final String password;

 const RegisterParameters({
  required this.name,
  required this.email,
  required this.phone,
  required this.password,
 });

  @override
  List<Object?> get props => [
    name,
    email,
    phone,
    password,
  ];
}