import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';
import 'package:shop_app_with_clean_architecture/core/widgets/toast_state.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/entities/home.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/controller/cubit/state.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/widgets/builder_item.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {
        print('eggggggs: ${state}');
        if(state is GetChangeFavoritesSuccessState){
          if(!state.model.status){
            showToast(
                text: state.model.message,
                state: ToastState.error,
            );
          }
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Conditional.single(
            context: context,
            conditionBuilder: (context) => cubit.home!=null,
            widgetBuilder: (context) => BuilderItem(home: cubit.home!),
            fallbackBuilder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
        );
      },
    );
  }
}






