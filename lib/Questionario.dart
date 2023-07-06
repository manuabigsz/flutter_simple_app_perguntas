import 'package:flutter/material.dart';
import './questao.dart';

import 'respostas.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) quandoResponder;

  const Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.quandoResponder,
    super.key,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : [];

    return Column(
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'] as String),
        SizedBox(
            height:
                10), // Adiciona um SizedBox com altura de 10 entre os elementos
        ...respostas.map((resp) {
          return Column(
            children: [
              Resposta(
                resp['texto'].toString(),
                () => quandoResponder(int.parse(resp['nota'].toString())),
              ),
              SizedBox(
                  height:
                      10), // Adiciona um SizedBox com altura de 10 entre as respostas
            ],
          );
        }).toList(),
      ],
    );
  }
}
