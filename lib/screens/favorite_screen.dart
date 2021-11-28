import 'package:flutter/material.dart';
import 'package:iburguer/components/widgets.dart';
import 'package:iburguer/models/models.dart';
import 'package:iburguer/widgets/widgets.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoriteScreen({Key? key, required this.favoriteMeals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return PageFrame(
        body: Text('Nenhuma comida foi marcada como favorita'),
      );
    } else {
      return PageFrame(
          body: ListView.builder(
              itemBuilder: (ctx, index) {
                return MealWidget(meal: favoriteMeals[index]);
              },
              itemCount: favoriteMeals.length));
    }
  }
}
