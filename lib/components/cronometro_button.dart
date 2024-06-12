import 'package:flutter/material.dart';

class CronometroButton extends StatelessWidget {
  final String texto;
  final IconData icon;
  const CronometroButton({super.key, required this.texto, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 15,
          ),
          textStyle: const TextStyle(fontSize: 25),
        ),
        onPressed: () {},
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
            ),
            Text(
              texto,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ));
  }
}
