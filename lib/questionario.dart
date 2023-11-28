import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int questionSelected;
  final void Function(int) responder;

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
    List<Widget> _gerarListaDeRespostas(List<Map<String, Object>>? respostas) {
      if (respostas == null) return [];

      return respostas
          .map((resposta) => Resposta(resposta['texto'] as String,
              onPressed: () => responder(resposta['pontuacao'] as int)))
          .toList();
    }

    final List<Map<String, Object>>? respostas = selectQuestion
        ? (perguntas[questionSelected]['respostas']
            as List<Map<String, Object>>)
        : null;

    return Column(
      children: <Widget>[
        Questao(perguntas[questionSelected]['pergunta'] as String),
        ..._gerarListaDeRespostas(respostas),
      ],
    );
  }
}
