import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ConicalContainerPainter extends CustomPainter {
  final ui.Image? image;
  final Color color;

  ConicalContainerPainter({super.repaint, required this.color, this.image});

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height * 0.95;
    double cornerRadius = 40.0;
    double coneHeight = height * 0.18;
    double tipRadius = height * 0.04;

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, height - cornerRadius)
      ..arcToPoint(Offset(cornerRadius, height),
          radius: Radius.circular(cornerRadius), clockwise: false)
      ..lineTo(width / 2 - coneHeight / 1.6, height)
      ..lineTo(width / 2 - tipRadius, height + coneHeight - tipRadius)
      ..arcToPoint(
          Offset(width / 2 + tipRadius, height + coneHeight - tipRadius),
          radius: Radius.circular(tipRadius + 2),
          clockwise: false)
      ..lineTo(width / 2 + coneHeight / 1.6, height)
      ..lineTo(width - cornerRadius, height)
      ..arcToPoint(Offset(width, height - cornerRadius),
          radius: Radius.circular(cornerRadius), clockwise: false)
      ..lineTo(width, 0)
      ..close();

    Paint paint = Paint()..style = PaintingStyle.fill;
    paint.color = color;
    canvas.drawPath(path, paint);

    if (image != null) {
      canvas.clipPath(path);

      paintImage(
        canvas: canvas,
        rect: Rect.fromLTWH(0, 0, size.width, size.height * 1.1),
        image: image!,
        fit: BoxFit.cover,
      );

      Rect rect = Rect.fromLTWH(0, 0, size.width, size.height * 1.1);
      Paint gradientPaint = Paint()
        ..shader = ui.Gradient.linear(
          Offset(0, rect.height * 0.1),
          Offset(0, rect.height),
          [Colors.transparent, Colors.black.withOpacity(0.8)],
        );
      canvas.drawRect(rect, gradientPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
