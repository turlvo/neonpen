library neonpen;

import 'dart:math';

import 'package:flutter/material.dart';

// A Widget that give a neon pen style to Text widget
class Neonpen extends StatelessWidget {
  final Text text;
  final Color color;
  final double opacity;
  final EdgeInsets padding;
  final bool disableEmphasis;
  final double emphasisWidth;
  final double emphasisOpacity;
  final double emphasisAngleDegree;
  final bool enableLineZiggle;
  final double lineZiggleLevel;
  final bool isDoubleLayer;

  Neonpen({
    @required this.text,
    @required this.color,
    this.opacity,
    this.padding,
    this.disableEmphasis,
    this.emphasisWidth,
    this.emphasisOpacity,
    this.emphasisAngleDegree,
    this.enableLineZiggle,
    this.lineZiggleLevel,
    this.isDoubleLayer,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: NeonPainter(
        color: color,
        padding: padding,
        opacity: opacity,
        disableEmphasis: disableEmphasis,
        emphasisWidth: emphasisWidth,
        emphasisOpacity: emphasisOpacity,
        emphasisAngleDegree: emphasisAngleDegree,
        enableLineZiggle: enableLineZiggle,
        lineZiggleLevel: lineZiggleLevel,
        isDoubleLayer: isDoubleLayer,
      ),
      child: text,
    );
  }
}

// A NeonPainter class for draw neon pen style

class NeonPainter extends CustomPainter {
  final double opacity;
  final Color color;
  final EdgeInsets padding;
  final bool disableEmphasis;
  final double emphasisWidth;
  final double emphasisOpacity;
  final double emphasisAngleDegree;
  final bool enableLineZiggle;
  final double lineZiggleLevel;
  final bool isDoubleLayer;

  final _random = Random();

  NeonPainter({
    @required Color color,
    double opacity,
    EdgeInsets padding,
    bool disableEmphasis,
    double emphasisWidth,
    double emphasisOpacity,
    double emphasisAngleDegree,
    bool enableLineZiggle,
    double lineZiggleLevel,
    bool isDoubleLayer,
  })  : this.opacity = opacity ?? 0.5,
        this.color = color,
        this.padding = padding ?? EdgeInsets.symmetric(horizontal: 5),
        this.disableEmphasis = disableEmphasis ?? false,
        this.emphasisWidth = emphasisWidth ?? 5.0,
        this.emphasisOpacity = emphasisOpacity ?? (opacity ?? 0.5 + 0.05),
        this.emphasisAngleDegree = emphasisAngleDegree ?? 1,
        this.enableLineZiggle = enableLineZiggle ?? false,
        this.lineZiggleLevel = lineZiggleLevel ?? 1,
        this.isDoubleLayer = isDoubleLayer ?? false;

  @override
  void paint(Canvas canvas, Size size) {
    final double startX = 0 - padding.left;
    final double endX = size.width + padding.right;
    final double startY = 0 - padding.top;
    final double endY = size.height + padding.bottom;

    if (isDoubleLayer == false) {
      // If widget has a one layer, just draw full size neonpen style
      drawNeonpen(
        canvas: canvas,
        x: startX,
        y: startY,
        width: endX,
        height: endY,
      );
    } else {
      // If widget has a double layer, draw one neopen style and
      // over-draw over first neonpen style layer
      drawNeonpen(
        canvas: canvas,
        x: startX,
        y: startY,
        width: endX,
        height: size.height * 2 / 3 + padding.bottom * 3 / 4,
      );
      drawNeonpen(
        canvas: canvas,
        x: startX + 5,
        y: size.height * 2 / 3 - padding.bottom * 3 / 4,
        width: endX + 5,
        height: endY,
      );
    }
  }

  // Draw neonpen at position of x,y and size of height, width.
  void drawNeonpen({
    @required Canvas canvas,
    @required double height,
    @required double width,
    double x = 0,
    double y = 0,
  }) {
    final double startX = x;
    final double endX = width;
    final double startY = y;
    final double endY = height;
    final double leftRightDistance = 3.0 * emphasisAngleDegree;

    // Draw main neon main line
    Paint paint = Paint()
      ..color = color.withOpacity(opacity)
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.addPolygon([
      Offset(startX, startY),
      if (enableLineZiggle)
        ...makeRandomOffset(startX, endX, startY, 50 * lineZiggleLevel.toInt(), 0.3 * lineZiggleLevel),
      Offset(endX, startY),
      Offset(endX - leftRightDistance, endY),
      if (enableLineZiggle)
        ...makeRandomOffset(startX - leftRightDistance, endX - leftRightDistance, endY, 50 * lineZiggleLevel.toInt(),
            0.3 * lineZiggleLevel,
            reverse: true),
      Offset(startX - leftRightDistance, endY),
    ], true);
    canvas.drawPath(path, paint);

    // Draw left, right emphasis line
    if (!disableEmphasis) {
      Paint emphasisPaint = Paint()
        ..color = color.withOpacity(emphasisOpacity)
        ..style = PaintingStyle.stroke
        ..strokeWidth = emphasisWidth
        ..strokeCap = StrokeCap.round;

      Path leftEmphasisPath = Path();
      leftEmphasisPath.moveTo(startX + (emphasisWidth / 2), startY + (emphasisWidth / 2));
      leftEmphasisPath.lineTo(startX + (emphasisWidth / 2) - leftRightDistance, endY - (emphasisWidth / 2));
      canvas.drawPath(leftEmphasisPath, emphasisPaint);

      Path rightEmphasisPath = Path();
      rightEmphasisPath.moveTo(endX - (emphasisWidth / 2), startY + (emphasisWidth / 2));
      rightEmphasisPath.lineTo(endX - (emphasisWidth / 2) - leftRightDistance, endY - (emphasisWidth / 2));

      canvas.drawPath(rightEmphasisPath, emphasisPaint);
    }
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

  // To get range of random double value
  double doubleInRange(Random source, num start, num end) => source.nextDouble() * (end - start) + start;

  // Make a list of random Offset
  // startMainAxis : random start value
  // endMainAxis : radom end value
  // amount : amount of random Offset value
  // differenceCrossAxis : gap from crossAxis 0 value
  List<Offset> makeRandomOffset(
      double startMainAxis, double endMainAxis, double startCrossAxis, int amount, double differenceCrossAxis,
      {bool reverse = false}) {
    List<Offset> differeceOffsets = [];

    for (int loop = 0; loop < amount; loop++) {
      double _x = _random.nextDouble() * (endMainAxis - startMainAxis);
      double _y = startCrossAxis + (_random.nextBool() ? -1 : 1) * doubleInRange(_random, 0, differenceCrossAxis);
      differeceOffsets.add(Offset(startMainAxis + _x, _y));
    }

    differeceOffsets.sort((a, b) => reverse ? b.dx.compareTo(a.dx) : a.dx.compareTo(b.dx));

    return differeceOffsets;
  }
}
