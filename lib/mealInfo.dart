import 'package:flutter/material.dart';

import './dummyData.dart';
import './meal.dart';

class MealInfo extends StatelessWidget {
  static const routeName = './meal-info';
  final Function _toggleFavourite;
  final List<Meal> _favouriteMeals;

  MealInfo(this._favouriteMeals, this._toggleFavourite);
  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context).settings.arguments as String;
    final int mealIndex =
        DUMMY_MEALS.indexWhere((singleMeal) => singleMeal.id == mealId);

    final bool isFavourite =
        _favouriteMeals.any((favMeal) => favMeal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(DUMMY_MEALS[mealIndex].title),
      ),
      body: Center(
        child: Text('Add / remove it from favourites as per your liking !'),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 6,
        child: Icon(isFavourite
            ? Icons.favorite_rounded
            : Icons.favorite_border_rounded),
        onPressed: () => _toggleFavourite(DUMMY_MEALS.elementAt(mealIndex)),
      ),
    );
  }
}
