import 'package:flutter/material.dart';

class TaxiButton extends StatelessWidget {
  final String text;
  final Color color;
  final void Function() onPressed;

  const TaxiButton({
    super.key,
    required this.color,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
        child: SizedBox(
            width: 350,
            height: 60,
            child: Center(
                child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ))));
  }
}
