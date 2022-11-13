import 'package:flutter/material.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/entities/banners.dart';

class BannersModel extends BannersEntities
{
 const BannersModel({
   required super.status,
   required super.data,
 });

 factory BannersModel.fromJson(Map<String,dynamic>json)
 {
   List<BannersDataModel>data = [];
   if(json['data']!=null){
     json['data'].forEach((element)
     {
       data.add(BannersDataModel.fromJson(element));
     });
   }
   return BannersModel(
       status: json['status'],
       data: data,
   );
 }

}



class BannersDataModel extends BannersData
{
 const BannersDataModel({
   required super.id,
   required super.image,
 });
 factory BannersDataModel.fromJson(Map<String,dynamic>json)
 {
   return BannersDataModel(
       id: json['id'],
       image: json['image'],
   );
 }

}