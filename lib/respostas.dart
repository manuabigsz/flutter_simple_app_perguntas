import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() onSelecao;

  Resposta(this.texto, this.onSelecao);

  @override
  Widget build(BuildContext context) {
    double larguraDisponivel = MediaQuery.of(context).size.width - 200;

    return Container(
      width: larguraDisponivel,
      height: 80,
      child: ElevatedButton(
        onPressed: onSelecao,
        child: Text(texto),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 149, 125, 255),
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
