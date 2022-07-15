import 'package:flutter/material.dart';

class Nav extends StatelessWidget {
  final bool onTop;
  const Nav(this.onTop, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (onTop == true) {
      return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Theme.of(context).primaryColor,
            size: 20.0,
          ),
          tooltip: 'Go Back',
          onPressed: () {
            print(Navigator.of(context));
          },
        ),
      );
    } else {
      return const Text('Bottom');
    }
  }
}
