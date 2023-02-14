import 'package:flutter/material.dart';

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
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(61, 90, 128, 1),
              Color.fromRGBO(74, 28, 119, 1),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(_icon, color: _iconColor),
            Text(
              _buttonText,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(224, 251, 252, 1),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
