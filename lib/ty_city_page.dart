// ============================================
// 文件: lib/ty_city_page.dart
// 用途: 城市页面框架（Hero + Tab栏 + 内容区 + 滑动切换）
// 作者: testerwm
// 创建: 2026-06-09
// 说明: 所有城市页面共用此框架，
//       只需传入 4 个 Tab 内容 Widget + Hero 背景配置
// ============================================

import 'package:flutter/material.dart';
import 'ty_l10n/ty_app_localizations.dart';
import 'ty_shared/ty_colors.dart';
import 'ty_shared/ty_hero_header.dart';
import 'ty_shared/ty_tab_row.dart';
import 'ty_shared/ty_lang_sheet.dart';

class CityPage extends StatefulWidget {
  /// 当前激活的 Tab 索引，供子组件（如视频）判断是否可见
  static final ValueNotifier<int> activeTab = ValueNotifier(0);
  /// 4 个 Tab 的内容 Widget
  final List<Widget> tabs;

  /// Hero 背景配置（每个 Tab 一个背景色+emoji）
  final List<({Color color, String emoji})> heroBackgrounds;

  /// Hero 中 l10n key 前缀（默认 heroProvince / heroCityName / heroSubtitle）
  final String provinceKey;
  final String cityKey;
  final String subtitleKey;

  const CityPage({
    required this.tabs,
    required this.heroBackgrounds,
    this.provinceKey = 'heroProvince',
    this.cityKey = 'heroCityName',
    this.subtitleKey = 'heroSubtitle',
  });

  @override
  State<CityPage> createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  int _tab = 0;
  double _scroll = 0;
  late final PageController _pageCtrl = PageController();

  @override
  void dispose() { _pageCtrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tabNames = [l10n['tabIntro'], l10n['tabSpots'], l10n['tabFood'], l10n['tabRoute']];

    return Scaffold(
      body: SafeArea(bottom: false, child: Column(children: [
        CityHeroHeader(tab: _tab, onLangTap: () => showLangSheet(context), provinceKey: widget.provinceKey, cityKey: widget.cityKey, subtitleKey: widget.subtitleKey, backgrounds: widget.heroBackgrounds),
        Container(
          decoration: BoxDecoration(
            border: const Border(bottom: BorderSide(color: AppColors.hairline, width: .6)),
            boxShadow: _scroll > 2 ? [BoxShadow(color: Colors.black.withValues(alpha: .22), blurRadius: 5, offset: const Offset(0, 2))] : null,
          ),
          child: CityTabRow(tabs: tabNames, pageCtrl: _pageCtrl, onTap: (i) => _pageCtrl.animateToPage(i, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut)),
        ),
        Expanded(child: PageView(
          controller: _pageCtrl,
          onPageChanged: (i) => setState(() { _tab = i; _scroll = 0; CityPage.activeTab.value = i; }),
          children: widget.tabs,
        )),
      ])),
    );
  }
}
