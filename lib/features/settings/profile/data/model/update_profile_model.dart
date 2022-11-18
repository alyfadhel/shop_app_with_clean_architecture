import 'package:shop_app_with_clean_architecture/features/settings/profile/domain/entities/update_profile.dart';

class UpdateProfileModel extends UpdateProfile
{
 const UpdateProfileModel({
   required super.status,
   required super.message,
   required super.data,
 });
 factory UpdateProfileModel.fromJson(Map<String,dynamic>json)
 {
   return UpdateProfileModel(
       status: json['status'],
       message: json['message'],
       data: (json['data']) != null ? UpdateProfileDataModel.fromJson(json['data']) : null,
   );
 }

}

class UpdateProfileDataModel extends UpdateProfileData
{
 const UpdateProfileDataModel({
   required super.id,
   required super.name,
   required super.email,
   required super.phone,
   required super.image,
   required super.points,
   required super.credit,
   required super.token,
 });

 factory UpdateProfileDataModel.fromJson(Map<String,dynamic>json)
 {
   return UpdateProfileDataModel(
       id: json['id'],
       name: json['name'],
       email: json['email'],
       phone: json['phone'],
       image: json['image'],
       points: json['points'],
       credit: json['credit'],
       token: json['token'],
   );
 }

}