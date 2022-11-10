import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/core/usecase/base_usecase.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/entities/home.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/usecase/get_banners_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/controller/cubit/states.dart';

class HomeCubit extends Cubit<HomeStates>
{
  final GetBannersUseCase getBannersUseCase;
  HomeCubit(
      this.getBannersUseCase,
      ): super(InitialHomeState());

  static HomeCubit get(context)=> BlocProvider.of(context);

   Home? home;


  void getBanners()async
  {
    final result = await getBannersUseCase(const NoParameters());
    print('Ali: $result');
    result.fold(
            (l) => emit(GetHomeErrorState(l.message)),
            (r) => emit(GetHomeSuccessState(r)),
    );
  }

}