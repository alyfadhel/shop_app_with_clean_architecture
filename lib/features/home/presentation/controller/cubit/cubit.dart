import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/chage_favorites/domain/entities/change_favorites.dart';
import 'package:shop_app_with_clean_architecture/features/chage_favorites/domain/repository/base_change_favorites_repository.dart';
import 'package:shop_app_with_clean_architecture/features/chage_favorites/domain/usecase/get_change_favorites.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/entities/home.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/usecase/base_home_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/controller/cubit/state.dart';

class HomeCubit extends Cubit<HomeStates>
{
  final GetHomeUseCase baseHomeUseCase;
  final GetChangeFavoritesUseCase getChangeFavoritesUseCase;
  HomeCubit(
      this.baseHomeUseCase,
      this.getChangeFavoritesUseCase,
      ): super(InitialHomeState());

  static HomeCubit get(context)=>BlocProvider.of(context);

  Home? home;
  Map<int, bool> favorites = {};

  void getHome()async
  {
    emit(GetHomeLoadingState());
    final result = await baseHomeUseCase(const NoParameters());

    result.fold(
            (l) => emit(GetHomeErrorState(l.message)),
            (r) {
              home = r;
              emit(GetHomeSuccessState(r));
            } ,
    );
    home!.data.products.forEach((element) {
      favorites.addAll({
        element.id : element.inFavorites,
      });
    });
  }

  ChangeFavorites? model;

  void changeFavorites(int productId)async
  {
    favorites[productId] = !favorites[productId]!;
    emit(ChangeFavoritesState());
    final result = await getChangeFavoritesUseCase(ChangeFavoritesParameters(productId: productId));
   result.fold(
           (l) {
             favorites[productId] = !favorites[productId]!;
             emit(GetChangeFavoritesErrorState(l.message));
           },
           (r) {
             model = r;
             if(!model!.status){
               favorites[productId] = !favorites[productId]!;
               emit(GetChangeFavoritesSuccessState(r));
             }

           },
   );

  }

}