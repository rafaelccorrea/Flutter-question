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
  int _pontuacaoTotal = 0;
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
        {'texto': 'azul', 'pontuacao': 10},
        {'texto': 'preto', 'pontuacao': 8},
        {'texto': 'vermelho', 'pontuacao': 9},
        {'texto': 'verde', 'pontuacao': 7},
      ]
    },
    {
      'pergunta': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'cachorro', 'pontuacao': 10},
        {'texto': 'gato', 'pontuacao': 8},
        {'texto': 'pássaro', 'pontuacao': 9},
        {'texto': 'peixe', 'pontuacao': 7},
      ]
    },
    {
      'pergunta': 'Qual é a sua estação do ano preferida?',
      'respostas': [
        {'texto': 'verão', 'pontuacao': 10},
        {'texto': 'outono', 'pontuacao': 8},
        {'texto': 'inverno', 'pontuacao': 9},
        {'texto': 'primavera', 'pontuacao': 7},
      ]
    },
    {
      'pergunta': 'O que você prefere fazer nas horas vagas?',
      'respostas': [
        {'texto': 'ler', 'pontuacao': 10},
        {'texto': 'assistir filmes', 'pontuacao': 8},
        {'texto': 'praticar esportes', 'pontuacao': 9},
        {'texto': 'ouvir música', 'pontuacao': 7},
      ]
    },
    {
      'pergunta': 'Qual é o seu destino de viagem dos sonhos?',
      'respostas': [
        {'texto': 'Paris', 'pontuacao': 10},
        {'texto': 'Tóquio', 'pontuacao': 8},
        {'texto': 'Nova York', 'pontuacao': 9},
        {'texto': 'Ilhas Maldivas', 'pontuacao': 7},
      ]
    },
  ];

  void _responder(int pontuacao) {
    if (selectQuestion) {
      setState(() {
        _perguntaSelect++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void restartQuestion() {
    setState(() {
      _perguntaSelect = 0;
      _pontuacaoTotal = 0;
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
              : Resultado(_pontuacaoTotal, restartQuestion)),
    );
  }
}
