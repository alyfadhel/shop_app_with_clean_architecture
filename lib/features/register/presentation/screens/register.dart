import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_with_clean_architecture/core/resources/color_manager.dart';
import 'package:shop_app_with_clean_architecture/core/resources/strings_manager.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';
import 'package:shop_app_with_clean_architecture/core/service/service_locator.dart';
import 'package:shop_app_with_clean_architecture/core/widgets/my_button.dart';
import 'package:shop_app_with_clean_architecture/core/widgets/my_form_field.dart';
import 'package:shop_app_with_clean_architecture/core/widgets/toast_state.dart';
import 'package:shop_app_with_clean_architecture/features/login/presentation/screens/login.dart';
import 'package:shop_app_with_clean_architecture/features/register/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/register/presentation/controller/cubit/states.dart';

var formKey = GlobalKey<FormState>();
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context, state) {
          if (state is GetRegisterSuccessState) {
            if (state.register.status) {
              showToast(
                text: state.register.message,
                state: ToastState.success,
              );
              sl<SharedPreferences>()
                  .setString('token', state.register.data.token)
                  .then((value) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              });
            } else {
              showToast(
                text: state.register.message,
                state: ToastState.error,
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return  Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.register,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        Text(
                          AppStrings.registerTitle,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: ColorManager.gGrey),
                        ),
                        const SizedBox(
                          height: AppSize.s40,
                        ),
                        MyFormField(
                          controller: cubit.nameController,
                          type: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Name';
                            } else {
                              return null;
                            }
                          },
                          label: AppStrings.name,
                          prefix: Icons.person,
                        ),
                        const SizedBox(
                          height: AppSize.s40,
                        ),
                        MyFormField(
                          controller: cubit.emailController,
                          type: TextInputType.emailAddress,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Email';
                            } else {
                              return null;
                            }
                          },
                          label: AppStrings.email,
                          prefix: Icons.email_outlined,
                        ),
                        const SizedBox(
                          height: AppSize.s40,
                        ),
                        MyFormField(
                          controller: cubit.phoneController,
                          type: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your phone';
                            } else {
                              return null;
                            }
                          },
                          label: AppStrings.phone,
                          prefix: Icons.phone_android,
                        ),
                        const SizedBox(
                          height: AppSize.s40,
                        ),
                        MyFormField(
                          controller: cubit.passwordController,
                          type: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Password';
                            } else {
                              return null;
                            }
                          },
                          label: AppStrings.password,
                          prefix: Icons.lock_outline,
                          suffix: cubit.suffix,
                          isPassword: cubit.isPassword,
                          onPressed: () {
                            cubit.changeRegisterPasswordVisibility();
                          },
                        ),
                        const SizedBox(
                          height: AppSize.s40,
                        ),
                        Conditional.single(
                          context: context,
                          conditionBuilder: (context) =>
                          state is! GetRegisterLoadingState,
                          widgetBuilder: (context) => MyButton(
                            onPressedTextButton: () {
                              if (formKey.currentState!.validate()) {
                                cubit.getRegisterUser(
                                    name: cubit.nameController.text,
                                    email: cubit.emailController.text,
                                    phone: cubit.phoneController.text,
                                    password: cubit.passwordController.text,
                                );
                              }
                            },
                            text: AppStrings.register,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                              color: Colors.white,
                              fontSize: AppSize.s25,
                            ),
                          ),
                          fallbackBuilder: (context) =>
                          const Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
