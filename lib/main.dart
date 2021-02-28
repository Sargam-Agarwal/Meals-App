import 'package:flutter/material.dart';
import 'package:meals_app/filterScreen.dart';
import 'package:meals_app/homePage.dart';

import './categoryMealsScreen.dart';
import './mealInfo.dart';
import './meal.dart';
// import './categoriesFragment.dart';
import './homePage.dart';
import './dummyData.dart';

void main() => runApp(MyMealsApp());

class MyMealsApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyMealsAppState();
  }
}

class _MyMealsAppState extends State<MyMealsApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favourites = [];
  Map<String, bool> _filterValues = {
    'isGlutenFree': false,
    'isLactoseFree': false,
    'isVegan': false,
    'isVegetarian': false
  };

  void _manageFilters(Map<String, bool> _newFilterValues) {
    setState(() {
      _filterValues = _newFilterValues;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filterValues['isGlutenFree'] && !meal.isGlutenFree) return false;
        if (_filterValues['isLactoseFree'] && !meal.isLactoseFree) return false;
        if (_filterValues['isVegan'] && !meal.isVegan) return false;
        if (_filterValues['isVegetarian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void _toggleFavourite(Meal meal) {
    int _isFavourite =
        _favourites.indexWhere((favMeal) => favMeal.id == meal.id);
    setState(() {
      if (_isFavourite != -1)
        _favourites.removeAt(_isFavourite);
      else
        _favourites.add(meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(_availableMeals, _favourites),
      routes: {
        HomePage.routeName: (context) => HomePage(_availableMeals, _favourites),
        //CategoriesFragment.routeName: (context) =>
        //CategoriesFragment(_availableMeals),
        FilterScreen.routeName: (context) =>
            FilterScreen(_filterValues, _manageFilters),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealInfo.routeName: (context) =>
            MealInfo(_favourites, _toggleFavourite),
      },
    );
  }
}
