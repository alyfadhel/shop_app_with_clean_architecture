import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/entities/home.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/usecase/base_home_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/controller/cubit/state.dart';

class HomeCubit extends Cubit<HomeStates>
{
  final GetHomeUseCase baseHomeUseCase;
  HomeCubit(
      this.baseHomeUseCase,
      ): super(InitialHomeState());

  static HomeCubit get(context)=>BlocProvider.of(context);

  Home? home;

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
  }

}