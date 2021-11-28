import 'package:flutter/material.dart';
import 'package:iburguer/assets/assets.dart';
import 'package:iburguer/components/custom_appBar.dart';
import 'package:iburguer/components/page_frame.dart';
import 'package:iburguer/config/config.dart';
import 'package:iburguer/models/models.dart';

class MealDetailScreen extends StatefulWidget {
  final Function(Meal) onToggleFavorite;
  final List<Meal> favoriteMeals;
  MealDetailScreen(
      {required this.onToggleFavorite, required this.favoriteMeals});

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  void _returnMenuCategories(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: AppTextStyles.category_Widget,
      ),
    );
  }

  Widget _createSectionContainer(Widget childArgument) {
    return Container(
        width: SizeConfig.screenWidth * 0.8,
        height: SizeConfig.screenHeight * 0.3,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.cardBG,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: childArgument);
  }

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context)!.settings.arguments as Meal;
    print(
        'Esse é o valor de SizeConfig.screenHeight * 0.4: ${SizeConfig.screenHeight * 0.4}');
    return PageFrame(
      appBar: CustomAppBar.individualMeal(
        title: '${meal.title} ',
        onPressed: () => _returnMenuCategories(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
              height: SizeConfig.screenHeight * 0.4,
              width: double.infinity,
            ),
            _createSectionTitle(context, 'Ingredeentes'),
            _createSectionContainer(ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text('${meal.ingredients[index]}'),
                    ),
                    color: AppColors.cardBG,
                  );
                })), //createSectionContainer
            _createSectionTitle(context, 'Steps'),
            _createSectionContainer(ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(meal.steps[index]),
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                    ],
                  );
                })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:
            widget.favoriteMeals.contains(meal) ? (Colors.yellow) : Colors.blue,
        onPressed: () {
          setState(() {
            widget.onToggleFavorite(meal);
          });
        },
        child: Icon(
          IconsApp.IconTabStar,
          color: widget.favoriteMeals.contains(meal)
              ? (Colors.black)
              : Colors.white,
        ),
      ),
    );
  }
}
