import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';
import 'package:shop_app_with_clean_architecture/core/service/service_locator.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/domain/entities/products_details.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/presentation/controller/cubit/states.dart';

class ProductsDetailsScreen extends StatelessWidget {
  final int id;
  const ProductsDetailsScreen({Key? key,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> sl<ProductsDetailsCubit>()..getProductsDetails(id),
      child: BlocConsumer<ProductsDetailsCubit,ProductsDetailsStates>(
       listener: (context, state) {

       },
        builder: (context, state) {
         var cubit = ProductsDetailsCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Conditional.single(
                context: context,
                conditionBuilder: (context) =>  cubit.productsDetails != null,
                widgetBuilder: (context) => ShowProductsDetails(productsDetails: cubit.productsDetails!),
                fallbackBuilder: (context) => const Center(child: CircularProgressIndicator(),),
            ),
          );
        },
      ),
    );
  }
}

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
              children: [
                Container(
                  width: double.infinity,
                  height: AppSize.s500,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        productsDetails.data.image,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Text(
                  productsDetails.data.description,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

