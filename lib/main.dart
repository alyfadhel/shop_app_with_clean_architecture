import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_with_clean_architecture/core/layout/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/core/layout/cubit/states.dart';
import 'package:shop_app_with_clean_architecture/core/layout/home_layout.dart';
import 'package:shop_app_with_clean_architecture/core/network/end-points.dart';
import 'package:shop_app_with_clean_architecture/core/observer/observer.dart';
import 'package:shop_app_with_clean_architecture/core/resources/theme_manager.dart';
import 'package:shop_app_with_clean_architecture/core/service/service_locator.dart';
import 'package:shop_app_with_clean_architecture/features/categories/presentation/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/login/presentation/screens/login.dart';
import 'package:shop_app_with_clean_architecture/features/on_boarding/on_boardind_screen.dart';
import 'package:shop_app_with_clean_architecture/features/theme/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/theme/cubit/states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().init();
  bool? onBoarding = sl<SharedPreferences>().getBool('onBoarding');
  bool? isDark = sl<SharedPreferences>().getBool('isDark');
  token = sl<SharedPreferences>().getString('token');
  Bloc.observer = MyBlocObserver();

  Widget widget;

  if (onBoarding != null) {
    if (token != null) {
      widget = const HomeLayout();
    } else {
      widget = const LoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }

  runApp(MyApp(
    startWidget: widget,
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  final bool? isDark;

  const MyApp({super.key, required this.startWidget, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<HomeCubit>()
            ..getHome()
            ..getFavorites(),
        ),
        BlocProvider(
          create: (context) => sl<CategoriesCubit>()..getCategories(),
        ),
        BlocProvider(
          create: (context) => sl<ThemeModeCubit>()
            ..changeThemeMode(
              fromShared: isDark,
            ),
        ),
      ],
      child: BlocConsumer<ThemeModeCubit,ThemeModeStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: getApplicationLightTheme(),
            darkTheme: getApplicationDarkTheme(),
            themeMode: ThemeModeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}
