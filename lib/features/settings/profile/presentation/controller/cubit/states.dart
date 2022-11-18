import 'package:shop_app_with_clean_architecture/features/settings/profile/domain/entities/profile.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/domain/entities/update_profile.dart';

abstract class ProfileStates{}

class InitialProfileState extends ProfileStates{}

class GetProfileLoadingState extends ProfileStates{}

class GetProfileSuccessState extends ProfileStates{
  final Profile profile;

  GetProfileSuccessState(this.profile);
}

class GetProfileErrorState extends ProfileStates
{
  final String error;

  GetProfileErrorState(this.error);
}

class GetUpdateProfileLoadingState extends ProfileStates{}

class GetUpdateProfileSuccessState extends ProfileStates{
  final UpdateProfile model;

  GetUpdateProfileSuccessState(this.model);
}

class GetUpdateProfileErrorState extends ProfileStates
{
  final String error;

  GetUpdateProfileErrorState(this.error);
}