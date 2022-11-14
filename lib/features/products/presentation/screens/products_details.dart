import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';
import 'package:shop_app_with_clean_architecture/core/service/service_locator.dart';
import 'package:shop_app_with_clean_architecture/features/products/domain/entities/products.dart';
import 'package:shop_app_with_clean_architecture/features/products/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/products/presentation/controller/cubit/states.dart';

class ProductsDetailsScreen extends StatelessWidget {
  final int id;
  const ProductsDetailsScreen({Key? key,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>sl<BannersCubit>()..getProductsDetails(id),
      child: BlocConsumer<BannersCubit,BannersStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = BannersCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Conditional.single(
                context: context,
                conditionBuilder: (context) => cubit.data!=null,
                widgetBuilder: (context) => ListView.builder(
                  itemBuilder: (context, index) => ShowProductsDetails(model: cubit.data!),
                  itemCount: cubit.data!.data.length,
                ),
                fallbackBuilder: (context) => const Center(child: CircularProgressIndicator(),),
            ),
          );
        },
      ),
    );
  }
}

class ShowProductsDetails extends StatelessWidget {
  final Data model;
  const ShowProductsDetails({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BannersCubit,BannersStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: AppSize.s500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        model.data[0].image,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              Text(
                model.data[0].description,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}

