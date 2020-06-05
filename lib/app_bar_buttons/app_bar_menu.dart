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
          padding: const EdgeInsets.fromLTRB(0, kToolbarHeight + 8, 20, 0),
          child: ClipPath(
              clipper: _AppBarMenuClipper(),
              child: Container(
                width: 210,
                child: Material(
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ListTile(
                        leading: Icon(Icons.info, color: Colors.black87),
                        title: Text("Info"),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.translate, color: Colors.black87),
                        title: Text("Menu language"),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: 200);
}

class _AppBarMenuClipper extends CustomClipper<Path> {
  var radius = 15.0;
  var triangleHeight = 15.0;
  var triangleWidth = 25.0;
  var triangleOffset = 4.0;

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(radius, triangleHeight);
    path.lineTo(size.width - triangleWidth - triangleOffset, triangleHeight);
    path.arcToPoint(Offset(size.width - triangleWidth + triangleOffset, triangleHeight - triangleOffset),
        radius: Radius.circular(radius), clockwise: false);
    path.lineTo(size.width - triangleWidth / 2 - 1, triangleOffset);
    path.arcToPoint(Offset(size.width - triangleWidth / 2 + 1, triangleOffset),
        radius: Radius.circular(radius));
    path.lineTo(size.width - triangleOffset, triangleHeight - triangleOffset);
    path.arcToPoint(Offset(size.width, triangleHeight + triangleOffset), radius: Radius.circular(radius));
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
