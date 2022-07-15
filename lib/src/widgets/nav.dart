import 'package:flutter/material.dart';

class Nav extends StatelessWidget {
  final bool onTop;
  const Nav(this.onTop, {Key? key}) : super(key: key);
  //const Nav({Key? key}) : super(key: key);

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
            //ScaffoldMessenger.of(context).showSnackBar(
            //const SnackBar(content: Text('This is a snackbar')));
          },
        ),
      );
    } else {
      return const Text('Bottom');
    }
  }
}
