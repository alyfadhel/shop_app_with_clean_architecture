import 'package:shop_app_with_clean_architecture/features/login/domain/entities/login.dart';

class LoginModel extends Login
{
 const LoginModel({
   required super.status,
   required super.message,
   required super.data,
 });

 factory LoginModel.fromJson(Map<String,dynamic>json)
 {
   return LoginModel(
       status: json['status'],
       message: json['message'],
       data: json['data'] != null ? DataModel.fromJson(json['data']) : null,
   );
 }
}

class DataModel extends Data
{
 const DataModel({
   required super.id,
   required super.name,
   required super.email,
   required super.phone,
   required super.image,
   required super.points,
   required super.credit,
   required super.token,
 });

 factory DataModel.fromJson(Map<String,dynamic>json)
 {
   return DataModel(
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