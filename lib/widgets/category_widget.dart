import 'package:flutter/material.dart';
import 'package:iburguer/assets/assets.dart';
import 'package:iburguer/config/config.dart';
import '../models/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  const CategoryWidget(this.category);

  void _goToScreenCategory(BuildContext context) {
    // ======== Exemplo de Rota sem ser nomeada ======
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (context) {
    //     return CategoriesMealsScreen(category);
    //   }),
    // );
    Navigator.of(context).pushNamed(
      AppRoutes.CATEGORIES_MEALS,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goToScreenCategory(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: AppColors.splashInkWell,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        child: Text(
          category.title,
          style: AppTextStyles.category_Widget,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
