import 'package:flutter/material.dart';
import 'package:iburguer/models/settings.dart';

import '../screens/screens.dart';
import '../config/config.dart';
import '../data/dammy_data.dart';
import '../models/models.dart';

void main() {
  print('O programa iniciou');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;

  List<Meal> _favoriteMeals = [];

  Settings argSettings = Settings();
  //variavel utilizada para manter o estado de settins.

  void _filterMeals(Settings argSettings) {
    setState(() {
      this.argSettings = argSettings;

      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = argSettings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = argSettings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = argSettings.isVegan && !meal.isVegan;
        final filterVegetarian = argSettings.isVegetarian && !meal.isVegetarian;
        print('ORD5(main) o tamanho de DUMMY_MEALS é ${DUMMY_MEALS.length}');
        print(
            'ORD5(main)    o filtro de meals foi acionado agora _filterMeals(Settings artSettings)');
        print(
            'ORD5(main)    o valor de isGluten para argSettins é: ${argSettings.isGlutenFree}');
        return !filterVegetarian &&
            !filterVegan &&
            !filterGluten &&
            !filterLactose;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(' o metodo build do MyAppState foi acionado');
    return MaterialApp(
      //initialRoute: '/',       //-> argumento que define a rota principal
      routes: {
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(
            favoriteMeals: _favoriteMeals, meals: _availableMeals),
        AppRoutes.HOME: (ctx) => TabScreen(favoriteMeals: _favoriteMeals),
        //Uma vez utilizando esse.Home não precisa do home: CategoriesScreen();
        AppRoutes.MEAL_DETAIL_SCREEN: (ctx) => MealDetailScreen(
            onToggleFavorite: _toggleFavorite, favoriteMeals: _favoriteMeals),
        AppRoutes.RESTAURANT: (ctx) => RestaurantScreen(),
        AppRoutes.SETTINGS: (ctx) {
          print('(Main)  - Construtor SettingScreen chamado agora');
          return SettingScreen(
            onSettingsChangedThenFilterMeals: _filterMeals,
            settingsOfConstructor: argSettings,
          );
        }
      },
      title: 'iBurguer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: CategoriesScreen(),
    );
  }
}
