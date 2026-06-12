// ============================================
// 文件: lib/ty_taiyuan/ty_taiyuan_spots.dart
// 用途: 太原城市 - 景点 Tab — UX v3
// ============================================

import 'package:flutter/material.dart';
import '../l10n/ty_app_localizations.dart';
import '../shared/ty_colors.dart';
import '../shared/ty_detail_sheet.dart';
import '../shared/ty_widgets.dart';

class TaiyuanSpotsTab extends StatelessWidget {
  const TaiyuanSpotsTab();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final spots = [
      _SpotData(
        keyName: 'spotJinci',
        emoji: '🏯',
        imageAsset: 'assets/ty_taiyuan/images/jinci.jpg',
        name: l10n['spotJinci'],
        badge: l10n['badge5A'],
        price: l10n['spotJinciNote'],
        rating: '4.9',
        count: '2.1万人去过',
        desc: '中国现存最早的皇家园林祠堂，周柏唐槐宋泉并称“晋祠三绝”。',
        tags: ['¥80 / 人', '建议 3 小时', l10n['spotJinciTag']],
        tagKinds: [_PillKind.red, _PillKind.neutral, _PillKind.gold],
        bg: const Color(0xFFE8DCC8),
      ),
      _SpotData(
        keyName: 'spotMuseum',
        emoji: '🏛️',
        name: l10n['spotMuseum'],
        badge: l10n['badge4A'],
        price: l10n['priceFree'],
        rating: '4.8',
        count: '3.4万人去过',
        desc: '馆藏精品逾40万件，青铜器、壁画、晋商文物令人叹为观止。',
        tags: ['免费入场', '建议 2 小时', l10n['spotMuseumTag']],
        tagKinds: [_PillKind.gold, _PillKind.neutral, _PillKind.gold],
        bg: const Color(0xFFDCE4F0),
      ),
      _SpotData(
        keyName: 'spotTwinPagoda',
        emoji: '🗼',
        name: l10n['spotTwinPagoda'],
        badge: l10n['badge4A'],
        price: l10n['spotTwinPagodaNote'],
        rating: '4.7',
        count: '1.8万人去过',
        desc: '两座明代砖塔并峙如笔，是太原城最醒目的天际线记忆。',
        tags: ['¥35 / 人', '建议 1.5 小时', l10n['spotTwinPagodaTag']],
        tagKinds: [_PillKind.red, _PillKind.neutral, _PillKind.gold],
        bg: const Color(0xFFF8E8E0),
      ),
      _SpotData(
        keyName: 'spotFenPark',
        emoji: '🌿',
        name: l10n['spotFenPark'],
        badge: '',
        price: l10n['priceFree'],
        rating: '4.5',
        count: '4.2万人去过',
        desc: '沿汾河展开的城市绿道，傍晚散步、骑行和看夜景都很舒服。',
        tags: ['免费', '适合夜游', l10n['spotFenParkSub']],
        tagKinds: [_PillKind.gold, _PillKind.neutral, _PillKind.gold],
        bg: const Color(0xFFE8F5E8),
      ),
      _SpotData(
        keyName: 'spotLiuxiang',
        emoji: '🛍️',
        name: l10n['spotLiuxiang'],
        badge: '',
        price: l10n['spotLiuxiangNote'],
        rating: '4.7',
        count: '5.6万人去过',
        desc: '柳巷与钟楼街串起百年商圈、老字号、小吃和夜间烟火。',
        tags: ['步行街', '适合夜逛', l10n['spotLiuxiangSub']],
        tagKinds: [_PillKind.gold, _PillKind.neutral, _PillKind.gold],
        bg: const Color(0xFFF5ECE8),
      ),
    ];

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: _FilterChips(labels: ['全部', '古建', '博物馆', '公园', '免费']),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 20),
          sliver: SliverList.separated(
            itemCount: spots.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final spot = spots[index];
              return HapticTap(
                onTap: () => showSpotDetail(context, spot.keyName, spot.emoji),
                child: _LargeSpotCard(spot: spot),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _LargeSpotCard extends StatelessWidget {
  const _LargeSpotCard({required this.spot});

  final _SpotData spot;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border2),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F9B7A3A),
            blurRadius: 16,
            offset: Offset(0, 3),
          ),
          BoxShadow(
            color: Color(0x0F1E1810),
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SpotImage(spot: spot),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 9, 14, 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  spot.name,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                    letterSpacing: .5,
                  ),
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Text(
                      '★★★★★',
                      style: TextStyle(
                        color: AppColors.gold2,
                        fontSize: 10,
                        letterSpacing: .5,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      spot.rating,
                      style: const TextStyle(
                        color: AppColors.gold,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      ' · ${spot.count}',
                      style: const TextStyle(
                        color: AppColors.ink4,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  spot.desc,
                  style: const TextStyle(
                    color: AppColors.ink3,
                    fontSize: 10,
                    height: 1.65,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  children: [
                    for (var i = 0; i < spot.tags.length; i++)
                      _InfoPill(text: spot.tags[i], kind: spot.tagKinds[i]),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SpotImage extends StatelessWidget {
  const _SpotImage({required this.spot});

  final _SpotData spot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (spot.imageAsset != null)
            Image.asset(spot.imageAsset!, fit: BoxFit.cover)
          else
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [spot.bg, Color.lerp(spot.bg, AppColors.ink2, .18)!],
                ),
              ),
              child: Center(
                child: Text(spot.emoji, style: const TextStyle(fontSize: 58)),
              ),
            ),
          const Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 64,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0x00FFFFFF), AppColors.bgCard],
                ),
              ),
            ),
          ),
          if (spot.badge.isNotEmpty)
            Positioned(
              left: 10,
              top: 10,
              child: _FloatingBadge(text: spot.badge, color: AppColors.gold),
            ),
          Positioned(
            right: 10,
            top: 10,
            child: _FloatingBadge(
              text: spot.price,
              color: spot.price == '免费' ? AppColors.gold : AppColors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChips extends StatelessWidget {
  const _FilterChips({required this.labels});

  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 8),
      decoration: const BoxDecoration(
        color: AppColors.bg,
        border: Border(bottom: BorderSide(color: AppColors.border2)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            for (var i = 0; i < labels.length; i++) ...[
              _FilterChip(label: labels[i], selected: i == 0),
              if (i != labels.length - 1) const SizedBox(width: 7),
            ],
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, required this.selected});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
      decoration: BoxDecoration(
        color: selected ? AppColors.red : AppColors.bgCard,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: selected ? AppColors.red : AppColors.border),
        boxShadow: [
          BoxShadow(
            color: selected ? const Color(0x47B84C2E) : const Color(0x0F1E1810),
            blurRadius: selected ? 8 : 4,
            offset: Offset(0, selected ? 2 : 1),
          ),
        ],
      ),
      child: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : AppColors.ink2,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _FloatingBadge extends StatelessWidget {
  const _FloatingBadge({required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: .35),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _InfoPill extends StatelessWidget {
  const _InfoPill({required this.text, required this.kind});

  final String text;
  final _PillKind kind;

  @override
  Widget build(BuildContext context) {
    final (bg, fg, border) = switch (kind) {
      _PillKind.red => (AppColors.redBg, AppColors.red, AppColors.redBorder),
      _PillKind.gold => (
        AppColors.goldBg,
        AppColors.gold,
        AppColors.goldBorder,
      ),
      _PillKind.neutral => (
        const Color(0x0D1E1810),
        AppColors.ink2,
        AppColors.border,
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: border),
      ),
      child: Text(
        text,
        style: TextStyle(color: fg, fontSize: 9, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _SpotData {
  final String keyName;
  final String emoji;
  final String? imageAsset;
  final String name;
  final String badge;
  final String price;
  final String rating;
  final String count;
  final String desc;
  final List<String> tags;
  final List<_PillKind> tagKinds;
  final Color bg;

  const _SpotData({
    required this.keyName,
    required this.emoji,
    this.imageAsset,
    required this.name,
    required this.badge,
    required this.price,
    required this.rating,
    required this.count,
    required this.desc,
    required this.tags,
    required this.tagKinds,
    required this.bg,
  });
}

enum _PillKind { red, gold, neutral }
