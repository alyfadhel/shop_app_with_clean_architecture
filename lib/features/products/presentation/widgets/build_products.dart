import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/entities/products.dart';
import 'package:shop_app_with_clean_architecture/features/products/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/products/presentation/controller/cubit/states.dart';

import '../../../../core/resources/values_manager.dart';

class BuildProducts extends StatelessWidget {
  final ProductsData model;
  const BuildProducts({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BannersCubit,BannersStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Column(
          children: [
            InkWell(
              onTap: ()
              {

              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.s10,
                ),
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Image(
                      width: double.infinity,
                      height: 200.0,
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
                          //ShopCubit.get(context).changeFavorites(model.id!);
                        },
                        icon: const CircleAvatar(
                          radius: 15.0,
                          //backgroundColor: ShopCubit.get(context).favorites[model.id] == true ? Colors.blue :  Colors.grey,
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
      },
    );
  }
}
