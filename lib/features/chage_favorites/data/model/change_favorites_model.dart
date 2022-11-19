import 'package:shop_app_with_clean_architecture/features/chage_favorites/domain/entities/change_favorites.dart';

class ChangeFavoritesModel extends ChangeFavorites
{
 const ChangeFavoritesModel({
   required super.status,
   required super.message,
 });
 factory ChangeFavoritesModel.fromJson(Map<String,dynamic>json)
 {
   return ChangeFavoritesModel(
       status: json['status'],
       message: json['message'],
   );
 }

}