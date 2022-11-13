import 'package:shop_app_with_clean_architecture/features/products/domain/entities/products.dart';

class ProductsEntitiesModel extends ProductsEntities
{
 const ProductsEntitiesModel({
   required super.status,
   required super.data,
 });

 factory ProductsEntitiesModel.fromJson(Map<String,dynamic>json)
 {
   return ProductsEntitiesModel(
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
    List<ProductsDataModel>data = [];
    if(json['data']!= null){
      json['data'].forEach((element)
      {
        data.add(ProductsDataModel.fromJson(element));
      });
    }
    return DataModel(
        currentPage: json['current_page'],
        data: data,
    );
  }

}

class ProductsDataModel extends ProductsData
{
 const ProductsDataModel({
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

 factory ProductsDataModel.fromJson(Map<String,dynamic>json)
 {
   return ProductsDataModel(
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