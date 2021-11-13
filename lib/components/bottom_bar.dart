// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shopsy/screens/chatbot.dart';

class BottomBar extends StatefulWidget {
  int? selectedTab = 0;
  Function(int) onPressed;
  BottomBar({Key? key, this.selectedTab, required this.onPressed})
      : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    _selectedTab = widget.selectedTab ?? 0;

    return Stack(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BottomBarBtn(
                imagePath: "assets/images/home.png",
                onPressed: () {
                  widget.onPressed(0);
                },
                selected: _selectedTab == 0 ? true : false,
              ),
              BottomBarBtn(
                imagePath: "assets/images/search.png",
                onPressed: () {
                  widget.onPressed(1);
                },
                selected: _selectedTab == 1 ? true : false,
              ),
              BottomBarBtn(
                imagePath: "assets/images/bookmark.png",
                selected: _selectedTab == 2 ? true : false,
                onPressed: () {
                  widget.onPressed(2);
                },
              ),
              BottomBarBtn(
                imagePath: "assets/images/setting-profile.png",
                selected: _selectedTab == 3 ? true : false,
                onPressed: () {
                  widget.onPressed(3);
                },
              ),
            ],
          ),
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1.0,
                blurRadius: 20.0,
              )
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
          ),
        ),
      ],
    );
  }
}

class BottomBarBtn extends StatelessWidget {
  final String? imagePath;
  bool? selected;
  final Function() onPressed;
  BottomBarBtn(
      {Key? key, this.imagePath, this.selected, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
            border: Border(
          top: BorderSide(
            color:
                _selected ? Theme.of(context).primaryColor : Colors.transparent,
            width: 2.0,
            style: BorderStyle.solid,
          ),
        )),
        child: Image(
          image: AssetImage(imagePath ?? "assets/images/home.png"),
          color: _selected ? Theme.of(context).primaryColor : Colors.black,
        ),
      ),
    );
  }
}
