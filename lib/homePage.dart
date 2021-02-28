import 'package:flutter/material.dart';

import './categoriesFragment.dart';
import './favoritesFragment.dart';
import './drawerMenu.dart';
import './meal.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';
  final List<Meal> _availableMeals;
  final List<Meal> _favorites;
  HomePage(this._availableMeals, this._favorites);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _fragments;
  int _selectedTabIndex = 0;

  @override
  void initState() {
    _fragments = [
      CategoriesFragment(widget._availableMeals),
      FavoritesFragment(widget._favorites)
    ];
    super.initState();
  }

  void _selectFragment(int tabIndex) {
    setState(() {
      _selectedTabIndex = tabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals App'),
      ),
      drawer: DrawerMenu(),
      body: _fragments[_selectedTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Theme.of(context).primaryColor,
        currentIndex: _selectedTabIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          )
        ],
        onTap: _selectFragment,
      ),
    );
  }
}
