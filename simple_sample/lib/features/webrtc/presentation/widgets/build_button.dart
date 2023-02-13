import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  final String title;
  final Function? callback;
  const BuildButton(
    this.title,
    this.callback, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: 200,
        child: Text(title),
        color: Theme.of(context).primaryColor,
        textColor: Colors.white,
        onPressed: () => callback?.call());
  }
}
