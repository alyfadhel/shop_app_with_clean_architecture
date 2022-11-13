import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/features/products/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/products/presentation/controller/cubit/states.dart';
import 'package:shop_app_with_clean_architecture/features/products/presentation/widgets/build_products.dart';

class BuilderWidget extends StatelessWidget {
  const BuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BannersCubit,BannersStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = BannersCubit.get(context);
        return SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                  items: cubit.bannersData
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
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1/1.8,
                children: List.generate(cubit.productsData.length, (index) =>  BuildProducts(model: cubit.productsData[index],)),
              ),
            ],
          ),
        );
      },
    );
  }
}
