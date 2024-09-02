import 'package:flutter/material.dart';

class Frase extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Frase();
  }
}

class _Frase extends State<Frase> {
  String textoAMostrar = '';
  List<String> frase = ['Este', 'es', 'una', 'practica', 'con', 'flutter'];
  int indice = 0;
  Frase() {
    this.textoAMostrar = frase[indice];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo SteaFull'),
      ),
      body: Column(
        children: [
          Text(this.textoAMostrar),
          ElevatedButton(
              onPressed: () {
                mostrarSiguientePlabra();
              },
              child: Text('Siguiente palabra')),
        ],
      ),
    );
  }

  void mostrarSiguientePlabra() {
    if (this.indice < this.frase.length) {
      indice++;
    } else {
      indice = 0;
    }
    setState(() {
      this.textoAMostrar = frase[indice];
    });
  }
}
