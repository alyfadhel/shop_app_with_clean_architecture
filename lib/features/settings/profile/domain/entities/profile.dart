import 'package:equatable/equatable.dart';

class Profile extends Equatable
{
  final bool? status;
  final ProfileData? data;


 const Profile({
   required this.status,
   required this.data,
 });

  @override
  List<Object?> get props => [
    status,
    data,
  ];

}

class ProfileData extends Equatable
{
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final int points;
  final int credit;
  final String token;

 const ProfileData(
      {
      required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.image,
      required this.points,
      required this.credit,
      required this.token,
      });

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    phone,
    image,
    points,
    credit,
    token,
  ];

}