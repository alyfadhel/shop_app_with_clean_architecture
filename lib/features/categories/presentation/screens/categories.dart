import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';
import 'package:shop_app_with_clean_architecture/features/categories/domain/entities/categories.dart';
import 'package:shop_app_with_clean_architecture/features/categories/presentation/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/categories/presentation/cubit/states.dart';

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
          body: ListView.builder(
            itemBuilder: (context, index) =>
                CategoriesItem(data: cubit.categoriesData[index]),
            itemCount: cubit.categoriesData.length,
          ),
        );
      },
    );
  }
}

class CategoriesItem extends StatelessWidget {
  final CategoriesData data;

  const CategoriesItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Row(
        children: [
          Container(
            width: AppSize.s100,
            height: AppSize.s100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  '${data.image}',
                ),
              ),
            ),
          ),
          const SizedBox(
            width: AppSize.s20,
          ),
          Text(
            '${data.name}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
