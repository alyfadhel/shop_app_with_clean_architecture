import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';
import 'package:shop_app_with_clean_architecture/core/service/service_locator.dart';
import 'package:shop_app_with_clean_architecture/core/widgets/my_form_field.dart';
import 'package:shop_app_with_clean_architecture/features/search/presetation/controller/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/search/presetation/controller/states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => sl<SearchCubit>(),
        child: BlocConsumer<SearchCubit,SearchStates>(
          listener: (context, state) {

          },
          builder: (context, state) {
            var cubit = SearchCubit.get(context);
            return Padding(
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
