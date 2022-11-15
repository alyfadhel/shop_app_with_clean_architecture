import 'package:equatable/equatable.dart';

class CategoriesDetails extends Equatable
{
  final bool status;
  final Data data;

 const CategoriesDetails({
   required this.status,
   required this.data,
 });

  @override
  List<Object?> get props => [];

}

class Data extends Equatable
{
  final int currentPage;
  final List<CategoriesData> data;

 const Data({
   required this.currentPage,
   required this.data,
 });

  @override
  List<Object?> get props => [];

}

class CategoriesData extends Equatable
{
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String description;
  final bool inFavorites;
  final bool inCart;


 const CategoriesData(
     {
      required this.id,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.image,
      required this.description,
      required this.inFavorites,
      required this.inCart,
     });

  @override
  List<Object?> get props => [];

}