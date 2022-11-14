import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class Home extends Equatable
{
  final bool status;
  final HomeData data;


 const Home({
   required this.status,
   required this.data,
 });

  @override
  List<Object?> get props => [
    status,
    data,
  ];
}

class HomeData extends Equatable
{
  final List<Banners>banners;
  final List<Products>products;

  const HomeData({
    required this.banners,
    required this.products,
  });

  @override
  List<Object?> get props => [
    banners,
    products,
  ];
}

class Banners extends Equatable
{
  final int id;
  final String image;

 const Banners({
 required  this.id,
 required  this.image,
 });

  @override
  List<Object?> get props => [
    id,
    image,
  ];
}

class Products extends Equatable{
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;
  final bool inFavorites;
  final bool inCart;

 const Products(
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
  ];
}