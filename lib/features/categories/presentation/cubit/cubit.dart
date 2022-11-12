import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/categories/domain/entities/categories.dart';
import 'package:shop_app_with_clean_architecture/features/categories/domain/usecase/base_get_categories_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/categories/presentation/cubit/states.dart';

class CategoriesCubit extends Cubit<CategoriesStates>
{
  final GetCategoriesUseCase getCategoriesUseCase;
  CategoriesCubit(
      this.getCategoriesUseCase,
      ): super(InitialCategoriesState());

  static CategoriesCubit get(context)=>BlocProvider.of(context);

  List<CategoriesData> categoriesData = [];

  void getCategories()async
  {
    emit(GetCategoriesLoadingState());
    final result = await getCategoriesUseCase(const NoParameters());

    result.fold(
            (l) => emit(GetCategoriesErrorState(l.message)),
            (r) {
              categoriesData = r;
              emit(GetCategoriesSuccessState(r));
            } ,
    );
  }

}