import 'package:flutter/material.dart';

class Tarjetacontacto extends StatelessWidget {
  String nombre = '';
  String terlefono = '';
  IconData nombreIcono = Icons.ac_unit;

  Tarjetacontacto(this.nombre, this.terlefono, this.nombreIcono, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: new Column(
        children: [
          Text(this.nombre,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey)),
          Text(this.terlefono, style: new TextStyle(fontSize: 25)),
          Icon(this.nombreIcono)
        ],
      ),
    );
  }
}
