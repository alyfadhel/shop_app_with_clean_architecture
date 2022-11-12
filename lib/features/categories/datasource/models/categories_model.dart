import 'package:shop_app_with_clean_architecture/features/categories/domain/entities/categories.dart';

class CategoriesModel extends Categories
{
 const CategoriesModel({
   required super.status,
   required super.data,
 });
 factory CategoriesModel.fromJson(Map<String,dynamic>json)
 {
   return CategoriesModel(
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
    required super.firstPageUrl,
    required super.from,
    required super.lastPage,
    required super.lastPageUrl,
    required super.nextPageUrl,
    required super.path,
    required super.perPage,
    required super.prevPageUrl,
    required super.to,
    required super.total,
  });
 factory DataModel.fromJson(Map<String,dynamic>json)
 {
   List<CategoriesDataModel>data = [];
   if(json['data']!=null){
     json['data'].forEach((element)
     {
       data.add(CategoriesDataModel.fromJson(element));
     });
   }
   return DataModel(
       currentPage: json['current_page'],
       data: data,
       firstPageUrl: json['first_page_url'],
       from: json['from'],
       lastPage: json['last_page'],
       lastPageUrl: json['last_page_url'],
       nextPageUrl: json['next_page_url'],
       path: json['path'],
       perPage: json['per_page'],
       prevPageUrl: json['prev_page_url'],
       to: json['to'],
       total: json['total'],
   );
 }

}

class CategoriesDataModel extends CategoriesData
{
 const CategoriesDataModel({
   required super.id,
   required super.name,
   required super.image,
 });

 factory CategoriesDataModel.fromJson(Map<String,dynamic>json)
 {
   return CategoriesDataModel(
       id: json['id'],
       name: json['name'],
       image: json['image'],
   );
 }

}