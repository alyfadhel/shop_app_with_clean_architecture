import 'package:flutter/material.dart';

class CategoriesDetailsScreen extends StatelessWidget {
  const CategoriesDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'Categories Details',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
