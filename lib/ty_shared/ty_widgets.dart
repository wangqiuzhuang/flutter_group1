// ============================================
// 文件: lib/ty_shared/ty_widgets.dart
// 用途: 共用 UI 组件（标签、卡片、统计格、列表项等）
// 作者: testerwm
// 创建: 2026-06-09
// 说明: 所有城市页面共用，不包含城市专属数据
//       如需城市专属样式，在 lib/cities/<name>/ 下覆盖
//       视觉增强：毛玻璃面板 + 杂志感排版
// ============================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ty_colors.dart';

// ── 毛玻璃装饰 ──

/// 面板毛玻璃样式（半透明 + 微秒边框，无 BackdropFilter 性能开销）
BoxDecoration glassDecoration({double radius = 12}) {
  return BoxDecoration(
    color: AppColors.panelGlass,
    borderRadius: BorderRadius.circular(radius),
    border: Border.all(color: AppColors.glassBorder),
  );
}

/// 毛玻璃包装容器
class GlassBox extends StatelessWidget {
  final Widget child;
  final double radius;
  final EdgeInsetsGeometry padding;
  const GlassBox({
    required this.child,
    this.radius = 12,
    this.padding = const EdgeInsets.all(14),
  });

  @override
  Widget build(BuildContext c) => Container(
    width: double.infinity,
    padding: padding,
    decoration: glassDecoration(radius: radius),
    child: child,
  );
}

// ── 文字标签 ──

class GoldPill extends StatelessWidget {
  final String text;
  const GoldPill(this.text);
  @override
  Widget build(BuildContext c) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: AppColors.gold.withValues(alpha: .16),
      borderRadius: BorderRadius.circular(999),
      border: Border.all(color: AppColors.gold.withValues(alpha: .32)),
    ),
    child: Text(
      text,
      style: const TextStyle(
        color: AppColors.gold,
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.3,
      ),
    ),
  );
}

class DimPill extends StatelessWidget {
  final String text;
  const DimPill(this.text);
  @override
  Widget build(BuildContext c) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: AppColors.textPrimary.withValues(alpha: .07),
      borderRadius: BorderRadius.circular(999),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: AppColors.textPrimary.withValues(alpha: .52),
        fontSize: 11,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

/// 带英文小标的标题（杂志感排版）
class SectionTitle extends StatelessWidget {
  final String text;
  final String? kicker;
  const SectionTitle(this.text, {this.kicker});

  @override
  Widget build(BuildContext c) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (kicker != null) ...[
        Text(
          kicker!,
          style: const TextStyle(
            color: AppColors.gold,
            fontSize: 8,
            fontWeight: FontWeight.w500,
            letterSpacing: 2.5,
          ),
        ),
        const SizedBox(height: 4),
      ],
      Text(
        text,
        style: const TextStyle(
          color: AppColors.textPrimary,
          fontSize: 15,
          fontWeight: FontWeight.w600,
          height: 1.3,
        ),
      ),
    ],
  );
}

// ── 统计格 ──

class StatTile extends StatelessWidget {
  final String value, label;
  const StatTile({required this.value, required this.label});

  @override
  Widget build(BuildContext c) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 13),
    decoration: glassDecoration(),
    child: Column(children: [
      Text(
        value,
        maxLines: 1,
        style: const TextStyle(
          color: AppColors.gold,
          fontSize: 20,
          fontWeight: FontWeight.w200,
          height: 1.1,
          letterSpacing: -0.5,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        label,
        maxLines: 1,
        style: TextStyle(
          color: AppColors.textPrimary.withValues(alpha: .38),
          fontSize: 10,
          letterSpacing: 0.3,
        ),
      ),
    ]),
  );
}

class StatsRow extends StatelessWidget {
  final (String, String) s1, s2, s3;
  const StatsRow({required this.s1, required this.s2, required this.s3});

  @override
  Widget build(BuildContext c) => Row(children: [
    Expanded(child: StatTile(value: s1.$1, label: s1.$2)),
    const SizedBox(width: 8),
    Expanded(child: StatTile(value: s2.$1, label: s2.$2)),
    const SizedBox(width: 8),
    Expanded(child: StatTile(value: s3.$1, label: s3.$2)),
  ]);
}

// ── 信息格 ──

class InfoTile extends StatelessWidget {
  final String label, value;
  const InfoTile({required this.label, required this.value});

  @override
  Widget build(BuildContext c) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
    decoration: glassDecoration(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.textPrimary.withValues(alpha: .36),
            fontSize: 10,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}

class InfoGrid extends StatelessWidget {
  final InfoTile t1, t2;
  const InfoGrid({required this.t1, required this.t2});

