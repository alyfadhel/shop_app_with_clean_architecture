import 'package:shop_app_with_clean_architecture/core/resources/assets_manager.dart';
import 'package:shop_app_with_clean_architecture/core/resources/strings_manager.dart';

class OnboardingModel
{
  final String image;
  final String title;
  final String body;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

List<OnboardingModel>boarding = [
  OnboardingModel(
      image: ImageAssets.onBoarding,
      title: AppStrings.title1,
      body: AppStrings.body1,
  ),
  OnboardingModel(
      image: ImageAssets.onBoarding,
      title: AppStrings.title2,
      body: AppStrings.body2,
  ),
  OnboardingModel(
      image: ImageAssets.onBoarding,
      title: AppStrings.title3,
      body: AppStrings.body3,
  ),
];