// ============================================
// 文件: lib/ty_taiyuan/ty_taiyuan_food.dart
// 用途: 太原城市 - 美食 Tab — 浅色主题 v2
// 作者: testerwm
// 创建: 2026-06-09
// ============================================

import 'package:flutter/material.dart';
import '../l10n/ty_app_localizations.dart';
import '../shared/ty_widgets.dart';
import '../shared/ty_detail_sheet.dart';

class TaiyuanFoodTab extends StatelessWidget {
  const TaiyuanFoodTab();

  @override
  Widget build(BuildContext c) {
    final l10n = AppLocalizations.of(c);

    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 14, 18, 20),
      physics: const BouncingScrollPhysics(),
      children: [
        SectionTitle(l10n['sectionFood']),
        const SizedBox(height: 2),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.05,
          children: [
            _food(c, 'foodDaoxiao', '🍜', const Color(0xFFf5e8d0), 5, 0),
            _food(c, 'foodGuoyou', '🥩', const Color(0xFFf5d8d0), 4, 60),
            _food(c, 'foodTounao', '🍲', const Color(0xFFf0eee0), 3, 120),
            _food(c, 'foodYangzage', '🐑', const Color(0xFFeef0e8), 4, 180),
            _food(c, 'foodTijian', '🥢', const Color(0xFFf0e8f0), 4, 240),
            _food(c, 'foodKaolao', '🫓', const Color(0xFFf5f0e0), 3, 300),
            _food(c, 'foodWanzi', '🧆', const Color(0xFFf5e0d8), 5, 360),
            _food(c, 'foodJiangrou', '🥓', const Color(0xFFf5e0e8), 5, 420),
            _food(c, 'foodDoufu', '🫕', const Color(0xFFeaf0e8), 4, 480),
            _food(c, 'foodMaoer', '🐱', const Color(0xFFf0ece0), 4, 540),
          ],
        ),
      ],
    );
  }

  Widget _food(BuildContext c, String key, String emoji, Color bg, int heat,
          int delay) {
    final l10n = AppLocalizations.of(c);
    return HapticTap(
      onTap: () => showFoodDetail(c, key, emoji),
      child: FoodCard(
        emoji: emoji,
        bg: bg,
        name: l10n[key],
        sub: l10n['${key}Sub'],
        heat: heat,
        delay: delay,
      ),
    );
  }
}
