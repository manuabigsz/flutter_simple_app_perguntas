import 'package:flutter/material.dart';
import 'package:primeiro_projeto/Questionario.dart';
import 'package:primeiro_projeto/questao.dart';
import 'package:primeiro_projeto/respostas.dart';

import 'resultado.dart';

void main() {
  runApp(MaterialApp(
    home: BemVindo(),
    routes: {
      '/bem-vindo': (context) => BemVindo(),
      '/pergunta-app': (context) => PerguntaApp(),
    },
  ));
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      'texto': 'Qual sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'nota': 10},
        {'texto': 'Vermelho', 'nota': 5},
        {'texto': 'Verde', 'nota': 3},
        {'texto': 'Branco', 'nota': 1},
      ],
    },
    {
      'texto': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'nota': 10},
        {'texto': 'Cobra', 'nota': 5},
        {'texto': 'Elefante', 'nota': 3},
        {'texto': 'Leão', 'nota': 1}
      ],
    },
    {
      'texto': 'Qual sua estação do ano favorita?',
      'respostas': [
        {'texto': 'Leo', 'nota': 10},
        {'texto': 'Maria', 'nota': 5},
        {'texto': 'João', 'nota': 3},
        {'texto': 'Pedro', 'nota': 1},
      ],
    },
  ];
  void _respoder(int pontuacao) {
    if (pergSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }

    print(_perguntaSelecionada);
  }

  bool get pergSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _reiniciarQuest() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 204, 193, 206),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          backgroundColor: Color.fromARGB(255, 149, 125, 255),
        ),
        body: Padding(
          padding: const EdgeInsets.all(50.0),
          child: pergSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  quandoResponder: _respoder,
                )
              : Resultado(_pontuacaoTotal, _reiniciarQuest),
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class BemVindo extends StatefulWidget {
  @override
  State<BemVindo> createState() => _BemVindo();
}

class _BemVindo extends State<BemVindo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 204, 193, 206),
        child: Center(
          child: Text(
            'Seja bem vindo!',
            style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/pergunta-app');
        },
      ),
    );
  }
}
