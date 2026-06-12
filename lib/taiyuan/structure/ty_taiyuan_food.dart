// ============================================
// 文件: lib/ty_taiyuan/ty_taiyuan_food.dart
// 用途: 太原城市 - 美食 Tab — 真实图片单人食清单
// 作者: testerwm
// 创建: 2026-06-09
// ============================================

import 'package:flutter/material.dart';
import '../l10n/ty_app_localizations.dart';
import '../shared/ty_colors.dart';
import '../shared/ty_detail_sheet.dart';
import '../shared/ty_widgets.dart';

class TaiyuanFoodTab extends StatelessWidget {
  const TaiyuanFoodTab({super.key});

  static const _noodleImage = 'assets/images/taiyuan/taiyuan_noodle.jpg';

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
          child: SectionTitle(l10n['sectionFood']),
        ),
        const SizedBox(height: 2),
        const _FilterRow(labels: ['全部', '面食', '肉食', '小吃', '汤类']),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              _FoodListCard(
                image: _noodleImage,
                badge: '必吃',
                title: '太原一人食',
                desc: '热汤面配卤蛋、小菜，适合一个人快速吃饱。',
                note: '人均 ¥25 左右',
                heat: 4,
                onTap: () => showFoodDetail(c, 'foodDaoxiao', '🍜'),
              ),
              const SizedBox(height: 10),
              _FoodListCard(
                image: _noodleImage,
                badge: '招牌',
                title: '热汤刀削面',
                desc: '汤底鲜亮，面片厚实，葱花和卤味一起吃更香。',
                note: '推荐午餐',
                heat: 4,
                badgeColor: AppColors.gold,
                onTap: () => showFoodDetail(c, 'foodDaoxiao', '🍜'),
              ),
              const SizedBox(height: 10),
              _FoodListCard(
                image: _noodleImage,
                title: '卤蛋豆干加菜',
                desc: '卤蛋、豆干和青菜让一碗面更完整，单人餐刚好。',
                note: '加料更满足',
                heat: 3,
                onTap: () => showFoodDetail(c, 'foodTijian', '🥢'),
              ),
              const SizedBox(height: 10),
              _FoodListCard(
                image: _noodleImage,
                title: '一个人也好点',
                desc: '桌面小菜、茶水和主食都齐，动线清楚，不用纠结。',
                note: '适合赶行程',
                heat: 3,
                onTap: () => showFoodDetail(c, 'foodKaolao', '🫓'),
              ),
              const SizedBox(height: 10),
              _FoodListCard(
                image: _noodleImage,
                badge: '必吃',
                title: '酸辣口热汤面',
                desc: '汤色红亮但不压味，适合想吃点热乎重口的晚上。',
                note: '晚餐友好',
                heat: 4,
                onTap: () => showFoodDetail(c, 'foodDaoxiao', '🍜'),
              ),
              const SizedBox(height: 10),
              _FoodListCard(
                image: _noodleImage,
                title: '小菜拼盘',
                desc: '酸爽小菜可以解腻，适合作为面食清单里的辅助推荐。',
                note: '清爽解腻',
                heat: 2,
                onTap: () => showFoodDetail(c, 'foodDoufu', '🫕'),
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

class _FoodListCard extends StatelessWidget {
  final String image;
  final String? badge;
  final String title;
  final String desc;
  final String note;
  final int heat;
  final Color badgeColor;
  final VoidCallback onTap;

  const _FoodListCard({
    required this.image,
    this.badge,
    required this.title,
    required this.desc,
    required this.note,
    required this.heat,
    this.badgeColor = AppColors.red,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => HapticTap(
    onTap: onTap,
    child: Container(
      constraints: const BoxConstraints(minHeight: 148),
      decoration: cardDecoration(radius: 18),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          SizedBox(
            width: 136,
            height: 148,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                  alignment: const Alignment(-0.08, -0.18),
                ),
                const DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0x001E1810), Color(0x22FFFFFF)],
                    ),
                  ),
                ),
                if (badge != null)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 7,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: badgeColor,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x331E1810),
                            blurRadius: 7,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        badge!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(14, 13, 14, 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.ink,
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    desc,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.ink3,
                      fontSize: 11,
                      height: 1.42,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    note,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.gold,
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Row(
                    children: List.generate(5, (i) {
                      final active = i < heat;
                      return Container(
                        width: 6,
                        height: 6,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: active ? AppColors.red2 : AppColors.border,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
