import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/core/layout/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/core/layout/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeStates>(
        listener: (BuildContext context, state) {

        },
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
                onTap: (int index)
                {
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
