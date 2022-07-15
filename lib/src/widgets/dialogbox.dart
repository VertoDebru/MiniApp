import 'package:flutter/material.dart';

class ResetPassDialog extends StatelessWidget {
  const ResetPassDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      content: Container(
          height: 105,
          alignment: Alignment.center,
          //padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                  constraints: const BoxConstraints(minWidth: 1000),
                  alignment: Alignment.topRight,
                  icon: const Icon(
                    Icons.close,
                    color: Color.fromRGBO(216, 216, 216, 1),
                    size: 25.0,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
              const Text(
                'Vérifiez votre boîte mail',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                "Vous avez reçu un email afin de réinitialiser votre mot de passe.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(167, 173, 181, 1)),
              ),
            ],
          )),
      actions: <Widget>[
        Container(
            alignment: Alignment.center,
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextButton(
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all<Size>(const Size(140, 55)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 6, 34, 72))),
                child: const Text('Fermer',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    )),
                onPressed: () {
                  Navigator.of(context).pop();
                })),
      ],
    );
  }
}
