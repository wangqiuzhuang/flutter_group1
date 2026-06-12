// ============================================
// 文件: lib/ty_taiyuan/ty_taiyuan_routes.dart
// 用途: 太原城市 - 路线 Tab — 浅色主题 v2
// 作者: testerwm
// 创建: 2026-06-09
// 说明: Chip 切换器 + 时间线步骤
// ============================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../shared/ty_colors.dart';
import '../l10n/ty_app_localizations.dart';
import '../shared/ty_widgets.dart';

class TaiyuanRoutesTab extends StatefulWidget {
  const TaiyuanRoutesTab();

  @override
  State<TaiyuanRoutesTab> createState() => _TaiyuanRoutesTabState();
}

class _TaiyuanRoutesTabState extends State<TaiyuanRoutesTab> {
  int _sel = 0;

  @override
  Widget build(BuildContext c) {
    final l10n = AppLocalizations.of(c);
    final routes = [
      (l10n['routeTitle'], l10n['routeSubtitle'], l10n['routeRecommend'],
          '1', '3', l10n['routeBudget']),
      (l10n['route2Title'], l10n['route2Subtitle'], '',
          '1', '3', l10n['route2Budget']),
      (l10n['route3Title'], l10n['route3Subtitle'], '',
          '0.5', '5', l10n['route3Budget']),
      (l10n['route4Title'], l10n['route4Subtitle'], '',
          '1', '3', l10n['route4Budget']),
      (l10n['route5Title'], l10n['route5Subtitle'], '',
          '1', '3', l10n['route5Budget']),
    ];

    return Column(children: [
      const SizedBox(height: 12),
      // ── Chip 切换器 ──
      SizedBox(
        height: 36,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 18),
          itemCount: routes.length,
          separatorBuilder: (_, i) => const SizedBox(width: 8),
          itemBuilder: (c, i) {
            final active = i == _sel;
            return GestureDetector(
              onTap: () => setState(() => _sel = i),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: active ? AppColors.red : AppColors.bgCard,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: active ? AppColors.red : AppColors.border,
                  ),
                ),
                child: Text(
                  routes[i].$1,
                  style: TextStyle(
                    color: active ? Colors.white : AppColors.ink2,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      const SizedBox(height: 14),
      // ── 路线内容 ──
      Expanded(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: ListView(
            key: ValueKey(_sel),
            padding: const EdgeInsets.only(bottom: 20),
            physics: const BouncingScrollPhysics(),
            children: [
              _buildRoute(
                c,
                l10n,
                routes[_sel].$1,
                routes[_sel].$2,
                routes[_sel].$3,
                routes[_sel].$4,
                routes[_sel].$5,
                routes[_sel].$6,
                _stepDefs(l10n),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  List<(int, String, String, String, String, String, Color)> _stepDefs(
      AppLocalizations l10n) {
    final routes =
        <List<(int, String, String, String, String, String, Color)>>[
      [
        (1, l10n['routeStep1Time'], l10n['routeStep1Title'],
            l10n['routeStep1Sub'], l10n['routeStep1Transport'],
            l10n['routeStep1Tip'], AppColors.red),
        (2, l10n['routeStep2Time'], l10n['routeStep2Title'],
            l10n['routeStep2Sub'], l10n['routeStep2Transport'],
            l10n['routeStep2Tip'], const Color(0xFFB84C2E)),
        (3, l10n['routeStep3Time'], l10n['routeStep3Title'],
            l10n['routeStep3Sub'], l10n['routeStep3Transport'],
            l10n['routeStep3Tip'], const Color(0xFF9B3A2A)),
      ],
      [
        (1, l10n['route2Step1Time'], l10n['route2Step1Title'],
            l10n['route2Step1Sub'], l10n['route2Step1Transport'],
            l10n['route2Step1Tip'], AppColors.red),
        (2, l10n['route2Step2Time'], l10n['route2Step2Title'],
            l10n['route2Step2Sub'], l10n['route2Step2Transport'],
            l10n['route2Step2Tip'], const Color(0xFFB84C2E)),
        (3, l10n['route2Step3Time'], l10n['route2Step3Title'],
            l10n['route2Step3Sub'], l10n['route2Step3Transport'],
            l10n['route2Step3Tip'], const Color(0xFF9B3A2A)),
      ],
      [
        (1, l10n['route3Step1Time'], l10n['route3Step1Title'],
            l10n['route3Step1Sub'], l10n['route3Step1Transport'],
            l10n['route3Step1Tip'], AppColors.red),
        (2, l10n['route3Step2Time'], l10n['route3Step2Title'],
            l10n['route3Step2Sub'], l10n['route3Step2Transport'],
            l10n['route3Step2Tip'], const Color(0xFFB84C2E)),
        (3, l10n['route3Step3Time'], l10n['route3Step3Title'],
            l10n['route3Step3Sub'], l10n['route3Step3Transport'],
            l10n['route3Step3Tip'], const Color(0xFF9B3A2A)),
        (4, l10n['route3Step4Time'], l10n['route3Step4Title'],
            l10n['route3Step4Sub'], l10n['route3Step4Transport'],
            l10n['route3Step4Tip'], const Color(0xFF6E2A1A)),
      ],
      [
        (1, l10n['route4Step1Time'], l10n['route4Step1Title'],
            l10n['route4Step1Sub'], l10n['route4Step1Transport'],
            l10n['route4Step1Tip'], AppColors.red),
        (2, l10n['route4Step2Time'], l10n['route4Step2Title'],
            l10n['route4Step2Sub'], l10n['route4Step2Transport'],
            l10n['route4Step2Tip'], const Color(0xFFB84C2E)),
        (3, l10n['route4Step3Time'], l10n['route4Step3Title'],
            l10n['route4Step3Sub'], l10n['route4Step3Transport'],
            l10n['route4Step3Tip'], const Color(0xFF9B3A2A)),
      ],
      [
        (1, l10n['route5Step1Time'], l10n['route5Step1Title'],
            l10n['route5Step1Sub'], l10n['route5Step1Transport'],
            l10n['route5Step1Tip'], AppColors.red),
        (2, l10n['route5Step2Time'], l10n['route5Step2Title'],
            l10n['route5Step2Sub'], l10n['route5Step2Transport'],
            l10n['route5Step2Tip'], const Color(0xFFB84C2E)),
        (3, l10n['route5Step3Time'], l10n['route5Step3Title'],
            l10n['route5Step3Sub'], l10n['route5Step3Transport'],
            l10n['route5Step3Tip'], const Color(0xFF9B3A2A)),
      ],
    ];
    return routes[_sel.clamp(0, 4)];
  }
}

Widget _buildRoute(
  BuildContext c,
  AppLocalizations l10n,
  String title,
  String sub,
  String pill,
  String day,
  String stops,
  String budget,
  List<(int, String, String, String, String, String, Color)> steps,
) {
  return Column(children: [
    const SizedBox(height: 4),
    // ── 路线头部 ──
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.ink,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  sub,
                  style: const TextStyle(
                    color: AppColors.ink3,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          if (pill.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.goldBg,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: AppColors.goldBorder),
              ),
              child: Text(
                pill,
                style: const TextStyle(
                  color: AppColors.gold,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    ),
    const SizedBox(height: 14),
    // ── 时间线步骤 ──
    for (int i = 0; i < steps.length; i++)
      _RouteStep(
        step: steps[i].$1,
        time: steps[i].$2,
        title: steps[i].$3,
        subtitle: steps[i].$4,
        transport: steps[i].$5,
        tip: steps[i].$6,
        isLast: i == steps.length - 1,
      ),
    const SizedBox(height: 12),
    // ── 复制按钮 ──
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: InkWell(
        onTap: () {
          final lines = [title, ''];
          for (final s in steps) {
            lines.add('${s.$2}  ${s.$3}');
            lines.add(s.$4);
            lines.add('');
          }
          Clipboard.setData(ClipboardData(text: lines.join('\n')));
          ScaffoldMessenger.of(c).showSnackBar(
            SnackBar(
              content: Text(
                l10n['detailCopied'],
                style: const TextStyle(fontSize: 13),
              ),
              backgroundColor: AppColors.ink2,
              duration: const Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        },
        borderRadius: BorderRadius.circular(14),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 13),
          decoration: BoxDecoration(
            color: AppColors.red,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                color: Color(0x4DB84C2E),
                blurRadius: 16,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              l10n['detailCopyRoute'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    ),
    const SizedBox(height: 14),
    // ── 底部统计 ──
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(children: [
        Expanded(
            child: StatTile(value: day, label: l10n['statDays'])),
        const SizedBox(width: 8),
        Expanded(
            child: StatTile(
                value: stops, label: l10n['statCheckpoints'])),
        const SizedBox(width: 8),
        Expanded(
            child: StatTile(
                value: budget, label: l10n['statBudget'])),
      ]),
    ),
  ]);
}

// ── 单条路线步骤（时间线样式） ──

class _RouteStep extends StatefulWidget {
  final int step;
  final String time, title, subtitle, transport, tip;
  final bool isLast;
  const _RouteStep({
    required this.step,
    required this.time,
    required this.title,
    required this.subtitle,
    required this.transport,
    required this.tip,
    required this.isLast,
  });

  @override
  State<_RouteStep> createState() => _RouteStepState();
}

class _RouteStepState extends State<_RouteStep> {
  bool _on = false;

  @override
  Widget build(BuildContext c) => Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 时间线脊柱
        SizedBox(
          width: 44,
          child: Column(children: [
            RouteStepDot(widget.step),
            if (!widget.isLast)
              DashedLine(height: _on ? 64 : 28),
          ]),
        ),
        // 步骤卡片
        Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _on = !_on),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: widget.isLast ? 0 : 8,
                right: 18,
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                decoration: cardDecoration(radius: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Expanded(
                        child: Text(
                          widget.title,
                          style: const TextStyle(
                            color: AppColors.ink,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      AnimatedRotation(
                        duration: const Duration(milliseconds: 250),
                        turns: _on ? 0.5 : 0,
                        child: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 18,
                          color: AppColors.ink4,
                        ),
                      ),
                    ]),
                    const SizedBox(height: 3),
                    Text(
                      widget.subtitle,
                      style: const TextStyle(
                        color: AppColors.ink3,
                        fontSize: 10,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '🕐 ${widget.time}',
                      style: const TextStyle(
                        color: AppColors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (_on) ...[
                      const SizedBox(height: 8),
                      Container(
                        height: 0.5,
                        color: AppColors.border,
                      ),
                      const SizedBox(height: 8),
                      _expRow('🚌', widget.transport),
                      const SizedBox(height: 5),
                      _expRow('💡', widget.tip),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _expRow(String i, String t) => Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(i, style: const TextStyle(fontSize: 12)),
    const SizedBox(width: 6),
    Expanded(
      child: Text(
        t,
        style: const TextStyle(
          color: AppColors.ink3,
          fontSize: 10,
          height: 1.45,
        ),
      ),
    ),
  ],
);
