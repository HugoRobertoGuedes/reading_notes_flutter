import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class Menu extends StatefulWidget {
  Function func;
  int customSelectedindex = 0;
  bool setCustomIndex = false;

  Menu({@required this.func, this.customSelectedindex = 0, this.setCustomIndex = false});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 40, color: Colors.black.withOpacity(.4))
      ]),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
              gap: 2,
              activeColor: Colors.white,
              iconSize: 20,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              duration: Duration(milliseconds: 100),
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                  textColor: Colors.white,
                  iconActiveColor: Colors.white,
                  backgroundColor: Colors.purpleAccent[100],
                ),
                GButton(
                  icon: LineIcons.list,
                  text: 'Notas',
                  backgroundColor: Colors.indigoAccent,
                ),
                GButton(
                  icon: LineIcons.book,
                  text: 'E-books',
                  backgroundColor: Colors.greenAccent,
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: 'Favoritos',
                  backgroundColor: Colors.cyan,
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Perfil',
                  backgroundColor: Colors.indigo,
                )
              ],
              selectedIndex: widget.setCustomIndex
                  ? widget.customSelectedindex
                  : _selectedIndex,
              onTabChange: (index) {
                widget.func(index);
                setState(() {
                  widget.setCustomIndex = false;
                  _selectedIndex = index;
                });
              }),
        ),
      ),
    );
  }
}
