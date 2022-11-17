import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/domain/entities/profile.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/domain/usecase/get_profile_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/presentation/controller/cubit/states.dart';



class ProfileCubit extends Cubit<ProfileStates>
{
  final GetProfileUseCase getProfileUseCase;
  ProfileCubit(
      this.getProfileUseCase,
      ): super(InitialProfileState());

  static ProfileCubit get(context)=>BlocProvider.of(context);

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();

  Profile? profile;

  void getProfile()async
  {
    emit(GetProfileLoadingState());
    final result = await getProfileUseCase(const NoParameters());

    result.fold(
            (l) => emit(GetProfileErrorState(l.message)),
            (r) {
              profile = r;
              emit(GetProfileSuccessState(r));
            });
  }


}