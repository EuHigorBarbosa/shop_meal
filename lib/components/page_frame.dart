import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:incognito/ui/config/config.dart';
//import '../../helpers/helpers.dart';

import '../config/size.dart';

class PageFrame extends StatelessWidget {
  //final String loginBackgroundImage = R.loginBackgroundImage;

  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final Widget? drawer;
  final DrawerCallback? onDrawerChanged;
  final Widget? endDrawer;
  final DrawerCallback? onEndDrawerChanged;
  final Color? drawerScrimColor;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final bool? resizeToAvoidBottomInset;
  final bool primary;
  final DragStartBehavior drawerDragStartBehavior;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;

  const PageFrame({
    Key? key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.safeBlockHorizontal * 100;
    double height = SizeConfig.safeBlockVertical * 100;

    // String loginBG = SizeConfig.isLargeScreen
    //     ? R.largeLoginBackgroundImage
    //     : R.loginBackgroundImage;

    return Container(
      child: Scaffold(
        backgroundColor: this.backgroundColor,
        appBar: this.appBar,
        body: this.body != null
            ? SafeArea(
                child: Center(
                    child: Container(
                        height: height, width: width, child: this.body!)))
            : null,
        floatingActionButton: this.floatingActionButton,
        floatingActionButtonLocation: this.floatingActionButtonLocation,
        floatingActionButtonAnimator: this.floatingActionButtonAnimator,
        persistentFooterButtons: this.persistentFooterButtons,
        drawer: this.drawer,
        onDrawerChanged: this.onDrawerChanged,
        endDrawer: this.endDrawer,
        onEndDrawerChanged: this.onEndDrawerChanged,
        bottomNavigationBar: this.bottomNavigationBar,
        bottomSheet: this.bottomSheet,
        resizeToAvoidBottomInset: this.resizeToAvoidBottomInset,
        primary: this.primary,
        drawerDragStartBehavior: this.drawerDragStartBehavior,
        extendBody: this.extendBody,
        extendBodyBehindAppBar: this.extendBodyBehindAppBar,
        drawerScrimColor: this.drawerScrimColor,
        drawerEdgeDragWidth: this.drawerEdgeDragWidth,
        drawerEnableOpenDragGesture: this.drawerEnableOpenDragGesture,
        endDrawerEnableOpenDragGesture: this.endDrawerEnableOpenDragGesture,
      ),
    );
  }
}
