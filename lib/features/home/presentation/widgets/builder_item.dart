import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/core/resources/color_manager.dart';
import 'package:shop_app_with_clean_architecture/core/resources/strings_manager.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/entities/home.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/controller/cubit/state.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/widgets/builder_products.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/screens/categoris.dart';

import '../../../categories/presentation/screens/categories.dart';

class BuilderItem extends StatelessWidget {
  final Home home;
  const BuilderItem({Key? key,required this.home}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                  items: home.data.banners
                      .map((e) => Image(
                    width: double.infinity,
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      e.image,
                    ),
                  ))
                      .toList(),
                  options: CarouselOptions(
                    height: 250,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  )
              ),
              const SizedBox(
                height: AppSize.s30,
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p10),
                child: Text(
                  AppStrings.categories,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(
                      color: ColorManager.sBlack,
                      fontSize: AppSize.s30
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s15,
              ),
              const CategoriesHomeScreen(),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p10),
                child: Text(
                  AppStrings.newProducts,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(
                      color: ColorManager.sBlack,
                      fontSize: AppSize.s30
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1/1.8,
                children: List.generate(home.data.products.length, (index) => BuildProducts(products: home.data.products[index]),
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}