import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/domain/entities/categories_details.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/domain/repository/base_categories_details_repository.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/domain/usecase/get_categories_details_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/presentation/controller/cubit/states.dart';

class CategoriesDetailsCubit extends Cubit<CategoriesDetailsStates>
{
  final GetCategoriesDetailsUseCase getCategoriesDetailsUseCase;
  CategoriesDetailsCubit(
      this.getCategoriesDetailsUseCase,
      ): super(InitialCategoriesDetailsState());

 static CategoriesDetailsCubit get(context)=>BlocProvider.of(context);

  List<CategoriesDataDetails>model = [];

  void getCategoriesDetails(int categoriesId)async
  {
    emit(GetCategoriesDetailsLoadingState());
    final result = await getCategoriesDetailsUseCase(
        CategoriesDetailsParameters(id: categoriesId));

    result.fold(
            (l) => emit(GetCategoriesDetailsErrorState(l.message)),
            (r) {
              model = r;
              emit(GetCategoriesDetailsSuccessState(r));
            },);
  }

}