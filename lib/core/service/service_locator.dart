import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_with_clean_architecture/core/network/dio_helper.dart';
import 'package:shop_app_with_clean_architecture/features/home/data/datasource/base_home_remote_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/home/data/repository/home_repository.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/repository/base_home_repository.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/usecase/get_banners_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/login/data/datasource/base_login_remote_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/login/data/repository/login_repository.dart';
import 'package:shop_app_with_clean_architecture/features/login/domain/repository/base_login_repository.dart';
import 'package:shop_app_with_clean_architecture/features/login/domain/usecase/get_login_user_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/login/presentation/controller/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/data/datasource/base_products_details_remote_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/data/repository/products_details_repository.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/domain/repository/base_products_details_repository.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/domain/usecase/get_products_details_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/presentation/controller/cubit/cubit.dart';

final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {

    sl.registerFactory(() => ProductsDetailsCubit(sl()));

    sl.registerLazySingleton(
            () => GetProductsDetailsUseCase(sl()));

    sl.registerLazySingleton<BaseProductsDetailsRepository>(
            () => ProductsDetailsRepository(sl()));

    sl.registerLazySingleton<BaseProductsDetailsRemoteDataSource>(
            () => ProductsDetailsRemoteDataSource(sl()));


    sl.registerFactory(() => LoginCubit(
        sl(),
      ),);

    sl.registerFactory(() => HomeCubit(sl()));


    sl.registerLazySingleton(() => GetBannersUseCase(sl()));

    sl.registerLazySingleton<BaseHomeRepository>(
            () => HomeRepository(sl()));

    sl.registerLazySingleton<BaseHomeRemoteDataSource>(
            () => HomeRemoteDataSource(sl()));

    sl.registerLazySingleton(() => GetUserLoginUseCase(sl()));

    sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl()));

    sl.registerLazySingleton<BaseLoginRemoteDataSource>(
        () => LoginRemoteDataSource(sl()));

    sl.registerLazySingleton<DioHelper>(
      () => DioHelperImpl(),
    );

    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  }
}
