import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shop_app_with_clean_architecture/features/products/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/products/presentation/controller/cubit/states.dart';
import 'package:shop_app_with_clean_architecture/features/products/presentation/widgets/builder_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BannersCubit,BannersStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = BannersCubit.get(context);
        return Conditional.single(
          context: context,
          conditionBuilder: (context) => state is! GetProductLoadingState,
          widgetBuilder: (context) => const BuilderWidget(),
          fallbackBuilder: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
