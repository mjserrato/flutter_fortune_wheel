import 'package:flutter/material.dart';

class _TrianglePainter extends CustomPainter {
  final Color fillColor;
  final Color strokeColor;
  final double strokeWidth;
  final double elevation;

  const _TrianglePainter({
    @required this.fillColor,
    this.strokeColor,
    this.strokeWidth = 1,
    this.elevation = 0,
  })  : assert(fillColor != null),
        assert(strokeWidth != null),
        assert(elevation != null);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, 0);

    final strokeColor = this.strokeColor ?? fillColor;
    final fillPaint = Paint()..color = fillColor;
    final strokePaint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawShadow(path, Colors.black, elevation, true);
    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, strokePaint);
  }

  @override
  bool shouldRepaint(_TrianglePainter oldDelegate) {
    return fillColor != oldDelegate.fillColor;
  }
}

class Triangle extends StatelessWidget {
  final Color fillColor;
  final Color strokeColor;
  final double strokeWidth;
  final double elevation;

  const Triangle({
    @required this.fillColor,
    this.strokeColor,
    this.strokeWidth = 1,
    this.elevation = 0,
  })  : assert(fillColor != null),
        assert(strokeWidth != null),
        assert(elevation != null);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TrianglePainter(
        fillColor: fillColor,
        strokeColor: strokeColor,
        strokeWidth: strokeWidth,
        elevation: elevation,
      ),
    );
  }
}
