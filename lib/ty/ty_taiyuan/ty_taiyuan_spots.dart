// ============================================
// 文件: lib/ty_taiyuan/ty_taiyuan_spots.dart
// 用途: 太原城市 - 景点 Tab — 浅色主题 v2
// 作者: testerwm
// 创建: 2026-06-09
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

    return ListView(
      padding: const EdgeInsets.only(bottom: 20),
      physics: const BouncingScrollPhysics(),
      children: [
        const SizedBox(height: 14),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SectionTitle(l10n['sectionSpots']),
        ),
        const SizedBox(height: 10),
        // 横向滚动景点卡片（6张）
        SizedBox(
          height: 148,
          child: ListView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            children: [
              _spotCard(c, 'spotJinci', '🏯', const Color(0xFFf0e8d8),
                  l10n['spotJinci'], l10n['badge5A'], l10n['spotJinciNote'], l10n['spotJinciTag']),
              _spotCard(c, 'spotMuseum', '🏛️', const Color(0xFFd8dde8),
                  l10n['spotMuseum'], l10n['badge4A'], l10n['priceFree'], l10n['spotMuseumTag']),
              _spotCard(c, 'spotTwinPagoda', '🗼', const Color(0xFFf8e8e0),
                  l10n['spotTwinPagoda'], l10n['badge4A'], l10n['spotTwinPagodaNote'], l10n['spotTwinPagodaTag']),
              _spotCard(c, 'spotMengshan', '🗿', const Color(0xFFe8e0d0),
                  l10n['spotMengshan'], l10n['badge4A'], l10n['spotMengshanNote'], l10n['spotMengshanTag']),
              _spotCard(c, 'spotCoalMuseum', '⛏️', const Color(0xFFe0e4ea),
                  l10n['spotCoalMuseum'], l10n['badge4A'], l10n['spotCoalMuseumNote'], l10n['spotCoalMuseumTag']),
              _spotCard(c, 'spotJuewei', '🍁', const Color(0xFFf5e0d0),
                  l10n['spotJuewei'], '', l10n['priceFree'], l10n['spotJueweiTag']),
            ],
          ),
        ),
        const SizedBox(height: 14),
        // 列表区域
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SectionTitle('城市景观'),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 18),
          decoration: cardDecoration(),
          clipBehavior: Clip.antiAlias,
          child: Column(children: [
            _spotItem(c, 'spotTianlong', '⛰️', const Color(0xFFe8f0f0), '4.6'),
            _divider(),
            _spotItem(c, 'spotFenPark', '🌿', const Color(0xFFe8f5e8), '4.5'),
            _divider(),
            _spotItem(c, 'spotLiuxiang', '🛍️', const Color(0xFFf5ece8), '4.7'),
            _divider(),
            _spotItem(c, 'spotJinyang', '🌊', const Color(0xFFe8f0f5), '4.4'),
            _divider(),
            _spotItem(c, 'spotFolkMuseum', '🎭', const Color(0xFFf5e8f0), '4.5'),
            _divider(),
            _spotItem(c, 'spotTaishan', '🏔️', const Color(0xFFeaf0e8), '4.6'),
            _divider(),
            _spotItem(c, 'spotBotanic', '🌵', const Color(0xFFeef5e8), '4.7'),
          ]),
        ),
      ],
    );
  }

  Widget _divider() => const Divider(
    height: 1,
    indent: 52,
    endIndent: 14,
    color: AppColors.border2,
  );

  Widget _spotCard(BuildContext c, String key, String emoji, Color bg,
          String name, String badge, String price, String tag) =>
      HapticTap(
        onTap: () => showSpotDetail(c, key, emoji),
        child: SpotCard(
          emoji: emoji,
          bg: bg,
          name: name,
          badge: badge,
          price: price,
          tag: tag,
        ),
      );

  Widget _spotItem(
          BuildContext c, String key, String emoji, Color bg, String rating) {
    final l10n = AppLocalizations.of(c);
    return HapticTap(
      onTap: () => showSpotDetail(c, key, emoji),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
        child: Row(children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(emoji, style: const TextStyle(fontSize: 20)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n[key],
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  l10n['${key}Sub'],
                  style: const TextStyle(
                    color: AppColors.ink3,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '★ $rating',
                style: const TextStyle(
                  color: AppColors.gold,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                l10n['${key}Note'],
                style: const TextStyle(
                  color: AppColors.ink4,
                  fontSize: 9,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
