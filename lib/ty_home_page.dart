import 'package:flutter/material.dart';

import 'ty_shared/ty_colors.dart';
import 'ty_taiyuan/ty_taiyuan_city_page.dart';

class TyHomePage extends StatelessWidget {
  const TyHomePage({super.key});

  static const _cities = [
    _HomeCity(
      name: '太原',
      desc: '龙城文脉 · 汾河烟火',
      emoji: '🏯',
      colors: [Color(0xFFF0E8D8), Color(0xFFDDD0B8)],
      enabled: true,
    ),
    _HomeCity(
      name: '成都',
      desc: '天府之国 · 悠闲慢生活',
      emoji: '🏮',
      colors: [Color(0xFFE8EEF5), Color(0xFFCCD8E8)],
    ),
    _HomeCity(
      name: '北京',
      desc: '千年古都 · 国家中心',
      emoji: '🏰',
      colors: [Color(0xFFF8E8E0), Color(0xFFE8C8B8)],
    ),
    _HomeCity(
      name: '上海',
      desc: '魔都繁华 · 现代摩天',
      emoji: '🌉',
      colors: [Color(0xFFE0F0D8), Color(0xFFC0D8A8)],
    ),
    _HomeCity(
      name: '西安',
      desc: '古都长安 · 十朝故都',
      emoji: '🏛️',
      colors: [Color(0xFFF0E0E8), Color(0xFFE0C0D0)],
    ),
    _HomeCity(
      name: '杭州',
      desc: '西湖梦幻 · 江南诗画',
      emoji: '🌸',
      colors: [Color(0xFFE8E0F0), Color(0xFFD0C8E0)],
    ),
    _HomeCity(
      name: '南京',
      desc: '六朝古都 · 十里秦淮',
      emoji: '🏮',
      colors: [Color(0xFFF0E8E0), Color(0xFFE0D0C0)],
    ),
    _HomeCity(
      name: '苏州',
      desc: '园林古城 · 人间天堂',
      emoji: '🌊',
      colors: [Color(0xFFE8F0F0), Color(0xFFD0E0E0)],
    ),
    _HomeCity(
      name: '武汉',
      desc: '九省通衢 · 江汉明珠',
      emoji: '🌉',
      colors: [Color(0xFFF0F0E8), Color(0xFFE0E0D0)],
    ),
    _HomeCity(
      name: '重庆',
      desc: '山城夜景 · 火锅之都',
      emoji: '🏔️',
      colors: [Color(0xFFF5E8E0), Color(0xFFE8D0C0)],
    ),
    _HomeCity(
      name: '广州',
      desc: '花城商都 · 食在广州',
      emoji: '🌺',
      colors: [Color(0xFFF8E0E8), Color(0xFFE8C0D0)],
    ),
    _HomeCity(
      name: '深圳',
      desc: '鹏城创新 · 科技之窗',
      emoji: '🌴',
      colors: [Color(0xFFE0F0E8), Color(0xFFC8E0D0)],
    ),
    _HomeCity(
      name: '长沙',
      desc: '星城热辣 · 湘味之魂',
      emoji: '🔥',
      colors: [Color(0xFFF8E8E0), Color(0xFFF0D0C0)],
    ),
    _HomeCity(
      name: '厦门',
      desc: '海上花园 · 文艺鹭岛',
      emoji: '🏖️',
      colors: [Color(0xFFE0F0F8), Color(0xFFC8E0F0)],
    ),
    _HomeCity(
      name: '青岛',
      desc: '红瓦绿树 · 啤酒之都',
      emoji: '🍺',
      colors: [Color(0xFFE8F0E8), Color(0xFFD0E0D0)],
    ),
    _HomeCity(
      name: '昆明',
      desc: '春城花都 · 云岭之南',
      emoji: '🦚',
      colors: [Color(0xFFF0E8F0), Color(0xFFE0D0E0)],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _HomeHeader(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.fromLTRB(
                  18,
                  16,
                  18,
                  MediaQuery.of(context).padding.bottom + 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '热门城市',
                      style: TextStyle(
                        color: AppColors.ink,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 10),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final cardWidth = (constraints.maxWidth - 10) / 2;

                        return Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            for (final city in _cities)
                              SizedBox(
                                width: cardWidth,
                                child: _CityCard(
                                  city: city,
                                  onTap: city.enabled
                                      ? () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) =>
                                                const TaiyuanCityPage(),
                                          ),
                                        )
                                      : null,
                                ),
                              ),
                          ],
                        );
                      },
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
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFEAE2D6), Color(0xFFDDD3C2)],
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '旅见',
            style: TextStyle(
              color: AppColors.ink,
              fontSize: 28,
              fontWeight: FontWeight.w700,
              height: 1.2,
              letterSpacing: .4,
            ),
          ),
          SizedBox(height: 6),
          Text(
            '探索中国 · 每座城都有故事',
            style: TextStyle(
              color: AppColors.ink4,
              fontSize: 12,
              height: 1.35,
              letterSpacing: .5,
            ),
          ),
        ],
      ),
    );
  }
}

class _CityCard extends StatelessWidget {
  const _CityCard({required this.city, required this.onTap});

  final _HomeCity city;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: city.enabled,
      label: city.enabled ? '查看${city.name}详情' : '${city.name}暂未开放',
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Ink(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border2),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: city.colors,
              ),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadowMid,
                  blurRadius: 20,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Stack(
                children: [
                  Positioned(
                    left: -20,
                    top: -24,
                    child: Container(
                      width: 92,
                      height: 92,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: .22),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 18,
                    left: 0,
                    right: 0,
                    child: Text(
                      city.emoji,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 36, height: 1),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(12, 28, 12, 12),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0x00000000), Color(0x66000000)],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            city.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xFFFFFCF7),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              height: 1.25,
                              letterSpacing: 1,
                              shadows: [
                                Shadow(
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                  color: Color(0x33000000),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            city.desc,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xEFFFFCF7),
                              fontSize: 9,
                              height: 1.4,
                              shadows: [
                                Shadow(
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                  color: Color(0x33000000),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            city.enabled ? '★★★★★' : '即将开放',
                            style: const TextStyle(
                              color: Color(0xFFFFFCF7),
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeCity {
  final String name;
  final String desc;
  final String emoji;
  final List<Color> colors;
  final bool enabled;

  const _HomeCity({
    required this.name,
    required this.desc,
    required this.emoji,
    required this.colors,
    this.enabled = false,
  });
}
