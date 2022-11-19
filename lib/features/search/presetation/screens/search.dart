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
import 'package:shop_app_with_clean_architecture/features/search/presetation/widgets/search_list.dart';

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


