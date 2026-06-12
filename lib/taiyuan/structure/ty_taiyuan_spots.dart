// ============================================
// 文件: lib/ty_taiyuan/ty_taiyuan_spots.dart
// 用途: 太原城市 - 景点 Tab — 真实图片攻略卡
// 作者: testerwm
// 创建: 2026-06-09
// ============================================

import 'package:flutter/material.dart';
import '../l10n/ty_app_localizations.dart';
import '../shared/ty_colors.dart';
import '../shared/ty_detail_sheet.dart';
import '../shared/ty_widgets.dart';

class TaiyuanSpotsTab extends StatelessWidget {
  const TaiyuanSpotsTab({super.key});

  static const _jinciImage = 'assets/images/taiyuan/jinci.jpg';

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
        const SizedBox(height: 2),
        const _FilterRow(labels: ['全部', '古建', '博物馆', '公园', '免费']),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              _FeatureSpotCard(
                image: _jinciImage,
                title: l10n['spotJinci'],
                subtitle: 'JINCI TEMPLE',
                badge: l10n['badge5A'],
                price: l10n['spotJinciNote'],
                rating: '4.9',
                count: '2.1万人去过',
                meta: '距市区约 25km',
                desc: '中国现存最早的皇家园林祠堂，木雕、彩绘、匾额和古树都值得放慢看。',
                cells: const [('建议时长', '3 小时'), ('看点', '圣母殿'), ('适合', '古建控')],
                tags: const ['周柏唐槐', '避开正午', '千年古建'],
                onTap: () => showSpotDetail(c, 'spotJinci', '🏯'),
              ),
              const SizedBox(height: 12),
              _FeatureSpotCard(
                image: _jinciImage,
                title: '晋祠古建细节',
                subtitle: 'WOOD CARVING',
                badge: '细节',
                price: '拍照点',
                rating: '4.8',
                count: '出片率高',
                meta: '上午光线更好',
                desc: '檐下斗拱、龙纹木雕、彩绘匾额层次丰富，适合近距离观察传统工艺。',
                cells: const [('机位', '仰拍'), ('镜头', '2x 更稳'), ('重点', '木雕龙')],
                tags: const ['图案密集', '注意暗部', '必拍'],
                onTap: () => showSpotDetail(c, 'spotJinci', '🏯'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _FilterRow extends StatelessWidget {
  final List<String> labels;
  const _FilterRow({required this.labels});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 34,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 18),
      itemBuilder: (context, index) =>
          _FilterChip(label: labels[index], selected: index == 0),
      separatorBuilder: (context, index) => const SizedBox(width: 8),
      itemCount: labels.length,
    ),
  );
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;
  const _FilterChip({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
    decoration: BoxDecoration(
      color: selected ? AppColors.red : AppColors.bgCard,
      borderRadius: BorderRadius.circular(100),
      border: Border.all(color: selected ? AppColors.red : AppColors.border2),
      boxShadow: const [
        BoxShadow(
          color: AppColors.shadowLight,
          blurRadius: 8,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Text(
      label,
      style: TextStyle(
        color: selected ? Colors.white : AppColors.ink2,
        fontSize: 11,
        fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
      ),
    ),
  );
}

class _FeatureSpotCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String badge;
  final String price;
  final String rating;
  final String count;
  final String meta;
  final String desc;
  final List<(String, String)> cells;
  final List<String> tags;
  final VoidCallback onTap;

  const _FeatureSpotCard({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.price,
    required this.rating,
    required this.count,
    required this.meta,
    required this.desc,
    required this.cells,
    required this.tags,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => HapticTap(
    onTap: onTap,
    child: Container(
      decoration: cardDecoration(radius: 20),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 196,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                  alignment: const Alignment(0, -0.24),
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x101E1810),
                        Color(0x001E1810),
                        Color(0xB31E1810),
                      ],
                      stops: [0, 0.48, 1],
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: _ImageBadge(text: badge, color: AppColors.gold),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: _ImageBadge(text: price, color: AppColors.red),
                ),
                Positioned(
                  left: 14,
                  right: 14,
                  bottom: 14,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Color(0xDDF9F2E7),
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.8,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFFF9F2E7),
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          height: 1.05,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.ink,
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      meta,
                      style: const TextStyle(
                        color: AppColors.ink4,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text(
                      '★★★★★',
                      style: TextStyle(
                        color: AppColors.gold2,
                        fontSize: 10,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      rating,
                      style: const TextStyle(
                        color: AppColors.gold,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '· $count',
                      style: const TextStyle(
                        color: AppColors.ink4,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                  desc,
                  style: const TextStyle(
                    color: AppColors.ink3,
                    fontSize: 11,
                    height: 1.55,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: cells
                      .map(
                        (cell) => Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: cell == cells.last ? 0 : 7,
                            ),
                            child: _GuideCell(label: cell.$1, value: cell.$2),
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: tags
                      .map(
                        (tag) => AccentPill(
                          tag,
                          highlight: tag == '必拍' || tag == '周柏唐槐',
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class _ImageBadge extends StatelessWidget {
  final String text;
  final Color color;
  const _ImageBadge({required this.text, required this.color});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(8),
      boxShadow: const [
        BoxShadow(
          color: Color(0x331E1810),
          blurRadius: 8,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 10,
        fontWeight: FontWeight.w800,
      ),
    ),
  );
}

class _GuideCell extends StatelessWidget {
  final String label;
  final String value;
  const _GuideCell({required this.label, required this.value});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    decoration: BoxDecoration(
      color: AppColors.bgCard2,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: AppColors.border2),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: AppColors.ink4, fontSize: 9),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: AppColors.ink2,
            fontSize: 11,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    ),
  );
}
