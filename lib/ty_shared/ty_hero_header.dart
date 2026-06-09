// ============================================
// 文件: lib/ty_shared/ty_hero_header.dart
// 用途: 城市页顶部 Hero 区域（背景随 Tab 切换）
// 作者: testerwm
// 创建: 2026-06-09
// 说明: 每个 Tab 对应不同背景色+emoji，
//       城市名/副标题等文本通过参数传入
//       视觉增强：动态渐变 + 点阵纹理 + 浮动粒子 + 几何圆环
// ============================================

import 'dart:math';
import 'package:flutter/material.dart';
import 'ty_colors.dart';
import 'ty_widgets.dart';
import '../ty_l10n/ty_app_localizations.dart';

class CityHeroHeader extends StatefulWidget {
  final int tab;
  final VoidCallback onLangTap;
  final String provinceKey, cityKey, subtitleKey;
  final List<({Color color, String emoji})> backgrounds;

  const CityHeroHeader({
    required this.tab,
    required this.onLangTap,
    this.provinceKey = 'heroProvince',
    this.cityKey = 'heroCityName',
    this.subtitleKey = 'heroSubtitle',
    required this.backgrounds,
  });

  @override
  State<CityHeroHeader> createState() => _CityHeroHeaderState();
}

class _CityHeroHeaderState extends State<CityHeroHeader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _shift = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 12),
  )..repeat();

  @override
  void dispose() {
    _shift.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext c) {
    final l10n = AppLocalizations.of(c);
    final d = widget.backgrounds[widget.tab.clamp(0, widget.backgrounds.length - 1)];
    return AnimatedBuilder(
      animation: _shift,
      builder: (_, __) {
        final t = _shift.value;
        return SizedBox(
          height: 156,
          child: Stack(fit: StackFit.expand, children: [
            // ── 动态渐变背景 ──
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-1 + t * 0.25, -0.6 + sin(t * 2 * pi) * 0.1),
                  end: Alignment(0.8 - t * 0.2, 0.7),
                  colors: [
                    d.color,
                    Color.lerp(d.color, AppColors.ink, 0.35)!,
                    AppColors.ink,
                  ],
                ),
              ),
            ),
            // ── 几何圆环装饰 ──
            ..._rings(t),
            // ── 点阵纹理 ──
            Positioned.fill(
              child: CustomPaint(painter: _DotGridPainter(alpha: 0.04)),
            ),
            // ── 浮动粒子 ──
            Positioned.fill(
              child: CustomPaint(painter: _ParticlePainter(shift: t)),
            ),
            // ── Emoji 水印 ──
            Positioned.fill(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    d.emoji,
                    style: const TextStyle(fontSize: 60, height: 1),
                  ),
                ),
              ),
            ),
            // ── 底部渐变遮罩 ──
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0x0D0D0D14),
                      Color(0xE60D0D14),
                    ],
                  ),
                ),
              ),
            ),
            // ── 语言切换按钮 ──
            Positioned(
              right: 16,
              top: 8,
              child: InkWell(
                onTap: widget.onLangTap,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.gold.withValues(alpha: .14),
                    border: Border.all(
                      color: AppColors.gold.withValues(alpha: .30),
                    ),
                  ),
                  child: const Center(
                    child: Text('🌐', style: TextStyle(fontSize: 15)),
                  ),
                ),
              ),
            ),
            // ── 文字内容 ──
            Positioned(
              left: 20,
              right: 20,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GoldPill(l10n[widget.provinceKey]),
                  const SizedBox(height: 8),
                  Text(
                    l10n[widget.cityKey],
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      height: 1.05,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n[widget.subtitleKey],
                    style: TextStyle(
                      color: AppColors.textPrimary.withValues(alpha: .50),
                      fontSize: 11,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        );
      },
    );
  }

  List<Widget> _rings(double t) {
    return [
      // 大圆环 - 右上角
      Positioned(
        top: -50 + sin(t * 2 * pi) * 8,
        right: -30,
        child: Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0x08FFFFFF),
              width: 1,
            ),
          ),
        ),
      ),
      // 中圆环 - 左下角
      Positioned(
        bottom: -30 + cos(t * 2 * pi + 1) * 6,
        left: -20,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0x06FFFFFF),
              width: 1,
            ),
          ),
        ),
      ),
      // 小金环 - 中心偏左
      Positioned(
        top: 40 + sin(t * 2 * pi + 2) * 5,
        left: 60 + cos(t * 2 * pi) * 5,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.gold.withValues(alpha: .08),
              width: 1,
            ),
          ),
        ),
      ),
    ];
  }
}

// ── 点阵纹理 Painter ──

class _DotGridPainter extends CustomPainter {
  final double alpha;
  _DotGridPainter({this.alpha = 0.04});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromRGBO(255, 255, 255, alpha)
      ..style = PaintingStyle.fill;
    const spacing = 16.0;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), 0.6, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DotGridPainter old) => old.alpha != alpha;
}

// ── 浮动粒子 Painter ──

class _ParticlePainter extends CustomPainter {
  final double shift;
  _ParticlePainter({required this.shift});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColors.gold.withValues(alpha: .18);
    final positions = [
      (0.22, 0.28, 0.0),
      (0.62, 0.45, 0.35),
      (0.38, 0.68, 0.55),
      (0.78, 0.22, 0.18),
      (0.48, 0.52, 0.72),
      (0.85, 0.65, 0.42),
      (0.15, 0.75, 0.88),
    ];
    for (final p in positions) {
      final phase = p.$3;
      final dy = sin((shift + phase) * 2 * pi) * 9;
      final alpha = 0.12 + (sin((shift + phase) * 2 * pi).abs() * 0.15);
      paint.color = AppColors.gold.withValues(alpha: alpha);
      canvas.drawCircle(
        Offset(p.$1 * size.width, p.$2 * size.height + dy),
        2.2,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter old) => old.shift != shift;
}
