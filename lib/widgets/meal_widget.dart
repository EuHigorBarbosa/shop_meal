import 'package:flutter/material.dart';
import 'package:iburguer/assets/assets.dart';
import 'package:iburguer/assets/styles/styles.dart';
import 'package:iburguer/config/config.dart';
import 'package:iburguer/models/models.dart';

class MealWidget extends StatelessWidget {
  final Meal meal;

  const MealWidget({required this.meal});
  void _goToScreenMealDetail(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      AppRoutes.MEAL_DETAIL_SCREEN,
      arguments: meal,
    )
        .then((result) {
      if (result == null) {
        print(
            'Sem resultado para Future iniciado pelo pushNamed do AppRoutes.MEAL_DETAIL_SCREEN!');
      } else {
        print('O nome da refeição é $result');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _goToScreenMealDetail(context),
      child: Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      meal.imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    //esse widget é filho da stack e se posiciona dentro
                    //da stack de forma arbitrária
                    bottom: 20, //quero que fique afastado do fundo de 20
                    right: 10, //quero que fique afastado da direita de 10
                    child: Container(
                      width: 300,
                      color: AppColors.BackGroundTitle,
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 20,
                      ),
                      child: Text(
                        meal.title,
                        style: AppTextStyles.meal_WidgetTextStyle,
                        softWrap: true, //permita quebra de linha
                        overflow:
                            TextOverflow.fade, //se der overflow gera o fade
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.schedule),
                        SizedBox(width: 6),
                        Text('${meal.duration} min'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(width: 6),
                        Text('${meal.complexityText} min'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.money_off_csred_rounded),
                        SizedBox(width: 6),
                        Text('Custo: ${meal.costText}'),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
