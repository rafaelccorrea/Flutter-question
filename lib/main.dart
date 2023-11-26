import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new PerguntaApp());
}

class PerguntaApp extends StatefulWidget {
  @override
  State<PerguntaApp> createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _perguntaSelect = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

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
    // Se estiver carregando, exibir o splash screen
    if (_isLoading) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(
            child: SpinKitFadingCube(
              color: Color(0xFFB21DF2),
              size: 50.0,
            ),
          ),
        ),
      );
    }

    final List<String>? respostas = selectQuestion
        ? (_perguntas[_perguntaSelect]['respostas'] as List<Object?>)
            ?.cast<String>()
        : null;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Perguntas',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFFB21DF2),
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
