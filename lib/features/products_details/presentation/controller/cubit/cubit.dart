import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/domain/entities/products_details.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/domain/repository/base_products_details_repository.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/domain/usecase/get_products_details.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/presentation/controller/cubit/states.dart';

class ProductsDetailsCubit extends Cubit<ProductsDetailsStates>
{
  final GetProductsDetailsUseCase getProductsDetailsUseCase;
  ProductsDetailsCubit(
      this.getProductsDetailsUseCase,
      ): super(InitialProductsDetailsState());

  static ProductsDetailsCubit get(context)=>BlocProvider.of(context);

  ProductsDetails? productsDetails;

  void getProductsDetails(int id)async
  {
    emit(GetProductsDetailsLoadingState());

    final result = await getProductsDetailsUseCase(ProductsDetailsParameters(id: id));

    result.fold(
            (l) => emit(GetProductsDetailsErrorState(l.message)),
            (r) {
              productsDetails = r;
              emit(GetProductsDetailsSuccessState(r));

            },
    );
  }

}