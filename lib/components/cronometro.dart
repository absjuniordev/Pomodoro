import 'package:flutter/material.dart';

import 'cronometro_button.dart';

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
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: CronometroButton(
                  texto: "Iniciar",
                  icon: Icons.play_arrow,
                ),
              ),
              // Padding(
              // padding: EdgeInsets.only(right: 10),
              //   child: CronometroButton(
              //     texto: "Parar",
              //     icon: Icons.stop,
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: CronometroButton(
                  texto: "Reiniciar",
                  icon: Icons.refresh,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
