import 'package:flutter/material.dart';
import 'package:meals_app/categoryCard.dart';

import './dummyData.dart';
import './meal.dart';

class CategoriesFragment extends StatelessWidget {
  // static const routeName = 'categories-fragment';
  final List<Meal> _availableMeals;

  CategoriesFragment(this._availableMeals);
  @override
  Widget build(BuildContext context) => GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map((category) {
          return CategoryCard(
            _availableMeals,
            id: category.id,
            title: category.title,
            color: category.color,
          );
        }).toList(),
      );
}
