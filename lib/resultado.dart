import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuest;

  Resultado(this.pontuacao, this.quandoReiniciarQuest);

  String get fraseResult {
    if (pontuacao < 8) {
      return 'Parabéns! Você fez $pontuacao pontos.';
    } else if (pontuacao < 12) {
      return 'Você é bom. Você fez $pontuacao pontos.';
    } else if (pontuacao < 16) {
      return 'Muito impressionante! Você fez $pontuacao pontos.';
    } else {
      return 'Você é um Jedi! Você fez $pontuacao pontos.';
    }
  }

  @override
  Widget build(BuildContext context) {
    double larguraDisponivel = MediaQuery.of(context).size.width - 200;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResult,
            style: TextStyle(fontSize: 25, color: Colors.purple),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: larguraDisponivel,
          height: 80,
          child: ElevatedButton(
            child: Text(
              'Reiniciar',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: quandoReiniciarQuest,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 149, 125, 255),
              textStyle: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
