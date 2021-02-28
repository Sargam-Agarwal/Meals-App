import 'package:flutter/material.dart';

import './dummyData.dart';
import './meal.dart';
import './mealCard.dart';

class CategoryMealsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CategoryMealsScreenState();

  static const routeName = '/category-meals-screen';
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  List<Meal> _availableMeals;
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final String categoryId = routeArgs['categoryId'];
    _availableMeals = routeArgs['available meals'];
    final String categoryTitle = DUMMY_CATEGORIES
        .firstWhere((category) => category.id == categoryId)
        .title;
    final List<Meal> _filteredMeals = _availableMeals
        .where(
          (singleMeal) => singleMeal.categories.contains(categoryId),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('$categoryTitle Meals'),
      ),
      body: ListView(
        children: _filteredMeals.map((meal) {
          return MealCard(
              id: meal.id,
              title: meal.title,
              imageUrl: meal.imageUrl,
              duration: meal.duration,
              complexity: meal.complexity,
              affordability: meal.affordability);
        }).toList(),
      ),
    );
  }
}
