import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_with_clean_architecture/core/layout/home_layout.dart';
import 'package:shop_app_with_clean_architecture/core/network/end-points.dart';
import 'package:shop_app_with_clean_architecture/core/observer/observer.dart';
import 'package:shop_app_with_clean_architecture/core/resources/theme_manager.dart';
import 'package:shop_app_with_clean_architecture/core/service/service_locator.dart';
import 'package:shop_app_with_clean_architecture/features/categories/presentation/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/controller/cubit/cubit.dart';
import 'package:shop_app_with_clean_architecture/features/home/presentation/controller/cubit/states.dart';
import 'package:shop_app_with_clean_architecture/features/login/presentation/screens/login.dart';
import 'package:shop_app_with_clean_architecture/features/on_boarding/on_boardind_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().init();
  bool? onBoarding = sl<SharedPreferences>().getBool('onBoarding');
  token = sl<SharedPreferences>().getString('token');
  Bloc.observer = MyBlocObserver();

  Widget widget;

  if(onBoarding != null){
    if(token != null){
      widget = const HomeLayout();
    }else{
      widget = const LoginScreen();
    }
  }else{
    widget = const OnBoardingScreen();
  }

  runApp(MyApp(
    startWidget: widget,

  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({super.key,required this.startWidget});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<HomeCubit>()..getBanners(),),
          BlocProvider(create: (context) => sl<CategoriesCubit>()..getCategories(),),
        ],
        child: BlocConsumer<HomeCubit,HomeStates>(
          listener: (context, state) {

          },
          builder: (context, state) {
            return  MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: getApplicationLightTheme(),
              home: startWidget,
            );
          },
        ),
    );
  }
}


