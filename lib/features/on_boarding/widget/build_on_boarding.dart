import 'package:flutter/material.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';
import 'package:shop_app_with_clean_architecture/features/on_boarding/on_boarding_model.dart';

class BuildOnBoardingScreen extends StatelessWidget {
 final OnboardingModel model;
  const BuildOnBoardingScreen(this.model,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          width: double.infinity,
          height: 400.0,
          fit: BoxFit.cover,
          image: AssetImage(
            model.image,
          ),
        ),
        Text(
          model.body,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          height: AppSize.s30,
        ),
        Text(
          model.title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
