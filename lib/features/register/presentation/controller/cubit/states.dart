import 'package:shop_app_with_clean_architecture/features/register/domain/entities/register.dart';

abstract class RegisterStates{}

class InitialRegisterState extends RegisterStates{}

class ChangeRegisterPasswordVisibility extends RegisterStates{}

class GetRegisterLoadingState extends RegisterStates{}

class GetRegisterSuccessState extends RegisterStates{
  final Register register;

  GetRegisterSuccessState(this.register);
}

class GetRegisterErrorState extends RegisterStates{
  final String error;

  GetRegisterErrorState(this.error);
}