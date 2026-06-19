// ============================================
// 文件: lib/main.dart
// 用途: App 启动入口 — 城市选择主页
// 卡片: 北京 / 太原 / 临沂 / 温州泰顺 / 哈尔滨 / 其他 共6个
// 背景: 每个卡片为城市视频 (assets/videos/)
// ============================================

import 'package:flutter/material.dart';
import 'taiyuan/ty_taiyuan_app.dart';
import 'taiyuan/shared/ty_colors.dart';
import 'taiyuan/structure/ty_taiyuan_city_page.dart';
import 'beijing/beijing_entry.dart';
import 'linyi/linyi_page.dart';
import 'wenzhoutaishun/taishun_entry.dart'; // 温州泰顺入口
import 'haerbin/haerbin.dart'; // 哈尔滨入口

void main() => runApp(const TaiyuanApp());

class TyHomePage extends StatefulWidget {
  const TyHomePage({super.key});

  @override
  State<TyHomePage> createState() => _TyHomePageState();
}

class _TyHomePageState extends State<TyHomePage> {
  static const _cities = [
    _HomeCity(name: '北京', nameKo: '베이징', imageAsset: 'assets/images/beijing/great_wall.png', enabled: true),
    _HomeCity(name: '太原', nameKo: '타이위안', imageAsset: 'assets/images/taiyuan/bwy.jpg', enabled: true),
    _HomeCity(name: '临沂', nameKo: '린이', imageAsset: 'assets/images/linyi/chaoji.jpg', enabled: true),
    _HomeCity(name: '温州泰顺', nameKo: '원저우시 타이순현', imageAsset: 'assets/images/taishun/home_bg.jpg', enabled: true),
    _HomeCity(name: '哈尔滨', nameKo: '하얼빈', imageAsset: 'assets/images/harbin/central_street.jpg', enabled: true),
    _HomeCity(name: '其他', nameKo: '기타', imageAsset: '', enabled: false),
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
                  18, 16, 18, MediaQuery.of(context).padding.bottom + 18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final cardWidth = (constraints.maxWidth - 10) / 2;
                        return Wrap(
                          spacing: 10, runSpacing: 10,
                          children: [
                            for (final city in _cities)
                              SizedBox(
                                width: cardWidth,
                                child: _CityCard(
                                  city: city,
                                  onTap: city.enabled
                                      ? () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) {
                                        // 根据城市名跳转对应页面
                                        if (city.name == '北京') return const BeijingEntry();
                                        if (city.name == '临沂') return const LinyiPage();
                                        if (city.name == '温州泰顺') return const TaishunEntry();
                                        if (city.name == '哈尔滨') return const HarbinPage();
                                        return const TaiyuanCityPage(); // 默认太原
                                      },
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
          begin: Alignment.topLeft, end: Alignment.bottomRight,
          colors: [Color(0xFFEAE2D6), Color(0xFFDDD3C2)],
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('我和我的家乡', textAlign: TextAlign.center, style: TextStyle(color: AppColors.ink, fontSize: 28, fontWeight: FontWeight.w700, height: 1.2, letterSpacing: .4)),
          SizedBox(height: 6),
          Text('나와 나의 고향', textAlign: TextAlign.center, style: TextStyle(color: AppColors.ink3, fontSize: 13, fontWeight: FontWeight.w500, height: 1.3, letterSpacing: 1)),
          SizedBox(height: 8),
          Text('探索中国 · 每座城都有故事', textAlign: TextAlign.center, style: TextStyle(color: AppColors.ink4, fontSize: 11, height: 1.35, letterSpacing: .5)),
        ],
      ),
    );
  }
}

/// 城市卡片 — 静态图片背景 + 大号居中城市名
class _CityCard extends StatelessWidget {
  final _HomeCity city;
  final VoidCallback? onTap;

  const _CityCard({required this.city, required this.onTap});

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
            height: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border2),
              boxShadow: const [
                BoxShadow(color: AppColors.shadowMid, blurRadius: 20, offset: Offset(0, 4)),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(
                    child: city.imageAsset.isNotEmpty
                        ? Image.asset(city.imageAsset, fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(color: const Color(0xFF2C2C2C)))
                        : Container(color: const Color(0xFF111111)),
                  ),
                  Container(color: Colors.black.withValues(alpha: 0.4)),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(city.name, textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w800, letterSpacing: 4,
                            shadows: [Shadow(blurRadius: 8, offset: Offset(0, 2), color: Color(0x66000000))])),
                        const SizedBox(height: 4),
                        Text(city.nameKo,
                          style: const TextStyle(color: Colors.white70, fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 2,
                            shadows: [Shadow(blurRadius: 4, offset: Offset(0, 1), color: Color(0x44000000))])),
                        if (!city.enabled)
                          const Padding(padding: EdgeInsets.only(top: 6), child: Text('即将开放', style: TextStyle(color: Colors.white54, fontSize: 11))),
                      ],
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
  final String nameKo;
  final String imageAsset;
  final bool enabled;

  const _HomeCity({required this.name, required this.nameKo, required this.imageAsset, this.enabled = false});
}
