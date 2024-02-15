import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton(
      {super.key, required this.tapped, required this.buttonTitle});

  final void Function() tapped;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapped,
      child: Container(
        color: const Color.fromARGB(255, 202, 32, 83),
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(bottom: 20),
        width: double.infinity,
        height: 80,
        child: Center(
          child: Text(
            buttonTitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              height: 3,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
