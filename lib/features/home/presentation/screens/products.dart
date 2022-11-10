import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/entities/home.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/controller/cubit/states.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeStates>(
      builder: (context, state) {
        return ConditionalBuilder(
            condition: true,
            builder: (context) => builderWidget(HomeCubit.get(context).home!),
            fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

Widget builderWidget(Home model) => Column(
      children: [
        CarouselSlider(
            items: model.data.banners
                .map((e) => Image(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        e.image,
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              height: 400,
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
            ))
      ],
    );
