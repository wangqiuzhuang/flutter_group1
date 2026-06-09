// ============================================
// 文件: lib/ty_taiyuan_app.dart
// 用途: 太原城市 App 入口
// 作者: testerwm
// 创建: 2026-06-09
// 说明:
//   - 当前展示太原城市页面
//   - 其他成员替换 home 为自己的城市页即可
//   - 如需城市列表，在此文件添加路由或首页选择逻辑
// ============================================

import 'package:flutter/material.dart';
import 'ty_app.dart';
import 'ty_city_page.dart';
import 'ty_taiyuan/ty_taiyuan_intro.dart';
import 'ty_taiyuan/ty_taiyuan_spots.dart';
import 'ty_taiyuan/ty_taiyuan_food.dart';
import 'ty_taiyuan/ty_taiyuan_routes.dart';

/// 太原城市 App
/// 其他成员参考此结构，替换 tabs 为自己的 Tab 内容
class TaiyuanApp extends StatelessWidget {
  const TaiyuanApp();

  /// 太原专属：4 个 Tab 的背景色 + emoji
  static const _heroBg = [
    (color: Color(0xFF1a1028), emoji: '🏯'),
    (color: Color(0xFF0f1a14), emoji: '🌲'),
    (color: Color(0xFF1a0d08), emoji: '🍲'),
    (color: Color(0xFF081420), emoji: '🗺️'),
  ];

  @override
  Widget build(BuildContext context) => MyApp(home: CityPage(
    tabs: const [
      TaiyuanIntroTab(),
      TaiyuanSpotsTab(),
      TaiyuanFoodTab(),
      TaiyuanRoutesTab(),
    ],
    heroBackgrounds: _heroBg,
  ));
}
