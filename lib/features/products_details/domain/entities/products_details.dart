import 'package:equatable/equatable.dart';

class ProductsDetails extends Equatable
{
  final bool status;
  final ProductsDetailsData data;

 const ProductsDetails({
  required this.status,
  required this.data,
 });

  @override
  List<Object?> get props => [];

}

class ProductsDetailsData extends Equatable
{
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final double discount;
  final String image;
  final String name;
  final String description;
  final bool inFavorites;
  final bool inCart;
  final List<String>images;

 const ProductsDetailsData(
      {
     required this.id,
     required this.price,
     required this.oldPrice,
     required this.discount,
     required this.image,
     required this.name,
     required this.description,
     required this.inFavorites,
     required this.inCart,
     required this.images,
      });

  @override
  List<Object?> get props => [
    id,
    price,
    oldPrice,
    discount,
    image,
    name,
    description,
    inFavorites,
    inCart,
    images,
  ];

}