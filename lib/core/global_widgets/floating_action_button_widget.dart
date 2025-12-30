import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  const FloatingActionButtonWidget({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xffC58BF2), Color(0xffEEA4CE)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: FloatingActionButton(
        splashColor: Colors.transparent,
        highlightElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: onPressed,
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }
}
