// ============================================
// 文件: lib/ty_taiyuan/ty_taiyuan_spots.dart
// 用途: 太原城市 - 景点 Tab 内容
// 作者: testerwm
// 创建: 2026-06-09
// 说明: 太原专属景点列表（6 张横滑卡片 + 7 个列表项）
//       其他城市请参考此结构，替换为自己的景点数据
// ============================================

import 'package:flutter/material.dart';
import '../ty_l10n/ty_app_localizations.dart';
import '../ty_shared/ty_colors.dart';
import '../ty_shared/ty_widgets.dart';
import '../ty_shared/ty_detail_sheet.dart';

class TaiyuanSpotsTab extends StatelessWidget {
  const TaiyuanSpotsTab();

  @override
  Widget build(BuildContext c) {
    final l10n = AppLocalizations.of(c);

    return ListView(padding: const EdgeInsets.only(bottom: 20), physics: const BouncingScrollPhysics(), children: [
      const SizedBox(height: 14),
      Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: SectionTitle(l10n['sectionSpots'])),
      const SizedBox(height: 10),
      // 横向滚动景点卡片（6张）
      SizedBox(height: 144, child: ListView(scrollDirection: Axis.horizontal, physics: const BouncingScrollPhysics(), padding: const EdgeInsets.symmetric(horizontal: 16), children: [
        _spotCard(c, 'spotJinci', '🏯', const Color(0xFF1a1028), l10n['spotJinci'], l10n['badge5A'], '¥80', l10n['spotJinciTag']),
        _spotCard(c, 'spotMuseum', '🏛️', const Color(0xFF0f1a14), l10n['spotMuseum'], l10n['badge4A'], l10n['priceFree'], l10n['spotMuseumTag']),
        _spotCard(c, 'spotTwinPagoda', '🗼', const Color(0xFF141820), l10n['spotTwinPagoda'], l10n['badge4A'], '¥30', l10n['spotTwinPagodaTag']),
        _spotCard(c, 'spotMengshan', '🗿', const Color(0xFF1a1208), l10n['spotMengshan'], l10n['badge4A'], '¥50', l10n['spotMengshanTag']),
        _spotCard(c, 'spotCoalMuseum', '⛏️', const Color(0xFF101418), l10n['spotCoalMuseum'], l10n['badge4A'], '¥60', l10n['spotCoalMuseumTag']),
        _spotCard(c, 'spotJuewei', '🍁', const Color(0xFF1a0d08), l10n['spotJuewei'], '', l10n['priceFree'], l10n['spotJueweiTag']),
      ])),
      const SizedBox(height: 14),
      // 列表（7项）
      Container(margin: const EdgeInsets.symmetric(horizontal: 16), decoration: BoxDecoration(color: AppColors.panel, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppColors.hairline)), child: Column(children: [
        _spotItem(c, 'spotTianlong', '⛰️', const Color(0xFF101820), '4.6'),
        const Divider(height: 1, indent: 52, endIndent: 16, color: AppColors.hairline),
        _spotItem(c, 'spotFenPark', '🌿', const Color(0xFF0d1a14), '4.5'),
        const Divider(height: 1, indent: 52, endIndent: 16, color: AppColors.hairline),
        _spotItem(c, 'spotLiuxiang', '🛍️', const Color(0xFF1a1018), '4.7'),
        const Divider(height: 1, indent: 52, endIndent: 16, color: AppColors.hairline),
        _spotItem(c, 'spotJinyang', '🌊', const Color(0xFF101a18), '4.4'),
        const Divider(height: 1, indent: 52, endIndent: 16, color: AppColors.hairline),
        _spotItem(c, 'spotFolkMuseum', '🎭', const Color(0xFF1a1014), '4.5'),
        const Divider(height: 1, indent: 52, endIndent: 16, color: AppColors.hairline),
        _spotItem(c, 'spotTaishan', '🏔️', const Color(0xFF101a14), '4.6'),
        const Divider(height: 1, indent: 52, endIndent: 16, color: AppColors.hairline),
        _spotItem(c, 'spotBotanic', '🌵', const Color(0xFF141a10), '4.7'),
      ])),
    ]);
  }

  Widget _spotCard(BuildContext c, String key, String emoji, Color bg, String name, String badge, String price, String tag) =>
    HapticTap(onTap: () => showSpotDetail(c, key, emoji), child: SpotCard(emoji: emoji, bg: bg, name: name, badge: badge, price: price, tag: tag));

  Widget _spotItem(BuildContext c, String key, String emoji, Color bg, String rating) {
    final l10n = AppLocalizations.of(c);
    return HapticTap(onTap: () => showSpotDetail(c, key, emoji), child: Padding(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11), child: Row(children: [
      Container(width: 36, height: 36, decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(9)), child: Center(child: Text(emoji, style: const TextStyle(fontSize: 18)))),
      const SizedBox(width: 10),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(l10n[key], style: const TextStyle(color: AppColors.textPrimary, fontSize: 12, fontWeight: FontWeight.w600)),
        const SizedBox(height: 1),
        Text(l10n['${key}Sub'], style: TextStyle(color: AppColors.textPrimary.withValues(alpha: .36), fontSize: 10)),
      ])),
      Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Text('★ $rating', style: const TextStyle(color: AppColors.gold, fontSize: 11, fontWeight: FontWeight.w500)),
        Text(l10n['${key}Note'], style: TextStyle(color: AppColors.textPrimary.withValues(alpha: .28), fontSize: 9)),
      ]),
    ])));
  }
}

