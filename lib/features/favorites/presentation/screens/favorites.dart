import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/features/favorites/domain/entities/favorites.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/entities/home.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/controller/cubit/state.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return ListView.builder(
            itemBuilder: (context, index) => FavoritesDetails(model: cubit.favoritesData[index]),
          itemCount: cubit.favoritesData.length,
        );
      },
    );
  }
}

class FavoritesDetails extends StatelessWidget {
  final FavoritesData model;
  const FavoritesDetails({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: 120.0,
            child: Row(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Image(
                      width: 120.0,
                      height: 120.0,
                      image: NetworkImage(
                        model.product.image,
                      ),
                    ),
                    if (model.product.discount != 0)
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
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        model.product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          height: 1.3,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            model.product.price.round().toString(),
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          if (model.product.discount != 0)
                            Text(
                              model.product.oldPrice.toString(),
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              cubit.changeFavorites(model.product.id);
                            },
                            icon: CircleAvatar(
                              radius: 15.0,
                              backgroundColor:
                              cubit.favorites[model.product.id] ==
                                  true
                                  ? Colors.blue
                                  : Colors.grey,
                              child: const Icon(
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
            ),
          ),
        );
      },
    );
  }
}

