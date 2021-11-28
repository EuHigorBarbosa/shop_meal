import 'package:flutter/material.dart';
import '../widgets/category_widget.dart';
import '../data/dammy_data.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView(
        padding: const EdgeInsets.all(15),

        /// Creates a delegate that makes grid layouts with tiles that have a maximum
        /// cross-axis extent.
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,

          childAspectRatio: 3 / 2, //weigh / heigth
          //The ratio of the cross-axis to the main-axis extent of each child.
          //crossAxisCount: 2, //quantos por linha?
          crossAxisSpacing: 20.0, //espaço entre linhas
          mainAxisSpacing: 20.0, //espaço entre colunas
        ),
        children: DUMMY_CATEGORIES.map((cat) {
          return CategoryWidget(cat);
        }).toList(),

        // GridView.count(
        //   // Cria um grid com duas colunas
        //   crossAxisCount: 3,
        //   //espaço entre eles fica em 20
        //   mainAxisSpacing: 50.0,
        //   //espaço entre os itens
        //   crossAxisSpacing: 20,
        //   // Gera 100 Widgets que exibem o seu índice
        //   children: List.generate(
        //     100,
        //     (index) {
        //       return Center(
        //         child: Text(
        //           'Item $index',
        //           style: Theme.of(context).textTheme.headline6,
        //         ),
        //       );
        //     },
        //   ),
        // )
      ),
    );
  }
}
