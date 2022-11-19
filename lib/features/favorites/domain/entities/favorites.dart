import 'package:equatable/equatable.dart';

class Favorites extends Equatable
{
  final bool status;
  final Data data;

 const Favorites({
   required this.status,
   required this.data,
 });

  @override
  List<Object?> get props => [
    status,
    data,
  ];

}

class Data extends Equatable
{
  final int currentPage;
  final List<FavoritesData>data;

 const Data({
   required this.currentPage,
   required this.data,
 });

  @override
  List<Object?> get props => [
    currentPage,
    data,
  ];

}

class FavoritesData extends Equatable
{
  final int id;
  final Product product;

 const FavoritesData({
   required this.id,
   required this.product,
 });

  @override
  List<Object?> get props => [
    id,
    product,
  ];

}


class Product extends Equatable
{
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;

 const Product(
      {
      required this.id,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.image,
      required this.name,
      required this.description,
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
  ];
}
