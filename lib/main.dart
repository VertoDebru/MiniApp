import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Mini App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: const Color.fromARGB(255, 6, 34, 72),
      title: _title,
      theme: ThemeData(
        fontFamily: 'Poppins',
        inputDecorationTheme: const InputDecorationTheme(
          filled: true, //<-- SEE HERE
          fillColor: Color.fromRGBO(2, 19, 43, 0.03), //<-- SEE HERE
        ),
      ),
      home: const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: NavTop(),
        ),
        body: MyStatefulWidget(),
      ),
    );
  }
}

class NavTop extends StatelessWidget {
  const NavTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Color.fromRGBO(2, 19, 43, 1),
          size: 20.0,
        ),
        tooltip: 'Go Back',
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('This is a snackbar')));
        },
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            // Title Box
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(50, 70, 50, 70),
                child: const Text(
                  'Connectez-vous ou créez un compte.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            // Form Box
            Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const Text('Adresse email',
                        strutStyle: StrutStyle(height: 1),
                        style: TextStyle(
                            color: Color.fromRGBO(2, 19, 43, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                    TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0),
                              gapPadding: 0),
                          hintText: 'john.doe@gmail.com',
                          hintStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(2, 19, 43, 0.4)),
                        )),
                    const Text('Mot de passe',
                        strutStyle: StrutStyle(height: 3),
                        style: TextStyle(
                            color: Color.fromRGBO(2, 19, 43, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                    TextFormField(
                        obscureText: isVisible,
                        textAlign: TextAlign.left,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0),
                              gapPadding: 0),
                          hintText: 'Mot de passe',
                          hintStyle: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(2, 19, 43, 0.4)),
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          suffixIcon: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween, // added line
                            mainAxisSize: MainAxisSize.min, // added line
                            children: <Widget>[
                              IconButton(
                                icon: Icon(isVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  // Change icon.
                                  if (isVisible) {
                                    isVisible = false;
                                  } else {
                                    isVisible = true;
                                  }
                                },
                              ),
                            ],
                          ),
                        )),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Mot de passe oublié ?',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(167, 173, 181, 1)),
                ),
                TextButton(
                  child: const Text(
                    'Réinitialiser',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(2, 19, 43, 1),
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid),
                  ),
                  onPressed: () {
                    //reset password screen
                    print('Opening popup for reset password...');
                  },
                ),
              ],
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 6, 34, 72)),
                  ),
                  child: const Text(
                    'Connexion',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {
                    // Login script
                    print(emailController.text);
                    print(passwordController.text);
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Pas encore de compte ?',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(167, 173, 181, 1))),
                TextButton(
                  child: const Text(
                    'Créer maintenant',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(2, 19, 43, 1),
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid),
                  ),
                  onPressed: () {
                    //signup screen
                    print('Go to Signup page...');
                  },
                )
              ],
            ),
          ],
        ));
  }
}
