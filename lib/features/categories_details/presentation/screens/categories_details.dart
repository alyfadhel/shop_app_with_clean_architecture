import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';
import 'package:shop_app_with_clean_architecture/core/service/service_locator.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/domain/entities/categories_details.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/presentation/controller/cubit/states.dart';

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

class ShowCategoriesDetails extends StatelessWidget {
  final CategoriesDataDetails model;
  const ShowCategoriesDetails({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSize.s10,
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                width: double.infinity,
                height: AppSize.s200,
                image: NetworkImage(
                  model.image,
                ),
              ),
              if (model.discount != 0)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: const Text(
                    'DISCOUNT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                model.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  height: 1.3,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${model.price.round()}',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  if (model.discount != 0)
                    Text(
                      '${model.oldPrice.round()}',
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  const Spacer(),
                  IconButton(
                    onPressed: ()
                    {
                      // ShopCubit.get(context).changeFavorites(model.id!);
                    },
                    icon:  const CircleAvatar(
                      radius: 15.0,
                      // backgroundColor: ShopCubit.get(context).favorites[model.id] == true ? Colors.blue :  Colors.grey,
                      child: Icon(
                        Icons.favorite_border,
                        size: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );

  }
}
