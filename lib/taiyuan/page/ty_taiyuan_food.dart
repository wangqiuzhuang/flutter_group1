// ============================================
// 文件: lib/ty_taiyuan/ty_taiyuan_food.dart
// 用途: 太原城市 - 美食 Tab — UX v3
// ============================================

import 'package:flutter/material.dart';
import '../l10n/ty_app_localizations.dart';
import '../shared/ty_colors.dart';
import '../shared/ty_detail_sheet.dart';
import '../shared/ty_widgets.dart';

class TaiyuanFoodTab extends StatelessWidget {
  const TaiyuanFoodTab();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final foods = [
      _FoodData(
        keyName: 'foodDaoxiao',
        emoji: '🍜',
        imageAsset: 'assets/ty_taiyuan/images/taiyuan_noodle.jpg',
        name: l10n['foodDaoxiao'],
        sub: l10n['foodDaoxiaoSub'],
        heat: 5,
        badge: '必吃',
        badgeColor: AppColors.red,
        bg: const Color(0xFFF5E8D0),
      ),
      _FoodData(
        keyName: 'foodGuoyou',
        emoji: '🥩',
        name: l10n['foodGuoyou'],
        sub: l10n['foodGuoyouSub'],
        heat: 4,
        badge: '招牌',
        badgeColor: AppColors.gold,
        bg: const Color(0xFFF5D8D0),
      ),
      _FoodData(
        keyName: 'foodTounao',
        emoji: '🍲',
        name: l10n['foodTounao'],
        sub: l10n['foodTounaoSub'],
        heat: 3,
        bg: const Color(0xFFF0EEE0),
      ),
      _FoodData(
        keyName: 'foodYangzage',
        emoji: '🐑',
        name: l10n['foodYangzage'],
        sub: l10n['foodYangzageSub'],
        heat: 4,
        bg: const Color(0xFFEEF0E8),
      ),
      _FoodData(
        keyName: 'foodTijian',
        emoji: '🥢',
        name: l10n['foodTijian'],
        sub: l10n['foodTijianSub'],
        heat: 4,
        badge: '必吃',
        badgeColor: AppColors.red,
        bg: const Color(0xFFF0E8F0),
      ),
      _FoodData(
        keyName: 'foodKaolao',
        emoji: '🫓',
        name: l10n['foodKaolao'],
        sub: l10n['foodKaolaoSub'],
        heat: 3,
        bg: const Color(0xFFF5F0E0),
      ),
    ];

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: _FilterChips(labels: ['全部', '面食', '肉食', '小吃', '汤类']),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 20),
          sliver: SliverList.separated(
            itemCount: foods.length,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              final food = foods[index];
              return HapticTap(
                onTap: () => showFoodDetail(context, food.keyName, food.emoji),
                child: _FoodListCard(food: food),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _FoodListCard extends StatelessWidget {
  const _FoodListCard({required this.food});

  final _FoodData food;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border2),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A9B7A3A),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
          BoxShadow(
            color: Color(0x0D1E1810),
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          _FoodImage(food: food),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 12, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    food.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.ink,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    food.sub,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.ink3,
                      fontSize: 10,
                      height: 1.35,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _HeatDots(count: food.heat),
                  const SizedBox(height: 10),
                  const Text(
                    '点击查看推荐店铺',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: AppColors.ink4, fontSize: 9),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FoodImage extends StatelessWidget {
  const _FoodImage({required this.food});

  final _FoodData food;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 140,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (food.imageAsset != null)
            Image.asset(food.imageAsset!, fit: BoxFit.cover)
          else
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [food.bg, Color.lerp(food.bg, AppColors.ink2, .14)!],
                ),
              ),
              child: Center(
                child: Text(food.emoji, style: const TextStyle(fontSize: 40)),
              ),
            ),
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0x00FFFFFF), Color(0x66FFFFFF)],
                ),
              ),
            ),
          ),
          if (food.badge != null)
            Positioned(
              top: 7,
              right: 7,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: food.badgeColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  food.badge!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _HeatDots extends StatelessWidget {
  const _HeatDots({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Container(
          width: 6,
          height: 6,
          margin: const EdgeInsets.only(right: 3),
          decoration: BoxDecoration(
            color: index < count ? AppColors.red2 : AppColors.border,
            shape: BoxShape.circle,
          ),
        );
      }),
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

class _FoodData {
  final String keyName;
  final String emoji;
  final String? imageAsset;
  final String name;
  final String sub;
  final int heat;
  final String? badge;
  final Color badgeColor;
  final Color bg;

  const _FoodData({
    required this.keyName,
    required this.emoji,
    this.imageAsset,
    required this.name,
    required this.sub,
    required this.heat,
    this.badge,
    this.badgeColor = AppColors.gold,
    required this.bg,
  });
}
