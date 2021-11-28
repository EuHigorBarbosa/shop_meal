import 'package:flutter/material.dart';
import 'package:iburguer/components/widgets.dart';
import 'package:iburguer/models/models.dart';
import 'package:iburguer/screens/screens.dart';

class InicialStack extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const InicialStack({Key? key, required this.favoriteMeals}) : super(key: key);
  @override
  _InicialStackState createState() => _InicialStackState();
}

class _InicialStackState extends State<InicialStack>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

  final double maxSlide = 225.0;

  @override
  Widget build(BuildContext context) {
    var mainDrawer = MainDrawer();
    var firstScreen = TabScreen(
      favoriteMeals: widget.favoriteMeals,
    );
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          double slide = maxSlide * animationController.value;
          double scale = 1 - (animationController.value * 0.3);
          return Stack(
            children: [
              mainDrawer,
              Transform(
                transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale),
                alignment: Alignment.centerLeft,
                child: firstScreen,
              )
            ],
          );
        }); //Animated

    //build
  }
}
