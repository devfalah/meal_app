import 'package:flutter/material.dart';
import 'package:meal/dummy_data.dart';
import 'package:meal/screens/categories.dart';
import 'package:meal/screens/category_meal_screen.dart';
import 'package:meal/screens/filters_screen.dart';
import 'package:meal/screens/meal_detail_screen.dart';
import 'package:meal/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'Gluten': false,
    'Lactose': false,
    'Vegan': false,
    'Vegetarian': false,
  };
  List _availableMeal=DUMMY_MEALS;
  List _favoriteMeal=[];
  void saveFilter(Map<String, bool> _filtersData){
setState(() {
  _filters=_filtersData;
  _availableMeal=DUMMY_MEALS.where((meal) {
    if(_filters['Gluten']&& !meal.isGlutenFree) {
      return false;

    }
    if(_filters['Lactose']&& !meal.isLactoseFree) {
      return false;

    }
    if(_filters['Vegan']&& !meal.isVegan) {
      return false;

    }
    if(_filters['Vegetarian']&& !meal.isVegetarian) {
      return false;

    }
    return true;
  }).toList();
});
  }
  void toggleFavorite(String mealId){
    final exitingIndex=_favoriteMeal.indexWhere((meal) => meal.id==mealId);
    if(exitingIndex>=0){
      setState(() {
        _favoriteMeal.removeAt(exitingIndex);
      });
    }else{
      _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id==mealId));
    }
  }
  bool isFavorite(String id){

      return _favoriteMeal.any((meal) => meal.id==id);




  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Roboto Condensed',
                  fontWeight: FontWeight.w500,
                ),
                body2: TextStyle(),
                title: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Roboto Condensed',
                  fontWeight: FontWeight.bold,
                ),
              )),
      // home: MyHomePage(),

      routes: {
        '/': (context) => TabsScreen(_favoriteMeal),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(_availableMeal),
        MealDetailScreen.routeName: (context) => MealDetailScreen(isFavorite,toggleFavorite),
        FiltersScreen.routeName: (context) => FiltersScreen(_filters,saveFilter),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: null);
  }
}