  @override
  Widget build(BuildContext c) => LayoutBuilder(builder: (c, cons) {
    final two = cons.maxWidth >= 360;
    return GridView.count(
      crossAxisCount: two ? 2 : 1,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: two ? 2.2 : 4.0,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [t1, t2],
    );
  });
}

// ── 文本块 ──

class TextBlock extends StatelessWidget {
  final String text;
  const TextBlock(this.text);

  @override
  Widget build(BuildContext c) => GlassBox(
    child: Text(
      text,
      style: TextStyle(
        color: AppColors.textPrimary.withValues(alpha: .62),
        fontSize: 12,
        height: 1.8,
      ),
    ),
  );
}

// ── 触觉反馈包装 ──

class HapticTap extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  const HapticTap({required this.onTap, required this.child});

  @override
  Widget build(BuildContext c) => GestureDetector(
    onTap: () {
      HapticFeedback.lightImpact();
      onTap();
    },
    child: child,
  );
}

// ── 占位图 ──

class PlaceholderImage extends StatelessWidget {
  final String emoji;
  final double height;
  final Color bg;
  final double radius;
  const PlaceholderImage({
    required this.emoji,
    required this.height,
    required this.bg,
    this.radius = 12,
  });

  @override
  Widget build(BuildContext c) => Container(
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          bg.withValues(alpha: .9),
          Color.lerp(bg, Colors.black, .35)!,
        ],
      ),
    ),
    clipBehavior: Clip.antiAlias,
    child: Stack(
      fit: StackFit.expand,
      children: [
        // 装饰圆
        Positioned(
          right: -12,
          top: -8,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: .06),
            ),
          ),
        ),
        Positioned(
          left: -10,
          bottom: -14,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: .04),
            ),
          ),
        ),
        Center(
          child: Text(
            emoji,
            style: TextStyle(fontSize: height > 60 ? 38 : 26),
          ),
        ),
      ],
    ),
  );
}

// ── 卡片组件 ──

class SpotCard extends StatelessWidget {
  final String emoji, name, badge, price, tag;
  final Color bg;
  const SpotCard({
    required this.emoji,
    required this.bg,
    required this.name,
    required this.badge,
    required this.price,
    required this.tag,
  });

  @override
  Widget build(BuildContext c) => Container(
    width: 116,
    margin: const EdgeInsets.only(right: 10),
    decoration: glassDecoration(radius: 13),
    child: Column(children: [
      Stack(children: [
        PlaceholderImage(emoji: emoji, height: 78, bg: bg, radius: 12),
        if (badge.isNotEmpty)
          Positioned(
            top: 7,
            right: 7,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.gold.withValues(alpha: .92),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                badge,
                style: const TextStyle(
                  color: Color(0xFF1a0f00),
                  fontSize: 8,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
      ]),
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 6, 8, 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 2),
            Row(children: [
              Text(
                price,
                style: const TextStyle(
                  color: AppColors.gold,
                  fontSize: 9,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                tag,
                style: TextStyle(
                  color: AppColors.textPrimary.withValues(alpha: .36),
                  fontSize: 8,
                ),
              ),
            ]),
          ],
        ),
      ),
    ]),
  );
}

class FoodCard extends StatelessWidget {
  final String emoji, name, sub;
  final Color bg;
  final int heat, delay;
  const FoodCard({
    required this.emoji,
    required this.bg,
    required this.name,
    required this.sub,
    required this.heat,
    required this.delay,
  });

  @override
  Widget build(BuildContext c) => Container(
    decoration: glassDecoration(radius: 12),
    child: Column(children: [
      PlaceholderImage(emoji: emoji, height: 48, bg: bg, radius: 11),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(9, 6, 9, 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 1),
              Text(
                sub,
                style: TextStyle(
                  color: AppColors.textPrimary.withValues(alpha: .38),
                  fontSize: 8,
                ),
              ),
              const Spacer(),
              Row(
                children: List.generate(5, (i) {
                  final active = i < heat;
                  return TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: Duration(
                      milliseconds: 180 + delay + i * 40,
                    ),
                    builder: (_, v, child) => Opacity(
                      opacity: active ? v : 0.12,
                      child: Transform.scale(
                        scale: active ? 0.6 + v * 0.4 : 1.0,
                        child: child,
                      ),
                    ),
                    child: Container(
                      width: 4,
                      height: 4,
                      margin: const EdgeInsets.only(right: 2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: active
                            ? const Color(0xFFe05c30)
                            : AppColors.textPrimary.withValues(alpha: .12),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    ]),
  );
}
