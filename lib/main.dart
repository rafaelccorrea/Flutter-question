import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

void main() {
  runApp(new PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelect = 0;

  final List<Map<String, dynamic>> _perguntas = const [
    {
      'pergunta': 'Qual é a sua cor?',
      'respostas': ['azul', 'preto', 'vermelho', 'verde']
    },
    {
      'pergunta': 'Qual é seu nome?',
      'respostas': ['Rafael', 'Edinho', 'Gabi Gol', 'Helena']
    }
  ];

  void _responder() {
    setState(() {
      _perguntaSelect++;
    });
  }

  bool get selectQuestion {
    return _perguntaSelect < _perguntas.length;
  }

  List<Widget> _gerarListaDeRespostas(List<String>? respostas) {
    if (respostas == null) return [];

    return respostas
        .map((resposta) => Resposta(resposta, onPressed: _responder))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<String>? respostas = selectQuestion
        ? (_perguntas[_perguntaSelect]['respostas'] as List<Object?>)
            ?.cast<String>()
        : null;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Perguntas',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.purple,
          leading: const Icon(
            Icons.question_answer,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        body: selectQuestion
            ? Column(
                children: <Widget>[
                  Questao(_perguntas[_perguntaSelect]['pergunta'] as String),
                  ..._gerarListaDeRespostas(respostas),
                ],
              )
            : const Center(
                child: Text(
                  'Você concluiu o questionário!',
                  style: TextStyle(fontSize: 20),
                ),
              ),
      ),
    );
  }
}
