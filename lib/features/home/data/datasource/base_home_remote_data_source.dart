import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_with_clean_architecture/core/network/dio_helper.dart';
import 'package:shop_app_with_clean_architecture/core/network/end-points.dart';
import 'package:shop_app_with_clean_architecture/core/service/service_locator.dart';
import 'package:shop_app_with_clean_architecture/features/home/data/model/home_model.dart';

abstract class BaseHomeRemoteDataSource
{
  Future<HomeModel>getHome();
}

class HomeRemoteDataSource extends BaseHomeRemoteDataSource
{
  final DioHelper dioHelper;

  HomeRemoteDataSource(this.dioHelper);
  @override
  Future<HomeModel> getHome() async{
    final response = await dioHelper.get(
        endPoint: homeEndPoint,
        Authorization: token,
    );
    return HomeModel.fromJson(response);
  }

}