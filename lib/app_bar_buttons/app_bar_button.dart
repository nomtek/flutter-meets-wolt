import 'package:flutter/material.dart';

enum AppBarPosition {
  leading,
  trailing,
}

class AppBarButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final AppBarPosition position;

  const AppBarButton({Key key, this.icon, this.onPressed, this.position}) : super(key: key);

  @override
  _AppBarButtonState createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<AppBarButton> {
  bool _isHighlighted = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(widget.position == AppBarPosition.leading ? 16 : 0, 0,
          widget.position == AppBarPosition.trailing ? 16 : 0, 8),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey[300]),
          child: Opacity(
            opacity: _isHighlighted ? 0.3 : 1.0,
            child: RawMaterialButton(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onHighlightChanged: (isHighlighted) => setState(() {
                _isHighlighted = isHighlighted;
              }),
              child: Icon(
                widget.icon,
                color: Colors.black,
              ),
              onPressed: widget.onPressed,
            ),
          ),
        ),
      ),
    );
  }
}
