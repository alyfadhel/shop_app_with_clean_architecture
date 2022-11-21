import 'package:equatable/equatable.dart';

class Register extends Equatable
{
  final bool status;
  final String message;
  final RegisterData? data;

 const Register({
  required this.status,
  required this.message,
  required this.data,
 });

  @override
  List<Object?> get props => [
    status,
    message,
    data,
  ];

}

class RegisterData extends Equatable
{
  final String name;
  final String phone;
  final String email;
  final int id;
  final String image;
  final String token;


 const RegisterData(
     {
       required this.name,
       required this.phone,
       required this.email,
       required this.id,
       required this.image,
       required this.token,
     });

  @override
  List<Object?> get props => [
    name,
    phone,
    email,
    id,
    image,
    token,
  ];

}