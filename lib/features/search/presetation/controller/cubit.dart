import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/features/search/domain/entities/search.dart';
import 'package:shop_app_with_clean_architecture/features/search/domain/repository/base_search_repository.dart';
import 'package:shop_app_with_clean_architecture/features/search/domain/usecase/get_search_use_case.dart';
import 'package:shop_app_with_clean_architecture/features/search/presetation/controller/states.dart';

class SearchCubit extends Cubit<SearchStates>
{
  final GetSearchUseCase getSearchUseCase;
  SearchCubit(
      this.getSearchUseCase,
      ): super(InitialSearchState());

  static SearchCubit get(context)=> BlocProvider.of(context);

  var searchController = TextEditingController();
  List<SearchData>model = [];

  void getSearch(String text)async
  {
    final result = await getSearchUseCase(
      SearchParameters(text: text)
    );
    result.fold(
            (l) => emit(GetSearchErrorState(l.message),
            ),
            (r) {
              model = r;
              emit(GetSearchSuccessState(r));
            },
    );
  }

}