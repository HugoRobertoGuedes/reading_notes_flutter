import 'package:flutter/material.dart';

/* *
 * * Header Bar Custom
 */

class CustomAppBar extends StatefulWidget {
  String nameBar;

  CustomAppBar({@required this.nameBar});

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        widget.nameBar,
        style: TextStyle(fontFamily: 'Schyler', fontWeight: FontWeight.w900),
      ),
    );
  }
}
