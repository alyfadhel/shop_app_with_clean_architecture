import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';
import 'package:shop_app_with_clean_architecture/core/service/service_locator.dart';
import 'package:shop_app_with_clean_architecture/core/widgets/my_form_field.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/widgets/builder_products.dart';
import 'package:shop_app_with_clean_architecture/features/search/domain/entities/search.dart';
import 'package:shop_app_with_clean_architecture/features/search/presetation/controller/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/search/presetation/controller/states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => sl<SearchCubit>(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = SearchCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Column(
                children: [
                  MyFormField(
                    controller: cubit.searchController,
                    type: TextInputType.text,
                    label: 'search',
                    prefix: Icons.search,
                    validator: (value)
                    {
                      if(value!.isEmpty){
                        return 'Please Enter Your Text';
                      }
                      return null;
                    },
                    onChanged: (String text)
                    {
                      cubit.getSearch(text);
                    },
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  Expanded(
                    child: Conditional.single(
                      context: context,
                      conditionBuilder: (context) => state is! GetSearchLoadingState,
                      widgetBuilder: (context) => ListView.builder(
                        itemBuilder: (context, index) => SearchList(model: cubit.model[index],isDiscount: false,),
                        itemCount: cubit.model.length,
                      ),
                      fallbackBuilder: (context) => const Center(child: CircularProgressIndicator(),),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SearchList extends StatelessWidget {
  final SearchData model;
  final bool isDiscount;
  const SearchList({Key? key,required this.model, this.isDiscount = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                height: AppSize.s200,
                image: NetworkImage(
                  model.image,
                ),
              ),
              if (model.discount != 0 && isDiscount)
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
                    '${model.price}',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  if (model.discount != 0 && isDiscount)
                    Text(
                      '${model.oldPrice}',
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
                      // ShopCubit.get(context).changeFavorites(model.id!);
                    },
                    icon:  const CircleAvatar(
                      radius: 15.0,
                      // backgroundColor: ShopCubit.get(context).favorites[model.id] == true ? Colors.blue :  Colors.grey,
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
  }
}
