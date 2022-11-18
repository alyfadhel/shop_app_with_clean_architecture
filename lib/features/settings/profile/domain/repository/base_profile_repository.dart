import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_architecture/core/error/failure.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/domain/entities/profile.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/domain/entities/update_profile.dart';

abstract class BaseProfileRepository
{
  Future<Either<Failure,Profile>>getProfile();
  Future<Either<Failure,UpdateProfile>>getUpdateProfile(UpdateProfileParameters parameters);
}

class UpdateProfileParameters extends Equatable
{
  final String name;
  final String email;
  final String phone;

 const UpdateProfileParameters({
   required this.name,
   required this.email,
   required this.phone,
 });

  @override
  List<Object?> get props => [
    name,
    email,
    phone,
  ];
}