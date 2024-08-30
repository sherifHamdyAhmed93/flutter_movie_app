import 'package:flutter/material.dart';
import 'package:flutter_movie_app/movies_by_catgeory_screen/movies_by_catgory_screen.dart';

import '../data_model/Category.dart';

class CategoryItem extends StatelessWidget {
  Category category;

  CategoryItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, MoviesByCategoryScreen.routeName,arguments: category);
      },
      child: Container(
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
      ),
    );
  }
}
