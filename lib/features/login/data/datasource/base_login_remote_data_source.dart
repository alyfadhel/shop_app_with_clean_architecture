import 'package:shop_app_with_clean_architecture/core/network/dio_helper.dart';
import 'package:shop_app_with_clean_architecture/core/network/end-points.dart';
import 'package:shop_app_with_clean_architecture/features/login/data/model/login_model.dart';
import 'package:shop_app_with_clean_architecture/features/login/domain/repository/base_login_repository.dart';

abstract class BaseLoginRemoteDataSource {
  Future<LoginModel> getLoginUser(LoginDetailsParameters parameters);
}

class LoginRemoteDataSource extends BaseLoginRemoteDataSource {
  final DioHelper dioHelper;

  LoginRemoteDataSource(this.dioHelper);

  @override
  Future<LoginModel> getLoginUser(LoginDetailsParameters parameters) async {
    final response = await dioHelper.post(
      endPoint: loginEndPoint,
      data: {
        'email': parameters.email,
        'password': parameters.password,
      },
    );

    return LoginModel.fromJson(response);
  }
}
