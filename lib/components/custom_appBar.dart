import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iburguer/components/widgets.dart';

import '../../assets/assets.dart';
// class HigorAppBar extends AppBar{
//   HigorAppBar({Widget? title,

//       List<Widget>? actions,
//       bool? centerTitle,
//       Color? actionsIconColor,
//       double? iconSize,
//       Color? iconColor,
//       double? elevation,
//       Widget? titleTextStyle,
//       PreferredSizeWidget? bottom} ):super()
// }
class CustomAppBar extends AppBar {
  CustomAppBar(
      {Widget? leading,
      Widget? title,
      List<Widget>? actions,
      bool? centerTitle,
      Color? actionsIconColor,
      double? iconSize,
      Color? iconColor,
      double? elevation,
      Widget? titleTextStyle,
      PreferredSizeWidget? bottom})
      : super(
          automaticallyImplyLeading: true,
          centerTitle: centerTitle ?? true,
          titleSpacing: 25.0,
          leadingWidth: 60,
          leading: leading,
          title: title,
          bottom: bottom,
          titleTextStyle: titleTextStyle != null
              ? AppTextStyles.boldText(size: 20.0, color: AppColors.appBarFG)
              : null,
          actions: actions != null
              ? actions +
                  [
                    SizedBox(
                      width: 15,
                    )
                  ]
              : actions,
          elevation: elevation ?? 4.0,
          iconTheme: IconThemeData(
              color: iconColor ?? AppColors.appBarFG, size: iconSize ?? 20.0),
          actionsIconTheme: IconThemeData(
              color: actionsIconColor ?? AppColors.appBarFG,
              size: iconSize ?? 20.0),
        );

  factory CustomAppBar.menuInicial({
    required String title,
    Function()? onPressed,
    List<Widget>? actions,
  }) {
    return CustomAppBar(
      leading:
          CustomIconButtons.menuInicial(onPressed: onPressed, isActive: true),
      actions: actions,
    );
  }
  factory CustomAppBar.categoryMeal({
    required String title,
    Function()? onPressed,
    List<Widget>? actions,
  }) {
    return CustomAppBar(
      leading:
          CustomIconButtons.setaVoltar(onPressed: onPressed, isActive: true),
      actions: actions,
      title: Text(
        title,
        style: AppTextStyles.appBarText,
      ),
    );
  }

  factory CustomAppBar.individualMeal({
    required String title,
    Function()? onPressed,
    List<Widget>? actions,
  }) {
    return CustomAppBar(
      leading:
          CustomIconButtons.setaVoltar(onPressed: onPressed, isActive: true),
      actions: actions,
      title: Text(
        title,
        style: AppTextStyles.appBarText,
      ),
    );
  }

  factory CustomAppBar.tabAppBar({
    required String title,
    required Icon iconTab1,
    required Icon iconTab2,
    required String titleTab1,
    required String titleTab2,
    Function()? onPressed,
    //List<Widget>? actions,
  }) {
    return CustomAppBar(
      //leading: CustomIconButtons.menuInicial(onPressed: () {}, isActive: true),
      title: Text(
        title,
        style: AppTextStyles.appBarText,
      ),
      bottom: TabBar(
        tabs: [
          Tab(
            icon: iconTab1,
            text: titleTab1,
          ),
          Tab(
            icon: iconTab2,
            text: titleTab2,
          ),
        ],
      ),
    );
  }

  ///=============================
  factory CustomAppBar.withCloseIcon(
      {String? title,
      Function()? onPressed,
      List<Widget>? actions,
      bool yellow = false}) {
    return CustomAppBar(
        leading: CustomIconButtons.closeButton(onPressed: onPressed),
        actions: actions,
        title: title == null
            ? null
            : Text(
                title,
                style: yellow
                    ? AppTextStyles.appBarYellowText
                    : AppTextStyles.appBarText,
              ));
  }

  factory CustomAppBar.withBackArrow(
      {String? title,
      Function()? onPressed,
      List<Widget>? actions,
      bool yellow = true,
      bool yellowActions = false}) {
    return CustomAppBar(
        leading:
            CustomIconButtons.backArrow(yellow: false, onPressed: onPressed),
        actions: actions,
        actionsIconColor:
            yellowActions ? AppColors.yellowButtonBG : Colors.white,
        title: title == null
            ? null
            : Text(
                title,
                style: yellow
                    ? AppTextStyles.appBarYellowText
                    : AppTextStyles.appBarText,
              ));
  }

  factory CustomAppBar.withSearchField(
      {required Widget filterWidget,
      String? title,
      Function()? leadingOnPressed,
      Function()? searchOnPressed,
      List<Widget>? actions,
      bool close = true,
      bool yellow = true,
      bool openField = false}) {
    IconButton searchIcon() => IconButton(
        onPressed: searchOnPressed,
        icon: Icon(Icons.search_outlined, color: Colors.white, size: 40.0));
    return CustomAppBar(
        leading: close
            ? CustomIconButtons.closeButton(
                onPressed: leadingOnPressed ?? () => Get.back())
            : CustomIconButtons.backArrow(
                yellow: false, onPressed: leadingOnPressed ?? () => Get.back()),
        actions: [searchIcon()],
        title: openField
            ? filterWidget
            : title == null
                ? null
                : Text(
                    title,
                    style: yellow
                        ? AppTextStyles.appBarYellowText
                        : AppTextStyles.appBarText,
                  ));
  }
}
