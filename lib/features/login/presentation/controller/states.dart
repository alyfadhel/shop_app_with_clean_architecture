import 'package:shop_app_with_clean_architecture/features/login/domain/entities/login.dart';

abstract class LoginStates{}

class InitialLoginState extends LoginStates{}

class ChangePasswordVisibility extends LoginStates{}

class GetLoginLoadingState extends LoginStates{}

class GetLoginSuccessState extends LoginStates
{
  final Login login;

  GetLoginSuccessState(this.login);
}

class GetLoginErrorState extends LoginStates{
  final String error;

  GetLoginErrorState(this.error);
}
