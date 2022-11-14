import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';
import 'package:shop_app_with_clean_architecture/core/service/service_locator.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/domain/entities/products_details.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/presentation/controller/cubit/states.dart';
import 'package:shop_app_with_clean_architecture/features/products_details/presentation/widgets/show_products_details.dart';

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




