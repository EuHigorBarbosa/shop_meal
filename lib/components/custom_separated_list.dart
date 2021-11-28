import 'package:flutter/material.dart';
import 'package:iburguer/config/config.dart';

class CustomSeparatedList extends StatelessWidget {
  final List listItems;
  final double? divThickness;
  final Color? divColor;
  final double? divHeight;

  const CustomSeparatedList(
      {required this.listItems,
      this.divThickness,
      this.divColor,
      this.divHeight});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: listItems.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
              height: divHeight,
              thickness: divThickness ?? 1.5,
              color: divColor ?? Colors.transparent,
            ),
        itemBuilder: (BuildContext context, int index) {
          bool last = listItems.length == (index + 1);
          return Padding(
              padding: EdgeInsets.only(
                  bottom: last ? SizeConfig.safeBlockVertical * 15 : 0.0),
              child: listItems[index]);
        });
  }
}
