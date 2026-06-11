// ============================================
// 文件: lib/main.dart
// 用途: App 启动入口 — 城市选择主页
// 卡片: 太原 / 北京 / 临沂 / 其他 / 其他 共5个
// 背景: 每个卡片为城市视频 (assets/videos/)
// ============================================

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'taiyuan/ty_taiyuan_app.dart';
import 'taiyuan/shared/ty_colors.dart';
import 'taiyuan/structure/ty_taiyuan_city_page.dart';
import 'beijing/beijing_entry.dart';

void main() => runApp(const TaiyuanApp());

class TyHomePage extends StatefulWidget {
  const TyHomePage({super.key});

  @override
  State<TyHomePage> createState() => _TyHomePageState();
}

class _TyHomePageState extends State<TyHomePage> {
  static const _cities = [
    _HomeCity(name: '太原', nameKo: '타이위안', videoAsset: 'assets/videos/taiyuan.mp4', enabled: true),
    _HomeCity(name: '北京', nameKo: '베이징', videoAsset: 'assets/videos/beijing.mp4', enabled: true),
    _HomeCity(name: '临沂', nameKo: '린이', videoAsset: 'assets/videos/linyi.mp4', enabled: true),
    _HomeCity(name: '温州', nameKo: '원저우', videoAsset: 'assets/videos/wenzhou.mp4', enabled: false),
    _HomeCity(name: '哈尔滨', nameKo: '하얼빈', videoAsset: 'assets/videos/haerbin.mp4', enabled: false),
    _HomeCity(name: '其他', nameKo: '기타', videoAsset: 'assets/videos/other3.mp4', enabled: false),
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
                    const Text(
                      '热门城市',
                      style: TextStyle(color: AppColors.ink, fontSize: 14, fontWeight: FontWeight.w600, height: 1.25),
                    ),
                    const SizedBox(height: 10),
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
                                      builder: (_) => city.name == '北京'
                                          ? const BeijingEntry()
                                          : const TaiyuanCityPage(),
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

/// 城市卡片 — 视频背景 + 大号居中城市名
class _CityCard extends StatefulWidget {
  final _HomeCity city;
  final VoidCallback? onTap;

  const _CityCard({required this.city, required this.onTap});

  @override
  State<_CityCard> createState() => _CityCardState();
}

class _CityCardState extends State<_CityCard> {
  VideoPlayerController? _controller;
  bool _initFailed = false;

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  void _initVideo() {
    try {
      _controller = VideoPlayerController.asset(widget.city.videoAsset)
        ..initialize().then((_) {
          if (mounted) {
            setState(() {});
            _controller!.setLooping(true);
            _controller!.setVolume(0); // 静音播放
            _controller!.play();
          }
        }).catchError((_) {
          if (mounted) setState(() => _initFailed = true);
        });
    } catch (_) {
      if (mounted) setState(() => _initFailed = true);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasVideo = _controller != null && _controller!.value.isInitialized;

    return Semantics(
      button: widget.city.enabled,
      label: widget.city.enabled ? '查看${widget.city.name}详情' : '${widget.city.name}暂未开放',
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(14),
          child: Ink(
            height: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border2),
              color: const Color(0xFF2C2C2C), // 默认暗色背景 (视频加载前)
              boxShadow: const [
                BoxShadow(color: AppColors.shadowMid, blurRadius: 20, offset: Offset(0, 4)),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  /// 视频背景（加载完成后显示）
                  if (hasVideo)
                    Positioned.fill(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          width: _controller!.value.size.width,
                          height: _controller!.value.size.height,
                          child: VideoPlayer(_controller!),
                        ),
                      ),
                    ),

                  /// 加载失败时的纯色背景
                  if (!hasVideo && !_initFailed)
                    const Center(child: CircularProgressIndicator(color: Colors.white24, strokeWidth: 2)),

                  /// 暗色遮罩 — 让白色文字清晰可见
                  Container(color: Colors.black.withValues(alpha: 0.4)),

                  /// 城市名 — 中文 + 韩语居中
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.city.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 4,
                            shadows: [Shadow(blurRadius: 8, offset: Offset(0, 2), color: Color(0x66000000))],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.city.nameKo,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2,
                            shadows: [Shadow(blurRadius: 4, offset: Offset(0, 1), color: Color(0x44000000))],
                          ),
                        ),
                        if (!widget.city.enabled)
                          const Padding(
                            padding: EdgeInsets.only(top: 6),
                            child: Text('即将开放', style: TextStyle(color: Colors.white54, fontSize: 11)),
                          ),
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
  final String videoAsset;
  final bool enabled;

  const _HomeCity({required this.name, required this.nameKo, required this.videoAsset, this.enabled = false});
}
