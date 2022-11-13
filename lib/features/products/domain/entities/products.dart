import 'package:equatable/equatable.dart';
import 'package:shop_app_with_clean_architecture/features/categories/domain/entities/categories.dart';

class ProductsEntities extends Equatable
{
  final bool status;
  final Data data;


 const ProductsEntities({
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
  final List<ProductsData>data;

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

class ProductsData extends Equatable
{
  final int id;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;
  final bool inFavorites;
  final bool inCart;

 const ProductsData(
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