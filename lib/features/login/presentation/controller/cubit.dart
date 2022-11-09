import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/features/login/domain/entities/login.dart';
import 'package:shop_app_with_clean_architecture/features/login/domain/repository/base_login_repository.dart';
import 'package:shop_app_with_clean_architecture/features/login/domain/usecase/get_login_user_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/login/presentation/controller/states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final GetUserLoginUseCase getUserLoginUseCase;

  LoginCubit(
    this.getUserLoginUseCase,
  ) : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;

  IconData suffix = Icons.visibility_off_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibility());
  }

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  void loginUser({
    required String email,
    required String password,
  }) async {
    emit(GetLoginLoadingState());
    final result = await getUserLoginUseCase(
      LoginDetailsParameters(
        email: email,
        password: password,
      ),
    );

    result.fold(
            (l) => emit(GetLoginErrorState(l.message)),
            (r) => emit(GetLoginSuccessState(r)),
    );
  }
}
