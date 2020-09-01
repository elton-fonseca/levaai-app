import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PopupMedidaExata extends ModalRoute {
  @override
  Duration get transitionDuration => Duration(milliseconds: 350);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor =>
      bgColor == null ? Colors.black.withOpacity(0.5) : bgColor;

  @override

  String get barrierLabel => null;

  @override
  bool get maintainState => false;

  double top;
  double bottom;
  double left;
  double right;
  Color bgColor;
  final Widget child;

  PopupMedidaExata(
      {Key key,
        this.bgColor,
        @required this.child,
        this.top,
        this.bottom,
        this.left,
        this.right});

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    if (top == null) top = 10;
    if (bottom == null) bottom = 20;
    if (left == null) left = 20;
    if (right == null) right = 20;

    return GestureDetector(
      onTap: () {
        // call this method here to hide soft keyboard
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: Material( 
        // This makes sure that text and other 
        //content follows the material style
        type: MaterialType.transparency,
        //type: MaterialType.canvas,
        // make sure that the overlay content is not cut off
        child: SafeArea(
          bottom: true,
          child: _buildOverlayContent(context),
        ),
      ),
    );
  }
  //the dynamic content pass by parameter
  Widget _buildOverlayContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: bottom,
          left: left,
          right: right,
          top: top),
      child: child,
    );


  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}