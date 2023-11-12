import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();


    // Path number 1


    paint.color = Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.3, size.height * 0.45);
    canvas.drawPath(path, paint);


    // Path number 2


    paint.color = Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width / 4, size.height * 0.32);
    path.cubicTo(size.width * 0.27, size.height * 0.32, size.width * 0.3, size.height * 0.44, size.width * 0.3, size.height * 0.44);
    path.cubicTo(size.width * 0.3, size.height * 0.44, size.width * 0.43, size.height * 0.43, size.width * 0.44, size.height * 0.46);
    path.cubicTo(size.width * 0.44, size.height * 0.48, size.width / 3, size.height * 0.55, size.width / 3, size.height * 0.55);
    path.cubicTo(size.width / 3, size.height * 0.55, size.width * 0.39, size.height * 0.66, size.width * 0.36, size.height * 0.68);
    path.cubicTo(size.width * 0.34, size.height * 0.69, size.width / 4, size.height * 0.61, size.width / 4, size.height * 0.61);
    path.cubicTo(size.width / 4, size.height * 0.61, size.width * 0.15, size.height * 0.69, size.width * 0.13, size.height * 0.68);
    path.cubicTo(size.width * 0.11, size.height * 0.66, size.width * 0.16, size.height * 0.55, size.width * 0.16, size.height * 0.55);
    path.cubicTo(size.width * 0.16, size.height * 0.55, size.width * 0.05, size.height * 0.48, size.width * 0.06, size.height * 0.46);
    path.cubicTo(size.width * 0.07, size.height * 0.43, size.width * 0.19, size.height * 0.45, size.width * 0.19, size.height * 0.45);
    path.cubicTo(size.width * 0.19, size.height * 0.45, size.width * 0.22, size.height * 0.32, size.width / 4, size.height * 0.32);
    path.cubicTo(size.width / 4, size.height * 0.32, size.width / 4, size.height * 0.32, size.width / 4, size.height * 0.32);
    canvas.drawPath(path, paint);


    // Path number 3


    paint.color = Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.75, size.height * 0.32);
    path.cubicTo(size.width * 0.77, size.height * 0.32, size.width * 0.8, size.height * 0.44, size.width * 0.8, size.height * 0.44);
    path.cubicTo(size.width * 0.8, size.height * 0.44, size.width * 0.93, size.height * 0.43, size.width * 0.93, size.height * 0.46);
    path.cubicTo(size.width * 0.94, size.height * 0.48, size.width * 0.83, size.height * 0.55, size.width * 0.83, size.height * 0.55);
    path.cubicTo(size.width * 0.83, size.height * 0.55, size.width * 0.88, size.height * 0.66, size.width * 0.86, size.height * 0.68);
    path.cubicTo(size.width * 0.84, size.height * 0.69, size.width * 0.75, size.height * 0.61, size.width * 0.75, size.height * 0.61);
    path.cubicTo(size.width * 0.75, size.height * 0.61, size.width * 0.65, size.height * 0.69, size.width * 0.63, size.height * 0.68);
    path.cubicTo(size.width * 0.61, size.height * 0.66, size.width * 0.66, size.height * 0.55, size.width * 0.66, size.height * 0.55);
    path.cubicTo(size.width * 0.66, size.height * 0.55, size.width * 0.55, size.height * 0.48, size.width * 0.56, size.height * 0.46);
    path.cubicTo(size.width * 0.57, size.height * 0.43, size.width * 0.69, size.height * 0.45, size.width * 0.69, size.height * 0.45);
    path.cubicTo(size.width * 0.69, size.height * 0.45, size.width * 0.72, size.height * 0.32, size.width * 0.75, size.height * 0.32);
    path.cubicTo(size.width * 0.75, size.height * 0.32, size.width * 0.75, size.height * 0.32, size.width * 0.75, size.height * 0.32);
    canvas.drawPath(path, paint);


    // Path number 4


    paint.color = Color(0xffffffff).withOpacity(0);
    path = Path();
    path.lineTo(size.width * 0.92, size.height);
    path.cubicTo(size.width * 0.92, size.height, size.width * 0.08, size.height, size.width * 0.08, size.height);
    path.cubicTo(size.width * 0.04, size.height, 0, size.height * 0.96, 0, size.height * 0.92);
    path.cubicTo(0, size.height * 0.92, 0, size.height * 0.08, 0, size.height * 0.08);
    path.cubicTo(0, size.height * 0.04, size.width * 0.04, 0, size.width * 0.08, 0);
    path.cubicTo(size.width * 0.08, 0, size.width * 0.92, 0, size.width * 0.92, 0);
    path.cubicTo(size.width * 0.96, 0, size.width, size.height * 0.04, size.width, size.height * 0.08);
    path.cubicTo(size.width, size.height * 0.08, size.width, size.height * 0.92, size.width, size.height * 0.92);
    path.cubicTo(size.width, size.height * 0.96, size.width * 0.96, size.height, size.width * 0.92, size.height);
    path.cubicTo(size.width * 0.92, size.height, size.width * 0.92, size.height, size.width * 0.92, size.height);
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}