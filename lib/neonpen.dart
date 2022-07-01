library neonpen;

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'util/widget_size.dart';

class Neonpen extends StatefulWidget {
  final Text text;
  final Color color;
  final double opacity;
  final EdgeInsets padding;
  final double emphasisWidth;
  final double emphasisOpacity;
  final double emphasisDegree;
  final bool enableLineZiggle;
  final int lineZiggleDegree;
  final bool isDoubleLayer;

  Neonpen({
    @required this.text,
    @required this.color,
    this.opacity,
    this.padding,
    this.emphasisWidth,
    this.emphasisOpacity,
    this.emphasisDegree,
    this.enableLineZiggle,
    this.lineZiggleDegree,
    this.isDoubleLayer,
  });

  @override
  _NeonpenState createState() => _NeonpenState();
}

class _NeonpenState extends State<Neonpen> {
  Size textWidgetSize = Size.zero;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        WidgetSize(
          onChange: (Size size) {
            textWidgetSize = size;
            print(size);
            setState(() {});
          },
          child: widget.text,
        ),
        CustomPaint(
          painter: NeonPainter(
            width: textWidgetSize.width,
            height: textWidgetSize.height,
            color: widget.color,
            padding: widget.padding,
            opacity: widget.opacity,
            emphasisWidth: widget.emphasisWidth,
            emphasisOpacity: widget.emphasisOpacity,
            emphasisDegree: widget.emphasisDegree,
            enableLineZiggle: widget.enableLineZiggle,
            lineZiggleDegree: widget.lineZiggleDegree,
            isDoubleLayer: widget.isDoubleLayer,
          ),
        )
      ],
    );
  }
}

class NeonPainter extends CustomPainter {
  final double width;
  final double height;
  final double opacity;
  final Color color;
  final EdgeInsets padding;
  final double emphasisWidth;
  final double emphasisOpacity;
  final double emphasisDegree;
  final bool enableLineZiggle;
  final int lineZiggleDegree;
  final bool isDoubleLayer;

  final _random = Random();

  NeonPainter({
    @required double width,
    @required double height,
    double opacity,
    Color color,
    EdgeInsets padding,
    double emphasisWidth,
    double emphasisOpacity,
    double emphasisDegree,
    bool enableLineZiggle,
    int lineZiggleDegree,
    bool isDoubleLayer,
  })  : this.width = width,
        this.height = height,
        this.opacity = opacity ?? 0.5,
        this.color = color ?? Colors.red,
        this.padding = padding ?? EdgeInsets.symmetric(horizontal: 5),
        this.emphasisWidth = emphasisWidth ?? 5,
        this.emphasisOpacity = emphasisOpacity ?? (opacity + 0.05),
        this.emphasisDegree = emphasisDegree ?? 1,
        this.enableLineZiggle = enableLineZiggle ?? false,
        this.lineZiggleDegree = lineZiggleDegree ?? 1,
        this.isDoubleLayer = isDoubleLayer ?? false;

  @override
  void paint(Canvas canvas, Size size) {
    final double startX = 0 - padding.left;
    final double endX = width + padding.right;
    final double startY = 0 - padding.top;
    final double endY = height + padding.bottom;

    if (isDoubleLayer == false) {
      drawNeonpen(
        canvas: canvas,
        x: startX,
        y: startY,
        width: endX,
        height: endY,
      );
    } else {
      drawNeonpen(
        canvas: canvas,
        x: startX,
        y: startY,
        width: endX,
        height: height * 2 / 3 + padding.bottom * 3 / 4,
      );
      drawNeonpen(
        canvas: canvas,
        x: startX + 5,
        y: height * 2 / 3 - padding.bottom * 3 / 4,
        width: endX + 5,
        height: endY,
      );
    }
  }

  void drawNeonpen({
    @required Canvas canvas,
    double x = 0,
    double y = 0,
    @required double height,
    @required double width,
  }) {
    final double startX = x;
    final double endX = width;
    final double startY = y;
    final double endY = height;
    final double leftRightDistance = 3.0 * emphasisDegree;

    // Draw main neon line
    Paint paint = Paint()
      ..color = color.withOpacity(opacity)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.addPolygon([
      Offset(startX, startY),
      if (enableLineZiggle)
        ...makeRandomOffset(startX, endX, startY, 50 * lineZiggleDegree,
            0.3 * lineZiggleDegree),
      Offset(endX, startY),
      Offset(endX - leftRightDistance, endY),
      if (enableLineZiggle)
        ...makeRandomOffset(
            startX - leftRightDistance,
            endX - leftRightDistance,
            endY,
            50 * lineZiggleDegree,
            0.3 * lineZiggleDegree,
            reverse: true),
      Offset(startX - leftRightDistance, endY),
    ], true);
    canvas.drawPath(path, paint);

    // Draw left, right emphasis line
    Paint emphasisPaint = Paint()
      ..color = color.withOpacity(emphasisOpacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = emphasisWidth;

    Path leftEmphasisPath = Path();
    leftEmphasisPath.moveTo(startX + (emphasisWidth / 2), startY);
    leftEmphasisPath.lineTo(
        startX + (emphasisWidth / 2) - leftRightDistance, endY);

    Path rightEmphasisPath = Path();
    rightEmphasisPath.moveTo(endX - (emphasisWidth / 2), startY);
    rightEmphasisPath.lineTo(
        endX - (emphasisWidth / 2) - leftRightDistance, endY);

    leftEmphasisPath.addPath(rightEmphasisPath, Offset.zero);
    leftEmphasisPath.close();

    canvas.drawPath(leftEmphasisPath, emphasisPaint);
  }

  @override
  bool shouldRepaint(covariant NeonPainter oldDelegate) {
    // return oldDelegate.width != this.width ||
    //     oldDelegate.height != this.height ||
    //     oldDelegate.color != this.color ||
    //     oldDelegate.opacity != this.opacity ||
    //     oldDelegate.padding != this.padding ||
    //     oldDelegate.emphasisWidth != this.emphasisWidth;
    return true;
  }

  double doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;

  List<Offset> makeRandomOffset(double startMainAxis, double endMainAxis,
      double startCrossAxis, int amount, double differenceCrossAxis,
      {bool reverse = false}) {
    List<Offset> differeceOffsets = [];

    for (int loop = 0; loop < amount; loop++) {
      double _x = _random.nextDouble() * (endMainAxis - startMainAxis);
      double _y = startCrossAxis +
          (_random.nextBool() ? -1 : 1) *
              doubleInRange(_random, 0, differenceCrossAxis);
      differeceOffsets.add(Offset(startMainAxis + _x, _y));
    }

    differeceOffsets
        .sort((a, b) => reverse ? b.dx.compareTo(a.dx) : a.dx.compareTo(b.dx));

    return differeceOffsets;
  }
}
