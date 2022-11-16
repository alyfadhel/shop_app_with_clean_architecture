import 'package:flutter/material.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';
import 'package:shop_app_with_clean_architecture/features/categories/domain/entities/categories.dart';
import 'package:shop_app_with_clean_architecture/features/categories_details/presentation/screens/categories_details.dart';

class CategoriesItem extends StatelessWidget {
  final CategoriesData data;

  const CategoriesItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoriesDetailsScreen(id: data.id!),
              ));
        },
        child: Row(
          children: [
            Container(
              width: AppSize.s100,
              height: AppSize.s100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    '${data.image}',
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: AppSize.s20,
            ),
            Text(
              '${data.name}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}