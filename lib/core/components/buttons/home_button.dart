import 'package:flutter/material.dart';
import 'package:sozEBay/core/init/theme/notifier/theme_notifier.dart';

class HomeButton extends StatelessWidget {
  final _route;
  final IconData _icon;
  final Color _iconColor;
  final String _buttonText;

  const HomeButton(this._route, this._icon, this._iconColor, this._buttonText,
      {super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _route,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: size.width * 0.8,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          gradient: RadialGradient(
            radius: 3,
            colors: [
              Theme.of(context).colorScheme.onTertiary,
              Theme.of(context).colorScheme.tertiary,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(_icon, color: _iconColor),
            Text(
              _buttonText,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: _iconColor,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: _iconColor,
            )
          ],
        ),
      ),
    );
  }
}
