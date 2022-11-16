import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/features/register/domain/entities/register.dart';
import 'package:shop_app_with_clean_architecture/features/register/domain/repository/base_register_repository.dart';
import 'package:shop_app_with_clean_architecture/features/register/domain/usecase/get_register_user_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/register/presentation/controller/cubit/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  final GetRegisterUserUseCase getRegisterUserUseCase;

  RegisterCubit(
    this.getRegisterUserUseCase,
  ) : super(InitialRegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  bool isPassword = true;

  IconData suffix = Icons.visibility_off_outlined;

  void changeRegisterPasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangeRegisterPasswordVisibility());
  }

  Register? register;

  void getRegisterUser({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    emit(GetRegisterLoadingState());
    final result = await getRegisterUserUseCase(RegisterParameters(
      name: name,
      email: email,
      phone: phone,
      password: password,
    ));

    result.fold(
      (l) => emit(GetRegisterErrorState(l.message)),
      (r) {
        register = r;
        emit(GetRegisterSuccessState(r));
      },
    );
  }
}
