import 'package:flutter/material.dart';

import '../data_model/Category.dart';

class CategoryItem extends StatelessWidget {
  Category category;

  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Colors.black,
            child: Image.asset(
              category.imagePath ?? 'assets/images/Mystery.jpg',
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(0.4),
            ),
          ),
          Center(
            child: Text(category.name ?? '',
                style: Theme.of(context).textTheme.displayMedium),
          )
        ],
      ),
    );
  }
}
