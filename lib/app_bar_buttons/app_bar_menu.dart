import 'package:flutter/material.dart';

class AppBarMenu extends PopupRoute<void> {
  @override
  Color get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String get barrierLabel => "menu";

  @override
  Widget buildPage(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, kToolbarHeight + 8, 16, 0),
          child: ClipPath(
            clipper: _AppBarMenuClipper(),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.cyan,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: 200);
}

class _AppBarMenuClipper extends CustomClipper<Path> {
  var radius = 15.0;
  var radius2 = 8.0;
  var triangleHeight = 20.0;
  var triangleWidth = 35.0;

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(radius, triangleHeight);
    path.lineTo(size.width - triangleWidth - 2, triangleHeight);
    path.arcToPoint(Offset(size.width - triangleWidth + 2, triangleHeight - 2), radius: Radius.circular(radius2), clockwise: false);
    path.lineTo(size.width - triangleWidth / 2 - 1, 2);
    path.arcToPoint(Offset(size.width - triangleWidth / 2 + 1, 2), radius: Radius.circular(radius2));
    path.lineTo(size.width - 2, triangleHeight - 2);
    path.arcToPoint(Offset(size.width, triangleHeight + 2), radius: Radius.circular(radius2));
    path.lineTo(size.width, size.height - radius);
    path.arcToPoint(Offset(size.width - radius, size.height), radius: Radius.circular(radius));
    path.lineTo(radius, size.height);
    path.arcToPoint(Offset(0, size.height - radius), radius: Radius.circular(radius));
    path.lineTo(0, radius + triangleHeight);
    path.arcToPoint(Offset(radius, triangleHeight), radius: Radius.circular(radius));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}