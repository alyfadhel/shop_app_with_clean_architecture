import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_with_clean_architecture/core/network/dio_helper.dart';
import 'package:shop_app_with_clean_architecture/features/categories/datasource/datasource/base_categories_remote_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/categories/datasource/repository/categories_repository.dart';
import 'package:shop_app_with_clean_architecture/features/categories/domain/repository/base_categories_repository.dart';
import 'package:shop_app_with_clean_architecture/features/categories/domain/usecase/base_get_categories_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/categories/presentation/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/data/datasource/base_categories_details_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/data/repository/categories_details_repository.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/domain/repository/base_categories_details_repository.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/domain/usecase/get_categories_details_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/home/data/datasource/base_home_remote_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/home/data/repository/home_repository.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/repository/base_home_repository.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/usecase/base_home_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/login/data/datasource/base_login_remote_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/login/data/repository/login_repository.dart';
import 'package:shop_app_with_clean_architecture/features/login/domain/repository/base_login_repository.dart';
import 'package:shop_app_with_clean_architecture/features/login/domain/usecase/get_login_user_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/login/presentation/controller/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/data/datasource/base_products_details_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/data/repository/products_details_repository.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/domain/repository/base_products_details_repository.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/domain/usecase/get_products_details.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/register/data/datasource/base_register_remote_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/register/data/repository/register_repository.dart';
import 'package:shop_app_with_clean_architecture/features/register/domain/repository/base_register_repository.dart';
import 'package:shop_app_with_clean_architecture/features/register/domain/usecase/get_register_user_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/register/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/data/datasource/base_profile_remote_data_source.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/data/repository/profile_repository.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/domain/repository/base_profile_repository.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/domain/usecase/get_profile_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/domain/usecase/get_update_profile_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/settings/profile/presentation/controller/cubit/cubit.dart';



final sl = GetIt.instance;

class ServiceLocator {
  Future<void> init() async {

    sl.registerFactory(() => CategoriesDetailsCubit(sl()));

    sl.registerLazySingleton(() => GetCategoriesDetailsUseCase(sl()));

    sl.registerLazySingleton<BaseCategoriesDetailsRepository>(
            () => CategoriesDetailsRepository(sl()));

    sl.registerLazySingleton<BaseCategoriesDetailsRemoteDataSource>(
            () => CategoriesDetailsRemoteDataSource(sl()));

//////////////////////////////////////////////////////////////////////
    sl.registerFactory(() => CategoriesCubit(sl()));

    sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));

    sl.registerLazySingleton<BaseCategoriesRemoteDataSource>(
            () => CategoriesRemoteDataSource(sl()));

    sl.registerLazySingleton<BaseCategoriesRepository>(
            () => CategoriesRepository(sl()));
///////////////////////////////////////////////////////////////////

    sl.registerFactory(() => ProductsDetailsCubit(sl()));

    sl.registerLazySingleton(() => GetProductsDetailsUseCase(sl()));

    sl.registerLazySingleton<BaseProductsDetailsRepository>(
            () => ProductsDetailsRepository(sl()));

    sl.registerLazySingleton<BaseProductsDetailsRemoteDataSource>(
            () => ProductsDetailsRemoteDataSource(sl()));
////////////////////////////////////////////////////////////////////
    sl.registerFactory(() => HomeCubit(sl()));

    sl.registerLazySingleton(() => GetHomeUseCase(sl()));

    sl.registerLazySingleton<BaseHomeRepository>(
            () => HomeRepository(sl()));

    sl.registerLazySingleton<BaseHomeRemoteDataSource>(
            () => HomeRemoteDataSource(sl()));

///////////////////////////////////////////////////////////////////
    sl.registerFactory(() => LoginCubit(sl(),));

    sl.registerLazySingleton(() => GetUserLoginUseCase(sl()));

    sl.registerLazySingleton<BaseLoginRepository>(() => LoginRepository(sl()));

    sl.registerLazySingleton<BaseLoginRemoteDataSource>(
        () => LoginRemoteDataSource(sl()));
 //////////////////////////////////////////////////////////////////
    sl.registerFactory(() => RegisterCubit(sl()));

    sl.registerLazySingleton(() => GetRegisterUserUseCase(sl()));

    sl.registerLazySingleton<BaseRegisterRepository>(
            () => RegisterRepository(sl()));

    sl.registerLazySingleton<BaseRegisterRemoteDataSource>(
            () => RegisterRemoteDataSource(sl()));
///////////////////////////////////////////////////////////////////

    sl.registerFactory(() => ProfileCubit(sl(),sl()));

    sl.registerFactory(() => GetUpdateProfileUseCase(sl()));

    sl.registerLazySingleton(() => GetProfileUseCase(sl()));

    sl.registerLazySingleton<BaseProfileRepository>(
            () => ProfileRepository(sl()));

    sl.registerLazySingleton<BaseProfileRemoteDataSource>(
            () => ProfileRemoteDataSource(sl()));
////////////////////////////////////////////////////////////////////

    sl.registerLazySingleton<DioHelper>(
      () => DioHelperImpl(),
    );

    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  }
}
