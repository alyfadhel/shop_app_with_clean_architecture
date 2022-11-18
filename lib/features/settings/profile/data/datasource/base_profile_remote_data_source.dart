import 'package:shop_app_with_clean_architecture/core/network/dio_helper.dart';
import 'package:shop_app_with_clean_architecture/core/network/end-points.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/data/model/profile_model.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/data/model/update_profile_model.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/domain/repository/base_profile_repository.dart';

abstract class BaseProfileRemoteDataSource {
  Future<ProfileModel> getProfile();

  Future<UpdateProfileModel> getUpdateProfile(
      UpdateProfileParameters parameters);
}

class ProfileRemoteDataSource extends BaseProfileRemoteDataSource {
  final DioHelper dioHelper;

  ProfileRemoteDataSource(this.dioHelper);

  @override
  Future<ProfileModel> getProfile() async {
    final response = await dioHelper.get(
      endPoint: profileEndPoint,
      Authorization: token,
    );
    return ProfileModel.fromJson(response);
  }

  @override
  Future<UpdateProfileModel> getUpdateProfile(
      UpdateProfileParameters parameters) async {
    final response = await dioHelper.put(
      endPoint: updateProfileEndPoint,
      data: {
        'name': parameters.name,
        'email': parameters.email,
        'phone': parameters.phone,
      },
      Authorization: token,
    );

    return UpdateProfileModel.fromJson(response);
  }
}
