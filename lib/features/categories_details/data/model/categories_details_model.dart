import 'package:shop_app_with_clean_architecture/features/categories_details/domain/entities/categories_details.dart';

class CategoriesDetailsModel extends CategoriesDetails
{
 const CategoriesDetailsModel({
   required super.status,
   required super.data,
 });

}

class DataModel extends Data
{
 const DataModel({
   required super.currentPage,
   required super.data,
 });

 factory DataModel.fromJson(Map<String,dynamic>json)
 {
   List<CategoriesDataDetailsModel>data = [];
   if(json['data']!= null){
     json['data'].forEach((element)
     {
       data.add(CategoriesDataDetailsModel.fromJson(element));
     });
   }
   return DataModel(
       currentPage: json['current_page'],
       data: data,
   );
 }
}

class CategoriesDataDetailsModel extends CategoriesDataDetails
{
 const CategoriesDataDetailsModel({
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

 factory CategoriesDataDetailsModel.fromJson(Map<String,dynamic>json)
 {
   return CategoriesDataDetailsModel(
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