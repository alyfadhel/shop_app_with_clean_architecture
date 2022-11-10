import 'package:shop_app_with_clean_architecture/features/home/data/models/home_model.dart';
import 'package:shop_app_with_clean_architecture/features/home/domain/entities/home.dart';

abstract class HomeStates{}

class InitialHomeState extends HomeStates{}

class GetHomeLoadingState extends HomeStates{}

class GetHomeSuccessState extends HomeStates{
  final Home? home;

  GetHomeSuccessState(this.home);
}

class GetHomeErrorState extends HomeStates{
  final String error;

  GetHomeErrorState(this.error);

}

