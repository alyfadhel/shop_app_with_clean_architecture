import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/entities/banners.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/entities/products.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/usecase/get_banners_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/usecase/get_products_use_cse.dart';
import 'package:shop_app_with_clean_architecture/features/products/presentation/controller/cubit/states.dart';

class BannersCubit extends Cubit<BannersStates>
{
  final GetBannersUseCase getBannersUseCase;
  final GetProductsUseCase getProductsUseCase;
  BannersCubit(
      this.getBannersUseCase,
      this.getProductsUseCase,
      ): super(InitialBannersState());

  static BannersCubit get(context)=> BlocProvider.of(context);

  List<BannersData>bannersData = [];

  void getBanners()async
  {
    emit(GetBannersLoadingState());

    final result = await getBannersUseCase(const NoParameters());

    result.fold(
            (l) => emit(GetBannersErrorState(l.message)),
            (r) {
              bannersData = r;
              emit(GetBannersSuccessState(r));
            } ,
    );
  }

  List<ProductsData>productsData = [];

  void getProducts()async
  {
    emit(GetProductLoadingState());
    final result = await getProductsUseCase(const NoParameters());

    result.fold(
            (l) => emit(GetProductErrorState(l.message)),
            (r) {
              productsData = r;
              emit(GetProductSuccessState(r));
            } );
  }

}