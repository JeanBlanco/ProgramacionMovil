import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Formulario();
  }
}

class _Formulario extends State<Formulario> {
  TextEditingController inputController = TextEditingController();
  List<Widget> valoresIngresados = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ejemplo formulario")),
      body: ListView(
        children: [
          Column(
            children: [
              TextField(
                controller: inputController,
                decoration: const InputDecoration(
                    hintText: "Ingrese un texto",
                    helperText: "El valor ingresado sera listado más abajo",
                    helperStyle: TextStyle(fontSize: 15)),
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        agragarTexto();
                      },
                      child: const Text("Agregar texto")),
                  const VerticalDivider(),
                  ElevatedButton(
                      onPressed: () {
                        agregarAlert();
                      },
                      child: const Text("Eliminar texto"))
                ],
              ),
              Column(children: valoresIngresados)
            ],
          )
        ],
      ),
    );
  }

  void agragarTexto() {
    String valorIngresado = inputController.text;
    setState(() {
      Widget textoNuevo = Text(valorIngresado);
      valoresIngresados.add(textoNuevo);
      inputController.text = "";
    });
  }

  void eliminarTexto() {
    if (valoresIngresados.isNotEmpty) {
      setState(() {
        valoresIngresados.removeLast();
      });
    }
  }

  void agregarAlert() {
    AlertDialog dialog = AlertDialog(
      content: const Text("¿Estas seguro que desea eliminar el ultimmo texto?"),
      actions: [
        TextButton(
            onPressed: () {
              eliminarTexto();
              Navigator.pop(context);
            },
            child: const Text("Si")),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("No"))
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }
}
