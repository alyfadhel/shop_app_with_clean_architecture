import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shop_app_with_clean_architecture/core/service/service_locator.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/presentation/controller/cubit/states.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/presentation/widgets/show_categories_details.dart';

class CategoriesDetailsScreen extends StatelessWidget {
  final int id;
  const CategoriesDetailsScreen({Key? key,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (BuildContext context)=>sl<CategoriesDetailsCubit>()..getCategoriesDetails(id),
        child: BlocConsumer<CategoriesDetailsCubit,CategoriesDetailsStates>(
          listener: (context, state) {

          },
          builder: (context, state) {
            var cubit = CategoriesDetailsCubit.get(context);
            return Conditional.single(
                context: context,
                conditionBuilder: (context) => state is! GetCategoriesDetailsLoadingState,
                widgetBuilder: (context) => ListView.builder(
                  itemBuilder: (context, index) => ShowCategoriesDetails(model: cubit.model[index]),
                  itemCount: cubit.model.length,
                ),
                fallbackBuilder: (context) => const Center(child: CircularProgressIndicator(),),
            );
          },
        ),
      ),
    );
  }
}


