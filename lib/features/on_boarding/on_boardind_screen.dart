import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_with_clean_architecture/core/resources/color_manager.dart';
import 'package:shop_app_with_clean_architecture/core/resources/strings_manager.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';
import 'package:shop_app_with_clean_architecture/core/service/service_locator.dart';
import 'package:shop_app_with_clean_architecture/features/login/presentation/screens/login.dart';
import 'package:shop_app_with_clean_architecture/features/on_boarding/on_boarding_model.dart';
import 'package:shop_app_with_clean_architecture/features/on_boarding/widget/build_on_boarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

var boardController = PageController();
bool isLast = false;

void submit(context)
{
  sl<SharedPreferences>().setBool('onBoarding', true).then((value)
  {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: (){
                submit(context);
              },
              child: const Text(
                  AppStrings.skip,
              ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: SingleChildScrollView(
          child: SizedBox(
            height: 700.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: AppSize.s30,
                    ),
                    child: PageView.builder(
                      onPageChanged: (int index) {
                        if (index == boarding.length - 1) {
                          setState(() {
                            isLast = true;
                          });
                        } else {
                          setState(() {
                            isLast = false;
                          });
                        }
                      },
                      itemBuilder: (context, index) =>
                          BuildOnBoardingScreen(boarding[index]),
                      itemCount: boarding.length,
                      controller: boardController,
                    ),
                  ),
                ),
                Row(
                  children: [
                    SmoothPageIndicator(
                      controller: boardController,
                      count: boarding.length,
                      effect: const ExpandingDotsEffect(
                        dotHeight: 10.0,
                        dotWidth: 10.0,
                        dotColor: ColorManager.grey,
                        activeDotColor: ColorManager.mGreen,
                        expansionFactor: 1.1,
                        spacing: 4,
                      ),
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      onPressed: () {
                        if(isLast){
                          submit(context);
                        }else{
                          boardController.nextPage(
                            duration: const Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                        }
                      },
                      child: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
