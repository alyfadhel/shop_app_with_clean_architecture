import 'package:shop_app_with_clean_architecture/features/settings/profile/domain/entities/profile.dart';

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