import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_with_clean_architecture/core/network/dio_helper.dart';
import 'package:shop_app_with_clean_architecture/features/categories/datasource/datasource/base_categories_remote_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/categories/datasource/repository/categories_repository.dart';
import 'package:shop_app_with_clean_architecture/features/categories/domain/repository/base_categories_repository.dart';
import 'package:shop_app_with_clean_architecture/features/categories/domain/usecase/base_get_categories_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/categories/presentation/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/login/data/datasource/base_login_remote_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/login/data/repository/login_repository.dart';
import 'package:shop_app_with_clean_architecture/features/login/domain/repository/base_login_repository.dart';
import 'package:shop_app_with_clean_architecture/features/login/domain/usecase/get_login_user_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/login/presentation/controller/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/products/data/datasource/base_banners_remote_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/products/data/repository/banners_repository.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/repository/base_banners_repository.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/usecase/get_banners_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/usecase/get_products_details_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/usecase/get_products_use_cse.dart';
import 'package:shop_app_with_clean_architecture/features/products/presentation/controller/cubit/cubit.dart';



final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {



    sl.registerFactory(() => CategoriesCubit(sl()));

    sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));

    sl.registerLazySingleton<BaseCategoriesRemoteDataSource>(
            () => CategoriesRemoteDataSource(sl()));

    sl.registerLazySingleton<BaseCategoriesRepository>(
            () => CategoriesRepository(sl()));
///////////////////////////////////////////////////////////////////

    sl.registerFactory(() => BannersCubit(sl(),sl(),sl()));

    sl.registerLazySingleton(() => GetProductsDetailsUseCase(sl()));

    sl.registerLazySingleton(() => GetProductsUseCase(sl()));

    sl.registerLazySingleton(() => GetBannersUseCase(sl()));

    sl.registerLazySingleton<BaseBannersRepository>(
            () => BannersRepository(sl()));

    sl.registerLazySingleton<BaseBannersRemoteDataSource>(
            () => BannersRemoteDataSource(sl()));
///////////////////////////////////////////////////////////////////
    sl.registerFactory(() => LoginCubit(sl(),));

    sl.registerLazySingleton(() => GetUserLoginUseCase(sl()));

    sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl()));

    sl.registerLazySingleton<BaseLoginRemoteDataSource>(
        () => LoginRemoteDataSource(sl()));
///////////////////////////////////////////////////////////////////

    sl.registerLazySingleton<DioHelper>(
      () => DioHelperImpl(),
    );

    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  }
}
