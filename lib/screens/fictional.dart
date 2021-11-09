import 'package:flutter/material.dart';

class Fictional extends StatelessWidget {
  const Fictional({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      color: Colors.red,
      child: Text("fictional"),
    );
  }
}
