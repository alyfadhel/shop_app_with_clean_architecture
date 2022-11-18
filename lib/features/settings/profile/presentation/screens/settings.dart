import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shop_app_with_clean_architecture/core/resources/color_manager.dart';
import 'package:shop_app_with_clean_architecture/core/resources/strings_manager.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';
import 'package:shop_app_with_clean_architecture/core/service/service_locator.dart';
import 'package:shop_app_with_clean_architecture/core/widgets/my_form_field.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/domain/entities/profile.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/presentation/controller/cubit/states.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> sl<ProfileCubit>()..getProfile(),
      child: BlocConsumer<ProfileCubit,ProfileStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = ProfileCubit.get(context);
          return Scaffold(
            body: Conditional.single(
                context: context,
                conditionBuilder: (context) => cubit.profile != null,
                widgetBuilder: (context) => ShowProfileDetails(profile: cubit.profile!),
                fallbackBuilder: (context) => const Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}

class ShowProfileDetails extends StatelessWidget {
  final Profile profile;
  const ShowProfileDetails({Key? key,required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit,ProfileStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        cubit.nameController.text = profile.data.name;
        cubit.emailController.text = profile.data.email;
        cubit.phoneController.text = profile.data.phone;
        return Padding(
          padding:  const EdgeInsets.all(AppPadding.p20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.profile,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: ColorManager.sBlack
                ),
              ),
              const SizedBox(
                height: AppSize.s40,
              ),
              MyFormField(
                controller: cubit.nameController,
                type: TextInputType.name,
                label: 'name',
                prefix: Icons.person,
                validator: (value)
                {
                  if(value!.isEmpty){
                    return 'Please Enter Your Name';
                  }else{
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
                validator: (value)
                {
                  if(value!.isEmpty){
                    return 'Please Enter Your Email';
                  }else{
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
                validator: (value)
                {
                  if(value!.isEmpty){
                    return 'Please Enter Your Phone';
                  }else{
                    return null;
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
