// ============================================
// 文件: lib/ty_shared/ty_colors.dart
// 用途: 全局颜色常量，所有页面共用
// 作者: testerwm
// 创建: 2026-06-09
// 说明: 请勿在此添加城市专属颜色，
//       城市专属样式放在 lib/cities/<name>/ 下
// ============================================

import 'package:flutter/material.dart';

class AppColors {
  static const ink = Color(0xFF0D0D14);
  static const panel = Color(0xFF161622);
  static const gold = Color(0xFFC8A96E);
  static const textPrimary = Color(0xFFF6F1E9);
  static const hairline = Color(0x14F6F1E9);

  // 毛玻璃面板：比 panel 更透，模拟 glass 效果
  static const panelGlass = Color(0xBB161622);
  static const glassBorder = Color(0x0FFFFFFF);
}
