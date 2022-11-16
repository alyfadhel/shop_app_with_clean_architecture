import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shop_app_with_clean_architecture/features/categories/presentation/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/categories/presentation/cubit/states.dart';
import 'package:shop_app_with_clean_architecture/features/categories/presentation/widgets/categories_item.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/presentation/screens/categories_details.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CategoriesCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Conditional.single(
            context: context,
            conditionBuilder: (context) => state is! GetCategoriesLoadingState,
            widgetBuilder: (context) => ListView.builder(
              itemBuilder: (context, index) =>
                  CategoriesItem(data: cubit.categoriesData[index]),
              itemCount: cubit.categoriesData.length,
            ),
            fallbackBuilder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}


