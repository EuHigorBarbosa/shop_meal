import 'package:flutter/material.dart';
import 'package:iburguer/assets/assets.dart';
import 'package:iburguer/components/widgets.dart';
import 'package:iburguer/config/app_routes.dart';
import 'package:iburguer/models/settings.dart';

class SettingScreen extends StatefulWidget {
  final Function(Settings) onSettingsChangedThenFilterMeals;
  final Settings settingsOfConstructor;

  const SettingScreen(
      {required this.onSettingsChangedThenFilterMeals,
      required this.settingsOfConstructor});
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void _returnMenuCategories(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
  }

  late Settings settingsOfState;
  //variavel utilizada para manter o estado de settins.

  @override
  void initState() {
    super.initState();
    settingsOfState = widget.settingsOfConstructor;
  }

  Widget _createSwitch({
    required String argTitle,
    required String argSubtitle,
    required bool argNewValue,
    required void Function(bool) onUserTAP,
  }) {
    print('ORD1(SettingsScreen) - Retorno do _createSwitch aconteceu agora');
    print('ORD1(SettingsScreen) - O valor de argNewValue é $argNewValue');
    return SwitchListTile.adaptive(
      title: Text(argTitle),
      subtitle: Text(argSubtitle),
      value: argNewValue,
      onChanged: (argNewValue) {
        print('ORD2(SettingsScreen) --- Função SwitchListTile.adaptative ');
        print('ORD2 - valor de argNewValue é $argNewValue');
        onUserTAP(argNewValue);
        print('entre funções dentro de onchange');
        widget.onSettingsChangedThenFilterMeals(settingsOfState);
        print(
            'ORD6(SettingsScreen)     - Quando onChanged foi acionado ele recebeu $argNewValue e o valor de \n Settings para isGlutenFree ${settingsOfState.isGlutenFree}');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('Build method do ScreenSettings');
    print(
        'depois do build valor para settings.isGlutenFree é ${settingsOfState.isGlutenFree}');
    return Scaffold(
        appBar: CustomAppBar.withBackArrow(
            onPressed: () => _returnMenuCategories(context)),
        body: Column(children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Configurações', style: AppTextStyles.header1Text),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  argTitle: 'Sem Glútem',
                  argSubtitle: 'Só exibe refeições sem glútem',
                  argNewValue: settingsOfState.isGlutenFree,
                  onUserTAP: (value) {
                    print(
                        'ORD3(SettingsScreen) -     mudança no settings.isGlutenFree de: ${settingsOfState.isGlutenFree} para $value');
                    setState(() => settingsOfState.isGlutenFree = value);
                    print('ORD4(SettingsScreen) - logo depois do setState');
                  },
                ),
                _createSwitch(
                  argTitle: 'Sem Lactose',
                  argSubtitle: 'Só exibe refeições sem lactose',
                  argNewValue: settingsOfState.isLactoseFree,
                  onUserTAP: (value) =>
                      setState(() => settingsOfState.isLactoseFree = value),
                ),
                _createSwitch(
                  argTitle: 'Veganas',
                  argSubtitle: 'Só exibe refeições veganas',
                  argNewValue: settingsOfState.isVegan,
                  onUserTAP: (value) =>
                      setState(() => settingsOfState.isVegan = value),
                ),
                _createSwitch(
                  argTitle: 'Vegeratianas',
                  argSubtitle: 'Só exibe refeições vegetarianas',
                  argNewValue: settingsOfState.isVegetarian,
                  onUserTAP: (value) =>
                      setState(() => settingsOfState.isVegetarian = value),
                ),
              ],
            ),
          )
        ]));
  }
}
