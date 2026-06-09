// ============================================
// 文件: lib/ty_taiyuan/ty_taiyuan_food.dart
// 用途: 太原城市 - 美食 Tab 内容
// 作者: testerwm
// 创建: 2026-06-09
// 说明: 太原专属美食列表（10 道，2 列网格）
//       其他城市请替换为自己的美食数据
// ============================================

import 'package:flutter/material.dart';
import '../ty_l10n/ty_app_localizations.dart';
import '../ty_shared/ty_widgets.dart';
import '../ty_shared/ty_detail_sheet.dart';

class TaiyuanFoodTab extends StatelessWidget {
  const TaiyuanFoodTab();

  @override
  Widget build(BuildContext c) {
    final l10n = AppLocalizations.of(c);

    return ListView(padding: const EdgeInsets.fromLTRB(16, 14, 16, 20), physics: const BouncingScrollPhysics(), children: [
      SectionTitle(l10n['sectionFood']), const SizedBox(height: 10),
      GridView.count(crossAxisCount: 2, shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 1.65, children: [
        _food(c, 'foodDaoxiao', '🍜', const Color(0xFF1a0d08), 5, 0),
        _food(c, 'foodGuoyou', '🥩', const Color(0xFF1a100d), 4, 60),
        _food(c, 'foodTounao', '🍲', const Color(0xFF100d1a), 3, 120),
        _food(c, 'foodYangzage', '🐑', const Color(0xFF0d1a14), 4, 180),
        _food(c, 'foodTijian', '🥢', const Color(0xFF141a10), 4, 240),
        _food(c, 'foodKaolao', '🫓', const Color(0xFF1a1408), 3, 300),
        _food(c, 'foodWanzi', '🧆', const Color(0xFF1a100d), 5, 360),
        _food(c, 'foodJiangrou', '🥓', const Color(0xFF1a0d10), 5, 420),
        _food(c, 'foodDoufu', '🫕', const Color(0xFF141a18), 4, 480),
        _food(c, 'foodMaoer', '🐱', const Color(0xFF1a1410), 4, 540),
      ]),
    ]);
  }

  Widget _food(BuildContext c, String key, String emoji, Color bg, int heat, int delay) {
    final l10n = AppLocalizations.of(c);
    return HapticTap(onTap: () => showFoodDetail(c, key, emoji), child: FoodCard(emoji: emoji, bg: bg, name: l10n[key], sub: l10n['${key}Sub'], heat: heat, delay: delay));
  }
}
