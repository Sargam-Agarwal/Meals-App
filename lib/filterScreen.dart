import 'package:flutter/material.dart';
import 'package:meals_app/drawerMenu.dart';

class FilterScreen extends StatefulWidget {
  static const String routeName = '/filter-screen';
  final Function _manageFilters;
  final Map<String, bool> _filterValues;

  FilterScreen(this._filterValues, this._manageFilters);

  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  Widget buildSwitchTile(
      String title, String subtitle, String key, bool value) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (newValue) {
          widget._filterValues[key] = newValue;
          widget._manageFilters(widget._filterValues);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
        ),
        drawer: DrawerMenu(),
        body: Column(
          children: [
            Container(
                height: 80,
                padding: EdgeInsets.all(20),
                child: Text(
                  'Apply your filters !',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                alignment: Alignment.center,
                color: Colors.amber),
            SizedBox(height: 5),
            buildSwitchTile('Gluten Free', 'Include gluten free meals only',
                'isGlutenFree', widget._filterValues['isGlutenFree']),
            buildSwitchTile('Lactose Free', 'Include lactose free meals only',
                'isLactoseFree', widget._filterValues['isLactoseFree']),
            buildSwitchTile('Vegetarian', 'Only Vegetarian meals',
                'isVegetarian', widget._filterValues['isVegetarian']),
            buildSwitchTile('Vegan', 'Only Vegan meals', 'isVegan',
                widget._filterValues['isVegan']),
          ],
        ));
  }
}
