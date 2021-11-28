import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Restaurante'),
        ),
        body: Container(
          color: Colors.blue,
          child: Text('Restaurante'),
        ));
  }
}
