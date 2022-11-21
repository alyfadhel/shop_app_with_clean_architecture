import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_with_clean_architecture/core/resources/color_manager.dart';
import 'package:shop_app_with_clean_architecture/core/resources/strings_manager.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';
import 'package:shop_app_with_clean_architecture/core/service/service_locator.dart';
import 'package:shop_app_with_clean_architecture/core/widgets/my_button.dart';
import 'package:shop_app_with_clean_architecture/core/widgets/my_form_field.dart';
import 'package:shop_app_with_clean_architecture/features/login/presentation/screens/login.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/domain/entities/profile.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/presentation/controller/cubit/states.dart';

var formKey = GlobalKey<FormState>();

class ShowProfileDetails extends StatelessWidget {
  final Profile profile;

  const ShowProfileDetails({
    Key? key,
    required this.profile,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        cubit.nameController.text = profile.data!.name;
        cubit.emailController.text = profile.data!.email;
        cubit.phoneController.text = profile.data!.phone;
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
                      AppStrings.profile,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(color: ColorManager.sBlack),
                    ),
                    const SizedBox(
                      height: AppSize.s40,
                    ),
                    MyFormField(
                      controller: cubit.nameController,
                      type: TextInputType.name,
                      label: 'name',
                      prefix: Icons.person,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    MyFormField(
                      controller: cubit.emailController,
                      type: TextInputType.emailAddress,
                      label: 'email',
                      prefix: Icons.email_outlined,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: AppSize.s20,
                    ),
                    MyFormField(
                      controller: cubit.phoneController,
                      type: TextInputType.phone,
                      label: 'phone',
                      prefix: Icons.phone_android,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Phone';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(
                      height: AppSize.s40,
                    ),
                    MyButton(
                      onPressedTextButton: () {
                        sl<SharedPreferences>().remove('token').then(
                              (value) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                                    (route) => false);
                          },
                        );
                      },
                      text: 'LogOut',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: ColorManager.sWhite),
                    ),
                    const SizedBox(
                      height: AppSize.s40,
                    ),
                    MyButton(
                      onPressedTextButton: ()
                      {
                        if(formKey.currentState!.validate()){
                          cubit.updateProfile(
                            name: cubit.nameController.text ,
                            email: cubit.emailController.text,
                            phone: cubit.phoneController.text,
                          );
                        }
                      },
                      text: 'Update',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: ColorManager.sWhite),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}