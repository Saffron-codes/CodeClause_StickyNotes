import 'package:flutter/material.dart';

class CurvedActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  CurvedActionButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: const EdgeInsets.all(0),
      icon: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.grey.shade800.withOpacity(.8),
            borderRadius: BorderRadius.circular(10)),
        child:  Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
