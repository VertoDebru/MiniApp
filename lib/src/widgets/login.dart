import 'package:flutter/material.dart';

import 'dialogbox.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isVisible = true;

  // Change obscureText in password field.
  void setVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            // Title Box
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(50),
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
                          ),
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
                        obscureText: _isVisible,
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
                                color: const Color.fromRGBO(184, 184, 184, 1),
                                icon: Icon(_isVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setVisible();
                                },
                              ),
                            ],
                          ),
                        )),
                  ],
                )),
            // Forget Password
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
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          const ResetPassDialog(),
                    );
                  },
                ),
              ],
            ),
            // Connexion Button
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
            // Register Link
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
