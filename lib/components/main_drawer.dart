import 'package:flutter/material.dart';
import '../config/config.dart';

class MainDrawer extends StatelessWidget {
  void onTapFunction() {
    print('a');
  }

  Widget _createItem(IconData icon, String label, VoidCallback onTapFunction) {
    //about voidCallback  -> https://stackoverflow.com/questions/64484113/the-argument-type-function-cant-be-assigned-to-the-parameter-type-void-funct
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapFunction,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          _createItem(
            Icons.restaurant,
            'Refeições',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME),
          ),
          _createItem(
            Icons.settings,
            'Configurações',
            () =>
                Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS),
          ),
          _createItem(
            Icons.restaurant,
            'Restaurant',
            () => Navigator.of(context)
                .pushReplacementNamed(AppRoutes.RESTAURANT),
          ),
        ],
      ),
    );
  }
}
