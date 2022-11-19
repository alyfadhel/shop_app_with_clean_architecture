import 'package:flutter/material.dart';
import 'package:shop_app_with_clean_architecture/core/resources/values_manager.dart';
import 'package:shop_app_with_clean_architecture/features/search/domain/entities/search.dart';

class SearchList extends StatelessWidget {
  final SearchData model;
  final bool isDiscount;
  const SearchList({Key? key,required this.model, this.isDiscount = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSize.s10,
          ),
          child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                width: double.infinity,
                height: AppSize.s200,
                image: NetworkImage(
                  model.image,
                ),
              ),
              if (model.discount != 0 && isDiscount)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                  child: const Text(
                    'DISCOUNT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                model.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  height: 1.3,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${model.price}',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  if (model.discount != 0 && isDiscount)
                    Text(
                      '${model.oldPrice}',
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}