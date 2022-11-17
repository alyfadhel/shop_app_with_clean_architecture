import 'package:shop_app_with_clean_architecture/core/network/dio_helper.dart';
import 'package:shop_app_with_clean_architecture/core/network/end-points.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/data/model/profile_model.dart';

abstract class BaseProfileRemoteDataSource
{
  Future<ProfileModel>getProfile();
}

class ProfileRemoteDataSource extends BaseProfileRemoteDataSource
{
  final DioHelper dioHelper;

  ProfileRemoteDataSource(this.dioHelper);
  @override
  Future<ProfileModel> getProfile() async{
    final response = await dioHelper.get(
        endPoint: profileEndPoint,
      Authorization: token,
    );
    return ProfileModel.fromJson(response);
  }

}