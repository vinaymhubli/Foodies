import 'package:flutter/material.dart';

class HalfFilledIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;

  HalfFilledIcon({required this.icon, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (Rect rect) {
        return LinearGradient(
          stops: [0, 0.5, 0.5],
          colors: [color, color, color.withOpacity(0)],
        ).createShader(rect);
      },
      child: SizedBox(
        width: size,
        height: size,
        child: Icon(icon, size: size, color: Colors.white),
      ),
    );
  }
}
