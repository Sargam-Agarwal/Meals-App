import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './meal.dart';
import './mealCard.dart';

class FavoritesFragment extends StatelessWidget {
  final List<Meal> _favouriteMeals;

  FavoritesFragment(this._favouriteMeals);

  @override
  Widget build(BuildContext context) => _favouriteMeals.length == 0
      ? Center(
          child: Text('No Favorites yet ! Add some !'),
        )
      : ListView(
          children: _favouriteMeals
              .map(
                (favMeal) => MealCard(
                    id: favMeal.id,
                    title: favMeal.title,
                    affordability: favMeal.affordability,
                    complexity: favMeal.complexity,
                    duration: favMeal.duration,
                    imageUrl: favMeal.imageUrl),
              )
              .toList(),
        );
}
