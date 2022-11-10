import 'package:shop_app_with_clean_architecture/features/home/domain/entities/home.dart';

class HomeModel extends Home
{
  const HomeModel({
    required super.status,
    required super.data,
  });
  factory HomeModel.fromJson(Map<String,dynamic>json)
  {
    return HomeModel(
        status: json['status'],
        data: HomeDataModel.fromJson(json['data']),
    );
  }

}


class HomeDataModel extends HomeData
{
 const HomeDataModel({
   required super.banners,
   required super.products,
 });

 factory HomeDataModel.fromJson(Map<String,dynamic>json)
 {
   List<BannersModel>banners = [];
   if(json['banners']!=null){
     json['banners'].forEach((element)
     {
       banners.add(BannersModel.fromJson(element));
     });
   }

   List<ProductsModel>products = [];
   if(json['products']!=null){
     json['products'].forEach((element)
     {
       products.add(ProductsModel.fromJson(element));
     });
   }
   return HomeDataModel(
       banners: banners,
       products: products,
   );
 }
}


class BannersModel extends Banners
{
 const BannersModel({
   required super.id,
   required super.image,
 });
 factory BannersModel.fromJson(Map<String,dynamic>json)
 {
   return BannersModel(
       id: json['id'],
       image: json['image'],
   );
 }

}

class ProductsModel extends Products
{
 const ProductsModel({
   required super.id,
   required super.price,
   required super.oldPrice,
   required super.discount,
   required super.image,
   required super.name,
   required super.description,
   required super.images,
   required super.inFavorites,
   required super.inCart,
 });

 factory ProductsModel.fromJson(Map<String,dynamic>json)
 {
   return ProductsModel(
       id: json['id'],
       price: json['price'],
       oldPrice: json['old_price'],
       discount: json['discount'],
       image: json['image'],
       name: json['name'],
       description: json['description'],
       images: json['images'].cast<String>(),
       inFavorites: json['in_favorites'],
       inCart: json['in_cart'],
   );
 }

}
