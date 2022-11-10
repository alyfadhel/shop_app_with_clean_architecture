import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_clean_architecture/core/layout/cubit/states.dart';
import 'package:shop_app_with_clean_architecture/features/categories/presentation/screens/categories.dart';
import 'package:shop_app_with_clean_architecture/features/favorites/presentation/screens/favorites.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/screens/products.dart';
import 'package:shop_app_with_clean_architecture/features/settings/presentation/screens/settings.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarStates>
{
  BottomNavigationBarCubit(): super(InitialHomeState());

  static BottomNavigationBarCubit get(context)=>BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget>screens = [
    const ProductsScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];

  List<BottomNavigationBarItem>items =
  [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.shopping_cart
        ),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.category
        ),
      label: 'Categories',
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite
        ),
      label: 'Favorites',
    ),
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.settings
        ),
      label: 'Settings',
    ),
  ];

  void changeBottomNav(int index)
  {
    currentIndex = index;
    emit(ChangeBottomNav());
  }

}