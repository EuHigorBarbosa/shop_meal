import 'package:flutter/material.dart';
import 'package:iburguer/components/widgets.dart';

class CustomColumnsListItem extends StatelessWidget {
  final Widget? leading;
  final List<Widget> textList;
  final Widget? trailing;
  final double padding;
  final double radius;
  final List<int> fieldProportions;

  const CustomColumnsListItem(
      {this.leading,
      required this.textList,
      this.trailing,
      this.padding = 10.0,
      this.radius = 10.0,
      this.fieldProportions = const [1, 5, 1]});

  @override
  Widget build(BuildContext context) {
    const Widget emptyField = SizedBox(
      width: 0.0,
      height: 0.0,
    );
    return CustomCard(
      child: Row(
        children: [
          leading != null
              ? Expanded(
                  flex: fieldProportions[0],
                  child: Container(child: Center(child: leading)))
              : emptyField,
          Expanded(
            flex: fieldProportions[1],
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...textList,
                  ],
                ),
              ),
            ),
          ),
          trailing != null
              ? Expanded(
                  flex: fieldProportions[2],
                  child: Container(child: Center(child: trailing)))
              : emptyField,
        ],
      ),
      padding: padding,
      radius: radius,
    );
  }
}
