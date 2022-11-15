import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/core/resources/color_manager.dart';
import 'package:shop_app_with_clean_architecture/core/resources/strings_manager.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';
import 'package:shop_app_with_clean_architecture/features/categories/domain/entities/categories.dart';
import 'package:shop_app_with_clean_architecture/features/categories/presentation/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/categories/presentation/cubit/states.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/widgets/show_categories.dart';

class CategoriesHomeScreen extends StatelessWidget {
  const CategoriesHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = CategoriesCubit.get(context);
        return SizedBox(
          height: AppSize.s150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ShowCategoriesScreen(model: cubit.categoriesData[index]),
            itemCount: cubit.categoriesData.length,
          ),
        );
      },

    );
  }
}



