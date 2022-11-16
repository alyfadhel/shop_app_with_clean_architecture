import 'package:shop_app_with_clean_architecture/core/network/dio_helper.dart';
import 'package:shop_app_with_clean_architecture/features/register/data/model/register_model.dart';
import 'package:shop_app_with_clean_architecture/features/register/domain/repository/base_register_repository.dart';

import '../../../../core/network/end-points.dart';

abstract class BaseRegisterRemoteDataSource {
  Future<RegisterModel> getRegisterUser(RegisterParameters parameters);
}

class RegisterRemoteDataSource extends BaseRegisterRemoteDataSource {
  final DioHelper dioHelper;

  RegisterRemoteDataSource(this.dioHelper);

  @override
  Future<RegisterModel> getRegisterUser(RegisterParameters parameters) async {
    final response = await dioHelper.post(endPoint: registerEndPoint, data: {
      'name': parameters.name,
      'email': parameters.email,
      'phone': parameters.phone,
      'password': parameters.password,
    });
    return RegisterModel.fromJson(response);
  }
}
