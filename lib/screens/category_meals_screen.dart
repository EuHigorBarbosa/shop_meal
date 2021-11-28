import 'package:flutter/material.dart';
import 'package:iburguer/assets/assets.dart';
import 'package:iburguer/widgets/widgets.dart';
import '../components/widgets.dart';
import 'package:iburguer/config/config.dart';
import 'package:iburguer/models/models.dart';
import 'package:iburguer/screens/screens.dart';

//==============================================
//            Tela de Categorias em Lista
//==============================================
class CategoriesMealsScreen extends StatefulWidget {
  final List<Meal> meals;
  final List<Meal> favoriteMeals;

  const CategoriesMealsScreen(
      {required this.meals, required this.favoriteMeals});
  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  void _returnMainMenu(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.HOME,
    );
  }

  //Essa variavel está fora do metodo build porque se não ela não muda conforme o clique
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    //Essa é a category passada no pushNamed como argument
    final Category category =
        ModalRoute.of(context)!.settings.arguments as Category;

    //Essa parte determina quais meals pertencem à category passada
    //Se o id de category estiver dentro de algum dos meals do DAMMY_MEALS ele será selecionado

    final categoryMeals = widget.meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    //Essa parte determina qual tela é carregada
    final screens = [
      //index = 0
      ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealWidget(meal: categoryMeals[index]);
        },
      ),
      //index = 1
      TabScreen(favoriteMeals: widget.favoriteMeals),

      //index = 2
      FavoriteScreen(favoriteMeals: widget.favoriteMeals),
    ];

    _selectScreenFunction(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return PageFrame(
      appBar: CustomAppBar.categoryMeal(
        title: (selectedIndex == 0)
            ? '${category.title}'
            : (selectedIndex == 1)
                ? 'Vamos cozinhar'
                : 'Favoritos',
        onPressed: () => _returnMainMenu(context),
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.appBarFG,
        unselectedItemColor: Colors.black,
        iconSize: 20,
        selectedFontSize: 15,
        unselectedFontSize: 8,
        //showSelectedLabels: false,
        //showUnselectedLabels: false,
        // Maneira com função
        onTap: _selectScreenFunction,

        // Maneira direta
        //onTap: (index) => setState(() => selectedIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(IconsApp.IconTabBook),
            label: 'Category',
            backgroundColor: AppColors.appBarBG,
          ),
          BottomNavigationBarItem(
            icon: Icon(IconsApp.IconButtonMenu),
            label: 'Menu',
            backgroundColor: AppColors.appBarBG,
          ),
          BottomNavigationBarItem(
            icon: Icon(IconsApp.IconTabStar),
            label: 'Favorite',
            backgroundColor: AppColors.appBarBG,
          )
        ],
      ),
    );
  }
}
