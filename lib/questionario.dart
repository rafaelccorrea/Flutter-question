import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, dynamic>> perguntas;
  final int questionSelected;
  final void Function() responder;

  Questionario({
    required this.perguntas,
    required this.questionSelected,
    required this.responder,
  });

  bool get selectQuestion {
    return questionSelected < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _gerarListaDeRespostas(List<String>? respostas) {
      if (respostas == null) return [];

      return respostas
          .map((resposta) => Resposta(resposta, onPressed: responder))
          .toList();
    }

    final List<String>? respostas = selectQuestion
        ? (perguntas[questionSelected]['respostas'] as List<Object?>)
            ?.cast<String>()
        : null;

    return Column(
      children: <Widget>[
        Questao(perguntas[questionSelected]['pergunta'] as String),
        ..._gerarListaDeRespostas(respostas),
      ],
    );
  }
}
