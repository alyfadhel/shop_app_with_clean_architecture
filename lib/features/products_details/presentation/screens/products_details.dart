import 'package:flutter/material.dart';
import 'package:shop_app_with_clean_architecture/core/resources/color_manager.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';

class ProductsDetailsScreen extends StatelessWidget {
  const ProductsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Container(
                  width: double.infinity,
                  height: AppSize.s400,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        'https://student.valuxapps.com/storage/uploads/products/1644374518j1Fb5.10.jpg',
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: AppSize.s30,
                    left: AppSize.s10,
                  ),
                  child: IconButton(
                      onPressed: ()
                      {
                        Navigator.pop(context);
                      },
                      icon: CircleAvatar(
                        radius: AppSize.s25,
                        backgroundColor: ColorManager.sWhite.withOpacity(.5),
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: AppSize.s8,
                          ),
                          child: const Icon(
                              Icons.arrow_back_ios,
                            size: AppSize.s20,
                            color: ColorManager.sWhite,
                          ),
                        ),
                      ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s30,
            ),
            Padding(
              padding: const EdgeInsets.all(AppSize.s20),
              child: Text(
                  'Bring home the Apple MacBook Pro and experience computing like never before. This Apple laptop features a powerful 2.3Ghz 8th Gen-Intel Core i5 processor that makes sure the system keeps performing efficiently. Experience smooth and fast multitasking with the 8GB RAM. The Intel Iris Plus Graphics render images in high-quality and make your gaming experience a pleasing one. The macOS operating system offers various user-friendly features. Store your movies, audios, and other important files comfortably on the 512GB SSD of this device. The 13.3inch display allows you to view your favorite movies and other content in high quality. The Retina display features bright LED backlighting and a high contrast ratio that enhances your viewing experience. The True Tone technology provides a natural viewing experience by adjusting the white balance of the screen as per the color temperature of the light around. Featuring well-balanced, high-fidelity sounds, this laptop delivers an immersive audio experience. The Apple T2 chip lets you store your data in an encrypted format with the help of its Secure Enclave coprocessor. Also, it tightens the security further with the help of the Touch ID. The Touch ID only allows you to unlock your laptop using your fingerprints. The Touch Bar controls simplify various activities such as sending an email or formatting a document. This lightweight laptop can be easily carried around in your backpack. It features a space grey that gives it a distinguished and beautiful look.',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
