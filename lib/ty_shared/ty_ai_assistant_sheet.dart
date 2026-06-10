import 'package:flutter/material.dart';

import 'ty_colors.dart';

Future<void> showTyAiAssistantSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    isDismissible: true,
    enableDrag: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    barrierColor: const Color(0x661E1810),
    builder: (context) => const _TyAiAssistantSheet(),
  );
}

class _TyAiAssistantSheet extends StatelessWidget {
  const _TyAiAssistantSheet();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: height * 0.68,
        constraints: const BoxConstraints(maxHeight: 430, minHeight: 360),
        decoration: const BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          border: Border(
            top: BorderSide(color: AppColors.border),
            left: BorderSide(color: AppColors.border),
            right: BorderSide(color: AppColors.border),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowMid,
              blurRadius: 20,
              offset: Offset(0, -4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            const SizedBox(height: 12),
            Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const _AssistantHeader(),
            const Expanded(child: _AssistantMessages()),
            const _QuickActions(),
            const _InputBar(),
            SizedBox(height: MediaQuery.paddingOf(context).bottom),
          ],
        ),
      ),
    );
  }
}

class _AssistantHeader extends StatelessWidget {
  const _AssistantHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border2)),
      ),
      child: Row(
        children: [
          const Text('🤖', style: TextStyle(fontSize: 20)),
          const SizedBox(width: 8),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '旅行助手',
                  style: TextStyle(
                    color: AppColors.ink,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  '了解太原城市信息',
                  style: TextStyle(
                    color: AppColors.ink3,
                    fontSize: 10,
                    height: 1.25,
                  ),
                ),
              ],
            ),
          ),
          IconButton.filledTonal(
            onPressed: () => Navigator.of(context).pop(),
            tooltip: '关闭',
            style: IconButton.styleFrom(
              backgroundColor: AppColors.border2,
              foregroundColor: AppColors.ink3,
              fixedSize: const Size(28, 28),
              minimumSize: const Size(28, 28),
              padding: EdgeInsets.zero,
            ),
            icon: const Icon(Icons.close_rounded, size: 17),
          ),
        ],
      ),
    );
  }
}

class _AssistantMessages extends StatelessWidget {
  const _AssistantMessages();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 10),
      physics: const BouncingScrollPhysics(),
      children: const [
        _MessageRow(
          avatar: '🤖',
          text: '你好！我是太原旅行助手，很高兴认识你。我可以帮你了解太原的美食、景点、历史文化和旅行路线。你想了解些什么呢？',
          isUser: false,
        ),
        SizedBox(height: 16),
        _MessageRow(avatar: '👤', text: '太原有什么特色美食？', isUser: true),
        SizedBox(height: 12),
        _MessageRow(
          avatar: '🤖',
          text: '太原作为面食之乡，最有名的是刀削面。除此之外还有过油肉、头脑、羊杂割等。你想深入了解哪一种美食呢？',
          isUser: false,
        ),
      ],
    );
  }
}

class _MessageRow extends StatelessWidget {
  final String avatar;
  final String text;
  final bool isUser;

  const _MessageRow({
    required this.avatar,
    required this.text,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    final avatarColor = isUser ? AppColors.redBg : AppColors.goldBg;
    final avatarBorder = isUser ? AppColors.redBorder : AppColors.goldBorder;
    final bubbleColor = isUser ? AppColors.redBg : AppColors.goldBg;
    final bubbleBorder = isUser ? AppColors.redBorder : AppColors.goldBorder;

    final children = [
      _Avatar(text: avatar, color: avatarColor, border: avatarBorder),
      const SizedBox(width: 8),
      Flexible(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: bubbleBorder),
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.ink,
              fontSize: 11,
              height: 1.5,
            ),
          ),
        ),
      ),
    ];

    return Row(
      mainAxisAlignment: isUser
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: isUser ? children.reversed.toList() : children,
    );
  }
}

class _Avatar extends StatelessWidget {
  final String text;
  final Color color;
  final Color border;

  const _Avatar({
    required this.text,
    required this.color,
    required this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: border),
      ),
      child: Center(child: Text(text, style: const TextStyle(fontSize: 14))),
    );
  }
}

class _QuickActions extends StatelessWidget {
  const _QuickActions();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 8),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border2)),
      ),
      child: const Wrap(
        spacing: 6,
        runSpacing: 8,
        children: [
          _ActionChip('🍜 美食推荐'),
          _ActionChip('🏛️ 景点介绍'),
          _ActionChip('📚 城市历史'),
          _ActionChip('🗺️ 旅行路线'),
        ],
      ),
    );
  }
}

class _ActionChip extends StatelessWidget {
  final String text;

  const _ActionChip(this.text);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.goldBg,
        foregroundColor: AppColors.gold,
        side: const BorderSide(color: AppColors.goldBorder),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
      ),
      child: Text(text),
    );
  }
}

class _InputBar extends StatelessWidget {
  const _InputBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 14),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border2)),
      ),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 40,
              child: TextField(
                decoration: InputDecoration(
                  hintText: '输入你的问题...',
                  hintStyle: const TextStyle(
                    color: AppColors.ink4,
                    fontSize: 13,
                  ),
                  filled: true,
                  fillColor: AppColors.bg,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: AppColors.border),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: AppColors.goldBorder),
                  ),
                ),
                style: const TextStyle(color: AppColors.ink, fontSize: 13),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 40,
            height: 40,
            child: FilledButton(
              onPressed: () {},
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.red,
                foregroundColor: Colors.white,
                padding: EdgeInsets.zero,
                shape: const CircleBorder(),
              ),
              child: const Icon(Icons.arrow_forward_rounded, size: 18),
            ),
          ),
        ],
      ),
    );
  }
}
