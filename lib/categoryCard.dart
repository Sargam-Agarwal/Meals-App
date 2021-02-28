import 'package:flutter/material.dart';
import './categoryMealsScreen.dart';
import './meal.dart';

class CategoryCard extends StatelessWidget {
  final List<Meal> availableMeals;
  final String id;
  final String title;
  final Color color;

  CategoryCard(this.availableMeals, {this.id, this.title, this.color});

  void _openCategoryMeals(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName,
        arguments: {'categoryId': id, 'available meals': availableMeals});
  }

  Widget build(BuildContext context) => InkWell(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 23.5,
            ),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        borderRadius: BorderRadius.circular(15),
        splashColor: color,
        onTap: () => _openCategoryMeals(context),
      );
}
