import 'package:flutter/material.dart';

import 'widgets/nav.dart';
import 'widgets/login.dart';

class KosmosApp extends StatefulWidget {
  const KosmosApp({super.key});

  @override
  State<KosmosApp> createState() => _KosmosAppState();
}

// This widget is the root of your application.
class _KosmosAppState extends State<KosmosApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kosmos App',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color.fromRGBO(2, 19, 43, 1),
        backgroundColor: Colors.white,
        fontFamily: 'Poppins',
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color.fromRGBO(2, 19, 43, 0.03),
        ),
      ),
      color: Theme.of(context).primaryColor,
      home: const Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Nav(true),
        ),
        bottomNavigationBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Nav(false),
        ),
        body: Login(),
      ),
    );
  }
}
