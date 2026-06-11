/// 五星红旗动态背景 — 轻微飘扬动画
import 'dart:math';
import 'package:flutter/material.dart';

class FlagBackground extends StatefulWidget {
  final Widget child;
  const FlagBackground({super.key, required this.child});

  @override
  State<FlagBackground> createState() => _FlagBackgroundState();
}

class _FlagBackgroundState extends State<FlagBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(); // 循环播放
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return CustomPaint(
          painter: _FlagPainter(animationValue: _controller.value),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

/// 五星红旗绘制器
class _FlagPainter extends CustomPainter {
  final double animationValue;

  _FlagPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    // ── 红色背景 ──
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = const Color(0xFFDE2910),
    );

    // 轻微波浪偏移
    final waveOffset = sin(animationValue * 2 * pi) * 3;

    final cx = size.width * 0.168; // 大星 X (旗面 1/6)
    final cy = size.height * 0.25; // 大星 Y
    final bigR = min(size.width, size.height) * 0.10; // 大星半径

    // ── 绘制 5 颗星 ──
    final starPaint = Paint()..color = const Color(0xFFFFDE00);
    final starPath = _createStarPath(5, bigR * 0.3, bigR);
    canvas.save();
    canvas.translate(cx, cy + waveOffset);
    canvas.drawPath(starPath, starPaint);
    canvas.restore();

    // 4 颗小星 — 围绕大星，角度 20°/80°/140°/230°
    const smallOffsets = [20, 80, 140, 230];
    const smallDist = 1.55; // 小星距大星中心的倍数

    for (final angle in smallOffsets) {
      final rad = angle * pi / 180;
      final sx = cx + bigR * smallDist * cos(rad);
      final sy = cy - bigR * smallDist * sin(rad);
      final smallR = bigR * 0.38;

      final smallPath = _createStarPath(5, smallR * 0.3, smallR);
      canvas.save();
      canvas.translate(sx, sy + waveOffset * 1.1);

      // 小星指向大星中心
      final targetAngle = atan2(-(sy - cy), sx - cx);
      canvas.rotate(targetAngle - pi / 2);
      canvas.drawPath(smallPath, starPaint);
      canvas.restore();
    }
  }

  /// 创建五角星路径
  Path _createStarPath(int points, double innerR, double outerR) {
    final path = Path();
    final step = pi / points;
    path.moveTo(0, -outerR);
    for (int i = 0; i < points * 2; i++) {
      final r = i.isEven ? outerR : innerR;
      final angle = -pi / 2 + i * step;
      path.lineTo(r * cos(angle), r * sin(angle));
    }
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(_FlagPainter old) => old.animationValue != animationValue;
}
