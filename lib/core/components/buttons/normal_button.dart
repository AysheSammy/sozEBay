import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class NormalButton extends StatelessWidget {
  const NormalButton(
      {super.key, required this.child, this.onPressed, this.style});

  final VoidCallback? onPressed;
  final ButtonStyle? style;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        gradient: const LinearGradient(
          colors: [
            Color.fromRGBO(61, 90, 128, 1),
            Color.fromRGBO(74, 28, 119, 1),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: child,
      ),
    );
  }
}
