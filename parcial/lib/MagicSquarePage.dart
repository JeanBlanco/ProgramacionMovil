import 'package:flutter/material.dart';

class MagicSquarePage extends StatefulWidget {
  const MagicSquarePage({super.key});

  @override
  _MagicSquarePageState createState() => _MagicSquarePageState();
}

class _MagicSquarePageState extends State<MagicSquarePage>
    with SingleTickerProviderStateMixin {
  final List<TextEditingController> controllers =
      List.generate(9, (index) => TextEditingController());
  String resultMessage = '';
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );
  }

  bool isMagicSquare(List<int> square) {
    const magicSum = 15;
    return (square[0] + square[1] + square[2] == magicSum && // Row 1
        square[3] + square[4] + square[5] == magicSum && // Row 2
        square[6] + square[7] + square[8] == magicSum && // Row 3
        square[0] + square[3] + square[6] == magicSum && // Column 1
        square[1] + square[4] + square[7] == magicSum && // Column 2
        square[2] + square[5] + square[8] == magicSum && // Column 3
        square[0] + square[4] + square[8] == magicSum && // Diagonal 1
        square[2] + square[4] + square[6] == magicSum); // Diagonal 2
  }

  void validateSquare() {
    try {
      List<int> square =
          controllers.map((controller) => int.parse(controller.text)).toList();
      if (square.toSet().length != 9 ||
          square.any((num) => num < 1 || num > 9)) {
        setState(() {
          resultMessage = 'Ingresa números únicos entre 1 y 9.';
        });
      } else {
        setState(() {
          resultMessage = isMagicSquare(square)
              ? '¡Es un cuadrado mágico!'
              : 'No es un cuadrado mágico.';
        });
      }
      _animationController.forward(from: 0);
    } catch (e) {
      setState(() {
        resultMessage = 'Por favor, ingresa solo números.';
        _animationController.forward(from: 0);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validador de Cuadrado Mágico'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return TextField(
                  controller: controllers[index],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: validateSquare,
              child: const Text('Validar Cuadrado Mágico'),
            ),
            const SizedBox(height: 20),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Text(
                resultMessage,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    _animationController.dispose();
    super.dispose();
  }
}
