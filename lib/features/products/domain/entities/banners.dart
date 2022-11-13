import 'package:equatable/equatable.dart';

class BannersEntities extends Equatable
{
  final bool status;
  final List<BannersData> data;

 const BannersEntities({
   required this.status,
   required this.data,
 });
  @override
  List<Object?> get props => [
    status,
    data,
  ];

}

class BannersData extends Equatable
{
  final int id;
  final String image;

 const BannersData({
   required this.id,
   required this.image,
 });
  @override
  List<Object?> get props => [
    id,
    image,
  ];

}