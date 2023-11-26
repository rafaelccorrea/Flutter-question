import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function()? onPressed;

  Resposta(this.texto, {required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
        ),
        onPressed: onPressed,
        child: Text(
          texto,
          style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
      ),
    );
  }
}
