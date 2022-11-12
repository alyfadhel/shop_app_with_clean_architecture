import 'package:equatable/equatable.dart';

class Categories extends Equatable
{
  final bool status;
  final Data data;

 const Categories({
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
  final List<CategoriesData>data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

 const Data(
      {
      required this.currentPage,
      required this.data,
      required this.firstPageUrl,
      required this.from,
      required this.lastPage,
      required this.lastPageUrl,
      required this.nextPageUrl,
      required this.path,
      required this.perPage,
      required this.prevPageUrl,
      required this.to,
      required this.total,
      });

  @override
  List<Object?> get props => [
    currentPage,
    data,
    firstPageUrl,
    from,
    lastPageUrl,
    nextPageUrl,
    path,
    perPage,
    prevPageUrl,
    to,
    total,
  ];

}

class CategoriesData extends Equatable
{
  final int? id;
  final String? name;
  final String? image;

 const CategoriesData({
    required this.id,
    required this.name,
    required this.image,
 });

  @override
  List<Object?> get props => [
    id,
    name,
    image,
  ];

}