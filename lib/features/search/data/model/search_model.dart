import 'dart:convert';

import 'package:shop_app_with_clean_architecture/features/search/domain/entities/search.dart';

class SearchModel extends Search
{
 const SearchModel({
   required super.status,
   required super.data,
 });
 factory SearchModel.fromJson(Map<String,dynamic>json){
   return SearchModel(
   status: json['status'],
   data: DataModel.fromJson(json['data']),
   );
 }
  
}

class DataModel extends Data
{
 const DataModel({
   required super.currentPage,
   required super.data,
 });

factory DataModel.fromJson(Map<String,dynamic>json)
 {
   List<SearchDataModel> data= [];
   if(json['data']!=null){
     json['data'].forEach((element)
     {
       SearchDataModel.fromJson(element);
     });
   }
   return DataModel(
       currentPage: json['current_page'],
     data: data,
   );
 }

}

class SearchDataModel extends SearchData
{
 const SearchDataModel({
   required super.id,
   required super.price,
   required super.oldPrice,
   required super.discount,
   required super.image,
   required super.name,
   required super.description,
   required super.inFavorites,
   required super.inCart,
 });

 factory SearchDataModel.fromJson(Map<String,dynamic>json)
 {
   return SearchDataModel(
       id: json['id'],
       price: json['price'],
       oldPrice: json['old_price'],
       discount: json['discount'],
       image: json['image'],
       name: json['name'],
       description: json['description'],
       inFavorites: json['in_favorites'],
       inCart: json['in_cart'],
   );
 }

}