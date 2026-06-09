// ============================================
// 文件: lib/ty_shared/ty_tab_row.dart
// 用途: Tab 栏组件（支持点击切换 + 滑动指示器跟随）
// 作者: testerwm
// 创建: 2026-06-09
// 说明: 通过 PageController 监听滑动偏移量，
//       指示器实时跟随手指移动
// ============================================

import 'package:flutter/material.dart';
import 'ty_colors.dart';

class CityTabRow extends StatefulWidget {
  final List<String> tabs;
  final PageController pageCtrl;
  final ValueChanged<int> onTap;

  const CityTabRow({required this.tabs, required this.pageCtrl, required this.onTap});

  @override
  State<CityTabRow> createState() => _CityTabRowState();
}

class _CityTabRowState extends State<CityTabRow> {
  double _page = 0;

  @override
  void initState() {
    super.initState();
    _page = 0;
    widget.pageCtrl.addListener(_onPage);
  }

  void _onPage() {
    final p = widget.pageCtrl.page ?? 0;
    if (p != _page && mounted) setState(() => _page = p);
  }

  @override
  void dispose() { widget.pageCtrl.removeListener(_onPage); super.dispose(); }

  Widget _tab(String text, int i, double tabW) => Expanded(child: GestureDetector(
    onTap: () => widget.onTap(i), behavior: HitTestBehavior.opaque,
    child: Center(child: AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 200),
      style: TextStyle(color: (_page - i).abs() < 0.5 ? AppColors.gold : AppColors.textPrimary.withValues(alpha: .34), fontSize: 13, fontWeight: (_page - i).abs() < 0.5 ? FontWeight.w600 : FontWeight.w500),
      child: Text(text),
    )),
  ));

  @override
  Widget build(BuildContext c) => SizedBox(height: 44, child: LayoutBuilder(builder: (c, cons) {
    final tabW = cons.maxWidth / widget.tabs.length;
    return Stack(children: [
      Row(children: [for (int i = 0; i < widget.tabs.length; i++) _tab(widget.tabs[i], i, tabW)]),
      Positioned(bottom: 0, left: _page * tabW + tabW * .22, width: tabW * .56, child: Container(height: 2, decoration: BoxDecoration(color: AppColors.gold, borderRadius: BorderRadius.circular(4)))),
    ]);
  }));
}
