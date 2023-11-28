import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() _resetQuestion;

  const Resultado(this.pontuacao, this._resetQuestion, {super.key});

  String get textResult {
    if (pontuacao < 36) {
      return "Parabéns!";
    } else if (pontuacao < 43) {
      return "Excelente!";
    } else if (pontuacao < 47) {
      return "Impressionante!";
    } else if (pontuacao > 49) {
      return "Monstro sagrado!";
    } else {
      return 'Boa!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            textResult,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
            height: 20), // Adiciona um espaço entre o texto e o botão
        TextButton(
          onPressed: _resetQuestion,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xFF6763BF)),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            minimumSize: MaterialStateProperty.all(Size(150, 30)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          child: const Text(
            'Reiniciar',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    );
  }
}
