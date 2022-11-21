import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shop_app_with_clean_architecture/core/service/service_locator.dart';
import 'package:shop_app_with_clean_architecture/core/widgets/toast_state.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/presentation/controller/cubit/states.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/presentation/widgets/show_profile_details.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<ProfileCubit>()..getProfile(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          if(state is GetUpdateProfileSuccessState){
            if(state.model.status!){
              showToast(
                  text: state.model.message.toString(),
                  state: ToastState.success,
              );
            }else{
              showToast(
                  text: state.model.message.toString(),
                  state: ToastState.error);
            }
          }
        },
        builder: (context, state) {
          var cubit = ProfileCubit.get(context);
          return Scaffold(
            body: Conditional.single(
              context: context,
              conditionBuilder: (context) => cubit.profile != null,
              widgetBuilder: (context) =>
                  ShowProfileDetails(profile: cubit.profile!),
              fallbackBuilder: (context) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }
}


