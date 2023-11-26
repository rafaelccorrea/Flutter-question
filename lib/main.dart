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

  final List<Map<String, dynamic>> _perguntas = const [
    {
      'pergunta': 'Qual é o seu animal favorito?',
      'respostas': ['cachorro', 'gato', 'pássaro', 'peixe']
    },
    {
      'pergunta': 'Qual é a sua estação do ano preferida?',
      'respostas': ['verão', 'outono', 'inverno', 'primavera']
    },
    {
      'pergunta': 'O que você prefere fazer nas horas vagas?',
      'respostas': [
        'ler',
        'assistir filmes',
        'praticar esportes',
        'ouvir música'
      ]
    },
    {
      'pergunta': 'Qual é o seu destino de viagem dos sonhos?',
      'respostas': ['Paris', 'Tóquio', 'Nova York', 'Ilhas Maldivas']
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
