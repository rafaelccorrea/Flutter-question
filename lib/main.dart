import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './resultado.dart';
import './questionario.dart';

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

  final List<Map<String, Object>> _perguntas = const [
    {
      'pergunta': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'azul', 'nota': 10},
        {'texto': 'preto', 'nota': 8},
        {'texto': 'vermelho', 'nota': 9},
        {'texto': 'verde', 'nota': 7},
      ]
    },
    {
      'pergunta': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'cachorro', 'nota': 10},
        {'texto': 'gato', 'nota': 8},
        {'texto': 'pássaro', 'nota': 9},
        {'texto': 'peixe', 'nota': 7},
      ]
    },
    {
      'pergunta': 'Qual é a sua estação do ano preferida?',
      'respostas': [
        {'texto': 'verão', 'nota': 10},
        {'texto': 'outono', 'nota': 8},
        {'texto': 'inverno', 'nota': 9},
        {'texto': 'primavera', 'nota': 7},
      ]
    },
    {
      'pergunta': 'O que você prefere fazer nas horas vagas?',
      'respostas': [
        {'texto': 'ler', 'nota': 10},
        {'texto': 'assistir filmes', 'nota': 8},
        {'texto': 'praticar esportes', 'nota': 9},
        {'texto': 'ouvir música', 'nota': 7},
      ]
    },
    {
      'pergunta': 'Qual é o seu destino de viagem dos sonhos?',
      'respostas': [
        {'texto': 'Paris', 'nota': 10},
        {'texto': 'Tóquio', 'nota': 8},
        {'texto': 'Nova York', 'nota': 9},
        {'texto': 'Ilhas Maldivas', 'nota': 7},
      ]
    },
  ];

  void _responder() {
    setState(() {
      _perguntaSelect++;
    });
  }

  bool get selectQuestion {
    return _perguntaSelect < _perguntas.length;
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
              ? Questionario(
                  perguntas: _perguntas,
                  questionSelected: _perguntaSelect,
                  responder: _responder)
              : Resultado()),
    );
  }
}
