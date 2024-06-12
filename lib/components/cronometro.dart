import 'package:flutter/material.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hora de Trabalhar",
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "00:00:00",
            style: TextStyle(
              fontSize: 100,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
