import 'package:flutter/material.dart';
import 'package:iburguer/components/widgets.dart';
import 'package:iburguer/assets/assets.dart';
import 'package:iburguer/models/models.dart';
import 'package:iburguer/screens/screens.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabScreen({required this.favoriteMeals});

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: PageFrame(
        drawer: MainDrawer(),
        appBar: CustomAppBar.tabAppBar(
          title: 'Vamos conzinhar appBarTab',
          iconTab1: Icon(IconsApp.IconTabBook),
          iconTab2: Icon(IconsApp.IconTabStar),
          titleTab1: 'Category',
          titleTab2: 'Favorites',
          onPressed: () {
            print('Menu pressionado \n\n\n\n');
            //setState(() => InicialStack());
          },
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoriteScreen(favoriteMeals: widget.favoriteMeals),
          ],
        ),
      ),
    );
  }
}
