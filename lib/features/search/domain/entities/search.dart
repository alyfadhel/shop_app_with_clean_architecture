import 'package:equatable/equatable.dart';

class Search extends Equatable
{
  final bool status;
  final Data data;

 const Search({
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
  final List<SearchData>data;

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

class SearchData extends Equatable
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

 const SearchData(
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
  List<Object?> get props => [];

}