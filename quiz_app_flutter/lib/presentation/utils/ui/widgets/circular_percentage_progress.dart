import 'dart:math';

import 'package:flutter/material.dart';

class CircularPercentageProgress extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final double size;
  final double strokeWidth;
  final Color progressColor;
  final Color backgroundColor;
  final TextStyle percentageTextStyle;

  const CircularPercentageProgress({
    Key? key,
    required this.progress,
    this.size = 50,
    this.strokeWidth = 8,
    this.progressColor = Colors.green,
    this.backgroundColor = Colors.grey,
    this.percentageTextStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circle
          SizedBox(
            width: size,
            height: size,
            child: CustomPaint(
              painter: _CirclePainter(
                progress: 1.0,
                color: backgroundColor,
                strokeWidth: strokeWidth,
              ),
            ),
          ),
          // Progress circle
          SizedBox(
            width: size,
            height: size,
            child: CustomPaint(
              painter: _CirclePainter(
                progress: progress,
                color: progressColor,
                strokeWidth: strokeWidth,
              ),
            ),
          ),
          // Percentage Text
          Text('${(progress * 100).toInt()}%', style: percentageTextStyle),
        ],
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  _CirclePainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * progress,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant _CirclePainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
