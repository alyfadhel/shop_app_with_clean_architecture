import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_with_clean_architecture/core/layout/home_layout.dart';
import 'package:shop_app_with_clean_architecture/core/resources/color_manager.dart';
import 'package:shop_app_with_clean_architecture/core/resources/strings_manager.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';
import 'package:shop_app_with_clean_architecture/core/service/service_locator.dart';
import 'package:shop_app_with_clean_architecture/core/widgets/my_form_field.dart';
import 'package:shop_app_with_clean_architecture/core/widgets/my_button.dart';
import 'package:shop_app_with_clean_architecture/core/widgets/my_textButton.dart';
import 'package:shop_app_with_clean_architecture/core/widgets/toast_state.dart';
import 'package:shop_app_with_clean_architecture/features/login/presentation/controller/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/login/presentation/controller/states.dart';

var formKey = GlobalKey<FormState>();
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (BuildContext context) =>sl<LoginCubit>(),
        child: BlocConsumer<LoginCubit,LoginStates>(
          listener: (context, state) {
            if(state is GetLoginSuccessState){
              if(state.login.status!){
                showToast(
                    text: state.login.message!,
                    state: ToastState.success,
                );
                sl<SharedPreferences>()
                    .setString('token', state.login.data!.token!).then((value)
                {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeLayout(),
                      ),
                  );
                });
              }else{
                showToast(
                    text: state.login.message!,
                    state: ToastState.error,
                );
              }
            }
          },
          builder: (context, state) {
            var cubit = LoginCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.login,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        Text(
                          AppStrings.loginTitle,
                          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                              color: ColorManager.gGrey
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s40,
                        ),
                        MyFormField(
                          controller: cubit.emailController,
                          type: TextInputType.emailAddress,
                          validator: (value)
                          {
                            if(value!.isEmpty){
                              return 'Please Enter Your Email';
                            }else{
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
                          controller: cubit.passwordController,
                          type: TextInputType.visiblePassword,
                          validator: (value)
                          {
                            if(value!.isEmpty){
                              return 'Please Enter Your Password';
                            }else{
                              return null;
                            }
                          },
                          label: AppStrings.password,
                          prefix: Icons.lock_outline,
                          suffix: cubit.suffix,
                          isPassword: cubit.isPassword,
                          onPressed: (){
                            cubit.changePasswordVisibility();
                          },
                        ),
                        const SizedBox(
                          height: AppSize.s40,
                        ),
                        ConditionalBuilder(
                          condition: state is! GetLoginLoadingState,
                          builder: (context) => MyButton(
                            onPressedTextButton: ()
                            {
                              if(formKey.currentState!.validate()){
                                cubit.loginUser(
                                    email: cubit.emailController.text,
                                    password: cubit.passwordController.text,
                                );
                              }
                            },
                            text: AppStrings.login,
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              color: Colors.white,
                              fontSize: AppSize.s25,
                            ),
                          ),
                          fallback: (context) => const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: AppSize.s40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            Text(
                              AppStrings.haveNotAccount,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            MyTextButton(
                              onPressedTextButton: (){},
                              text: AppStrings.registerHere,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
