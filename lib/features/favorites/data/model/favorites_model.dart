import 'package:shop_app_with_clean_architecture/features/favorites/domain/entities/favorites.dart';

class FavoritesModel extends Favorites
{
 const FavoritesModel({
   required super.status,
   required super.data,
 });

 factory FavoritesModel.fromJson(Map<String,dynamic>json)
 {
   return FavoritesModel(
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
   List<FavoritesDataModel>data = [];
   if(json['data']!=null){
     json['data'].forEach((element)
     {
       data.add(FavoritesDataModel.fromJson(element));
     });
   }
   return DataModel(
       currentPage: json['current_page'],
       data: data,
   );
 }

}


class FavoritesDataModel extends FavoritesData
{
 const FavoritesDataModel({required super.id, required super.product});

 factory FavoritesDataModel.fromJson(Map<String,dynamic>json)
 {
   return FavoritesDataModel(
       id: json['id'],
       product: ProductModel.fromJson(json['product']),
   );
 }

}

class ProductModel extends Product
{
 const ProductModel({
   required super.id,
   required super.price,
   required super.oldPrice,
   required super.discount,
   required super.image,
   required super.name,
   required super.description,
 });

 factory ProductModel.fromJson(Map<String,dynamic>json)
 {
   return ProductModel(
       id: json['id'],
       price: json['price'],
       oldPrice: json['old_price'],
       discount: json['discount'],
       image: json['image'],
       name: json['name'],
       description: json['description'],
   );
 }

}