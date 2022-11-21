import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/core/layout/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/core/layout/cubit/states.dart';
import 'package:shop_app_with_clean_architecture/core/resources/strings_manager.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';
import 'package:shop_app_with_clean_architecture/features/search/presetation/screens/search.dart';
import 'package:shop_app_with_clean_architecture/features/theme/cubit/cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BottomNavigationBarCubit(),
      child: BlocConsumer<BottomNavigationBarCubit, BottomNavigationBarStates>(
        listener: (BuildContext context, state) {},
        builder: (context, state) {
          var cubit = BottomNavigationBarCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              titleSpacing: AppSize.s20,
              title: Text(
                AppStrings.shopApp,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ThemeModeCubit.get(context).changeThemeMode();
                  },
                  icon: const Icon(Icons.brightness_4_outlined),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (int index) {
                cubit.changeBottomNav(index);
              },
              currentIndex: cubit.currentIndex,
              items: cubit.items,
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
