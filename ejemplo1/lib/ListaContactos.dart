import 'package:ejemplo1/TarjetaContacto.dart';
import 'package:flutter/material.dart';

class Listacontactos extends StatelessWidget {
  const Listacontactos({super.key});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Mi app contacto')),
      body: new ListView(
        children: [
          new Column(
            children: [
              Tarjetacontacto('Jean', '312684517', Icons.person),
              Tarjetacontacto('Jean', '312684517', Icons.person),
              Tarjetacontacto('Jean', '312684517', Icons.person),
              Tarjetacontacto('Jean', '312684517', Icons.person),
              Tarjetacontacto('Jean', '312684517', Icons.person),
              Tarjetacontacto('Jean', '312684517', Icons.person),
              Tarjetacontacto('Jean', '312684517', Icons.person),
              Tarjetacontacto('Jean', '312684517', Icons.person),
              Tarjetacontacto('Jean', '312684517', Icons.person),
              Tarjetacontacto('Jean', '312684517', Icons.person),
            ],
          )
        ],
      ),
    );
  }
}
