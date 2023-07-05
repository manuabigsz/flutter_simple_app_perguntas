import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuest;

  Resultado(this.pontuacao, this.quandoReiniciarQuest);

  String get fraseResult {
    if (pontuacao < 8) {
      return 'Parabéns';
    } else if (pontuacao < 12) {
      return 'vc é bom';
    } else if (pontuacao < 16) {
      return 'impresisonante';
    } else {
      return 'nivel jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: Text(
            'Reiniciar',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: quandoReiniciarQuest,
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            fraseResult,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ],
    );
  }
}
