import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function()? onPressed;

  Resposta(this.texto, {required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      child: InkWell(
        onTap: onPressed,
        child: Ink(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          decoration: BoxDecoration(
            color: const Color(0xFFB21DF2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  texto,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.question_mark_rounded,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
