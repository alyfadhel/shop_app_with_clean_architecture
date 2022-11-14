import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/domain/entities/products_details.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/presentation/controller/cubit/states.dart';

class ShowProductsDetails extends StatelessWidget {
  final ProductsDetails productsDetails;
  const ShowProductsDetails({Key? key,required this.productsDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsDetailsCubit,ProductsDetailsStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Column(
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
                        height: AppSize.s500,
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          productsDetails.data.image,
                        ),
                      ),
                      if (productsDetails.data.discount != 0)
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
                        productsDetails.data.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          height: 1.3,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${productsDetails.data.price.round()}',
                            style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          if (productsDetails.data.discount != 0)
                            Text(
                              '${productsDetails.data.oldPrice.round()}',
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),

                        ],
                      ),
                      const SizedBox(
                        height: AppSize.s40,
                      ),
                      Text(
                        productsDetails.data.description,
                        style: Theme.of(context).textTheme.titleMedium,
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