/// 北京模块入口 — 嵌入小组项目
/// 包装 AppStateProvider 后渲染 HomeScreen
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'utils/app_state.dart';

class BeijingEntry extends StatelessWidget {
  const BeijingEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return AppStateProvider(
      child: const HomeScreen(),
    );
  }
}
