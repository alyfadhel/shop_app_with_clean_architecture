import 'package:flutter/cupertino.dart';
import 'package:shop_app_with_clean_architecture/core/network/dio_helper.dart';
import 'package:shop_app_with_clean_architecture/core/network/end-points.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/home/data/models/home_model.dart';

abstract class BaseHomeRemoteDataSource
{
  Future<HomeModel>getBanners(NoParameters parameters);
}

class HomeRemoteDataSource extends BaseHomeRemoteDataSource
{
  final DioHelper dioHelper;

  HomeRemoteDataSource(this.dioHelper);
  @override
  Future<HomeModel> getBanners(NoParameters parameters) async{
    final response = await dioHelper.get(
        endPoint: homeEndPoint,
      Authorization: token,
    );
    return HomeModel.fromJson(response);
  }

}