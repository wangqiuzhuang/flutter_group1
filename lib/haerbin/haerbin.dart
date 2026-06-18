import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// ══════════════════════════════════════════════
//  双语文本数据 / 이중 언어 텍스트 데이터
// ══════════════════════════════════════════════
class _L10n {
  final bool isChinese;
  const _L10n(this.isChinese);

  // ── Header ──
  String get province   => isChinese ? '黑龙江省'              : '헤이룽장성';
  String get cityName   => isChinese ? '哈尔滨'                : '하얼빈';
  String get subtitle   => isChinese ? '东方小巴黎 · 冰雪之城'   : '동방의 파리 · 얼음과 눈의 도시';
  String get langBtn    => isChinese ? '한국어'                 : '中文';

  // ── Tabs ──
  List<String> get tabs => isChinese
      ? ['地区介绍', '代表景点', '代表美食', '旅行路线', 'AI使用']
      : ['지역소개', '관광명소', '대표음식', '여행코스', 'AI활용'];

  // ── Section titles ──
  String get introTitle  => isChinese ? '家乡地区介绍'  : '고향 지역 소개';
  String get spotsTitle  => isChinese ? '代表旅游景点'  : '대표 관광명소';
  String get foodTitle   => isChinese ? '代表美食'      : '대표 음식';
  String get routeTitle  => isChinese ? '推荐旅行路线（1日游）' : '추천 여행 코스 (당일치기)';
  String get aiTitle     => isChinese ? 'AI 使用内容'   : 'AI 활용 내용';

  // ── Intro ──
  String get introText => isChinese
      ? '哈尔滨是黑龙江省省会，位于中国东北，素有"东方小巴黎"和"冰城"之称。受俄罗斯文化影响深远，充满异域风情，每年冬季举办的冰雪节享誉全球，吸引来自世界各地的游客。'
      : '하얼빈은 헤이룽장성의 성도로, 중국 동북부에 위치합니다. "동방의 파리"와 "얼음 도시"로 불리며, 러시아 문화의 영향을 깊이 받아 이국적인 분위기가 가득합니다. 매년 겨울 개최되는 빙설제는 세계적으로 유명하여 전 세계 관광객을 끌어모읍니다.';

  String get popLabel    => isChinese ? '人口'     : '인구';
  String get popValue    => isChinese ? '约1000万' : '약 1000만';
  String get climLabel   => isChinese ? '气候'     : '기후';
  String get climValue   => isChinese ? '温带大陆性' : '온대 대륙성';
  String get tempLabel   => isChinese ? '最低气温'  : '최저기온';
  String get tempValue   => '-38°C';
  String get festLabel   => isChinese ? '著名节日'  : '유명 축제';
  String get festValue   => isChinese ? '哈尔滨冰雪节' : '하얼빈 빙설제';

  // ── Spots ──
  List<Map<String, dynamic>> get spots => [
    {
      'imageUrl': 'assets/images/central_street.jpg',
      'name': isChinese ? '中央大街'    : '중앙대가',
      'desc': isChinese
          ? '始建于1898年，全长1450米，欧式建筑林立，是亚洲最长的步行街之一，也是哈尔滨的象征。'
          : '1898년에 건설된 전체 길이 1,450m의 보행자 거리로, 유럽식 건물이 즐비하며 아시아에서 가장 긴 보행자 거리 중 하나입니다.',
      'tag': isChinese ? '必去' : '필수',
      'icon': Icons.holiday_village,
    },
    {
      'imageUrl': 'assets/images/sophia.jpg',
      'name': isChinese ? '圣索菲亚教堂'  : '성 소피아 성당',
      'desc': isChinese
          ? '拜占庭式建筑，建于1907年，是哈尔滨最具代表性的历史建筑，现为建筑艺术博物馆。'
          : '1907년에 건립된 비잔틴 양식의 건축물로, 하얼빈을 대표하는 역사적 건물이며 현재는 건축예술박물관으로 사용됩니다.',
      'tag': isChinese ? '打卡' : '포토존',
      'icon': Icons.church,
    },
    {
      'imageUrl': 'assets/images/ice_world.jpg',
      'name': isChinese ? '冰雪大世界'   : '빙설대세계',
      'desc': isChinese
          ? '全球最大冰雪主题乐园，每年12月开放，冰雕作品规模震撼，夜晚灯光绚丽。'
          : '세계 최대 규모의 얼음 테마파크로, 매년 12월에 개장합니다. 거대한 얼음 조각과 화려한 야간 조명이 장관입니다.',
      'tag': isChinese ? '冬季' : '겨울추천',
      'icon': Icons.stars,
    },
    {
      'imageUrl': 'assets/images/sun_island.jpg',
      'name': isChinese ? '太阳岛风景区' : '태양도 풍경구',
      'desc': isChinese
          ? '松花江上的岛屿公园，夏季绿意盎然，冬季举办雪雕博览会，四季皆美。'
          : '쑹화강 위의 섬 공원으로, 여름에는 푸른 녹음이 우거지고 겨울에는 눈 조각 박람회가 열려 사계절 모두 아름답습니다.',
      'tag': isChinese ? '推荐' : '추천',
      'icon': Icons.park,
    },
  ];

  // ── Foods ──
  List<Map<String, String>> get foods => [
    {
      'name':  isChinese ? '哈尔滨红肠'   : '하얼빈 홍장',
      'desc':  isChinese ? '百年传统风味，肉质紧实，烟熏香浓' : '100년 전통의 훈제 소시지, 쫄깃하고 고소한 맛',
      'image': 'assets/images/food_hongchang.jpg',
    },
    {
      'name':  isChinese ? '锅包肉'       : '궈바오러우',
      'desc':  isChinese ? '酸甜外酥内嫩，东北名菜之首' : '새콤달콤 바삭한 동북 대표 요리',
      'image': 'assets/images/food_guobaoru.jpg',
    },
    {
      'name':  isChinese ? '马迭尔冰棍'   : '마디얼 아이스크림',
      'desc':  isChinese ? '百年老字号，冬天吃冰棍是哈尔滨特色' : '100년 노포, 영하에서 먹는 아이스크림이 하얼빈의 명물',
      'image': 'assets/images/food_icebar.jpg',
    },
    {
      'name':  isChinese ? '东北大拉皮'   : '동북 당면',
      'desc':  isChinese ? '劲道爽滑，搭配芝麻酱凉拌' : '탱탱하고 쫄깃한 당면에 참깨소스를 곁들인 냉채',
      'image': 'assets/images/food_dalapi.jpg',
    },
    {
      'name':  isChinese ? '杀猪菜'       : '사주채',
      'desc':  isChinese ? '东北传统宴席菜，酸菜血肠五花肉' : '동북 전통 잔칫상, 김치·선지순대·삼겹살 조합',
      'image': 'assets/images/food_shazhu.jpg',
    },
    {
      'name':  isChinese ? '地三鲜'       : '디산시엔',
      'desc':  isChinese ? '土豆茄子青椒，家常三宝' : '감자·가지·청피망 볶음, 동북 가정식의 대명사',
      'image': 'assets/images/food_disanxian.jpg',
    },
  ];

  // ── Route steps ──
  List<Map<String, String>> get routeSteps => [
    {
      'time':  '09:00 — 11:00',
      'place': isChinese ? '中央大街漫步'       : '중앙대가 산책',
      'tip':   isChinese ? '品尝马迭尔冰棍，感受欧式风情' : '마디얼 아이스크림 맛보고 유럽풍 거리 감상',
    },
    {
      'time':  '11:00 — 12:30',
      'place': isChinese ? '索菲亚教堂参观'      : '성 소피아 성당 관람',
      'tip':   isChinese ? '拍照打卡，了解建筑历史'     : '포토존 촬영 및 건축 역사 탐방',
    },
    {
      'time':  '12:30 — 14:00',
      'place': isChinese ? '东北特色午餐'        : '동북 특색 점심식사',
      'tip':   isChinese ? '推荐锅包肉、红肠拼盘'       : '궈바오러우, 홍장 모둠 추천',
    },
    {
      'time':  '14:00 — 17:00',
      'place': isChinese ? '太阳岛风景区'        : '태양도 풍경구',
      'tip':   isChinese ? '乘松花江轮渡前往，冬季看雪雕' : '쑹화강 페리 탑승, 겨울엔 눈 조각 감상',
    },
    {
      'time':  '18:00 — 21:00',
      'place': isChinese ? '冰雪大世界夜游'      : '빙설대세계 야간 관람',
      'tip':   isChinese ? '入夜后灯光最美，提前购票'    : '야경이 가장 아름다움, 사전 티켓 구매 필수',
    },
  ];

  // ── AI section ──
  String get aiBoxTitle => isChinese ? '本页面 AI 使用说明' : '이 페이지 AI 활용 내역';
  List<Map<String, dynamic>> get aiItems => [
    {'icon': Icons.edit_note,    'text': isChinese ? '使用 Claude AI 生成景点介绍文案'    : 'Claude AI로 관광지 소개 문구 생성'},
    {'icon': Icons.route,        'text': isChinese ? '使用 AI 辅助规划一日旅行路线'       : 'AI로 당일 여행 코스 계획 수립'},
    {'icon': Icons.translate,    'text': isChinese ? '使用 AI 翻译中韩双语页面内容'       : 'AI로 중한 이중 언어 번역'},
    {'icon': Icons.code,         'text': isChinese ? '使用 AI 辅助编写 Flutter Widget 代码' : 'AI로 Flutter 위젯 코드 작성 보조'},
    {'icon': Icons.image_search, 'text': isChinese ? '使用 AI 提供图片搜索关键词建议'     : 'AI로 이미지 검색 키워드 제안'},
  ];

  // ── Image fallback label ──
  String get bannerLabel => isChinese ? '哈尔滨冬季风光' : '하얼빈 겨울 풍경';
}

// ══════════════════════════════════════════════
//  메인 페이지
// ══════════════════════════════════════════════
class HarbinPage extends StatefulWidget {
  const HarbinPage({super.key});

  @override
  State<HarbinPage> createState() => _HarbinPageState();
}

class _HarbinPageState extends State<HarbinPage>
    with SingleTickerProviderStateMixin {
  int _selectedTab = 0;
  bool _isChinese = true; // true = 中文, false = 한국어

  late AnimationController _langAnimController;
  late Animation<double> _fadeAnim;

  @override
  void initState() {
    super.initState();
    _langAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _fadeAnim = CurvedAnimation(parent: _langAnimController, curve: Curves.easeInOut);
    _langAnimController.value = 1.0;
  }

  @override
  void dispose() {
    _langAnimController.dispose();
    super.dispose();
  }

  void _toggleLanguage() async {
    await _langAnimController.reverse();
    setState(() => _isChinese = !_isChinese);
    _langAnimController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final l = _L10n(_isChinese);

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: FadeTransition(
        opacity: _fadeAnim,
        child: CustomScrollView(
          slivers: [
            // ── Header ──
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              backgroundColor: const Color(0xFF0C447C),
              actions: [
                // 언어 전환 버튼
                Padding(
                  padding: const EdgeInsets.only(right: 12, top: 8),
                  child: GestureDetector(
                    onTap: _toggleLanguage,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white.withOpacity(0.4), width: 0.5),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.translate, size: 14, color: Colors.white),
                          const SizedBox(width: 4),
                          Text(
                            l.langBtn,
                            style: const TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: _HeaderVideoBanner(
                  assetPath: 'assets/videos/harbin_header.mp4',
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 56, 20, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(l.province,
                                style: const TextStyle(fontSize: 12, color: Color(0xFFB5D4F4))),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(l.cityName,
                                      style: const TextStyle(
                                          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white)),
                                  Text(l.subtitle,
                                      style: const TextStyle(fontSize: 13, color: Color(0xFFB5D4F4))),
                                ],
                              ),
                              const Icon(Icons.ac_unit, size: 48, color: Color(0x66B5D4F4)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ── 탭바 ──
            SliverPersistentHeader(
              pinned: true,
              delegate: _TabBarDelegate(
                selectedTab: _selectedTab,
                tabs: l.tabs,
                onTabSelected: (i) => setState(() => _selectedTab = i),
              ),
            ),

            // ── 본문 ──
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildIntroSection(l),
                    const SizedBox(height: 16),
                    _buildSpotsSection(l),
                    const SizedBox(height: 16),
                    _buildFoodSection(l),
                    const SizedBox(height: 16),
                    _buildRouteSection(l),
                    const SizedBox(height: 16),
                    _buildAISection(l),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── 1. 지역 소개 ──
  Widget _buildIntroSection(_L10n l) {
    return _SectionCard(
      icon: Icons.location_on,
      title: l.introTitle,
      child: Column(
        children: [
          // 顶部视频横幅
          const _VideoBanner(assetPath: 'assets/videos/harbin_banner.mp4'),
          const SizedBox(height: 12),
          Text(l.introText,
              style: const TextStyle(fontSize: 14, color: Color(0xFF555555), height: 1.7)),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 2.5,
            children: [
              _InfoCard(label: l.popLabel,  value: l.popValue),
              _InfoCard(label: l.climLabel, value: l.climValue),
              _InfoCard(label: l.tempLabel, value: l.tempValue),
              _InfoCard(label: l.festLabel, value: l.festValue),
            ],
          ),
        ],
      ),
    );
  }

  // ── 2. 관광명소 ──
  Widget _buildSpotsSection(_L10n l) {
    return _SectionCard(
      icon: Icons.photo_camera,
      title: l.spotsTitle,
      child: Column(
        children: l.spots.map((spot) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    spot['imageUrl'] as String,
                    width: 72, height: 72, fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 72, height: 72,
                      color: const Color(0xFFE6F1FB),
                      child: Icon(spot['icon'] as IconData,
                          color: const Color(0xFF185FA5), size: 28),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(spot['name'] as String,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600,
                                  color: Color(0xFF1A1A1A))),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE6F1FB),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(spot['tag'] as String,
                                style: const TextStyle(fontSize: 10, color: Color(0xFF0C447C))),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Text(spot['desc'] as String,
                          style: const TextStyle(
                              fontSize: 12.5, color: Color(0xFF777777), height: 1.5)),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // ── 3. 음식 ──
  Widget _buildFoodSection(_L10n l) {
    return _SectionCard(
      icon: Icons.restaurant,
      title: l.foodTitle,
      child: Column(
        children: l.foods.map((food) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFEEEEEE), width: 0.5),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.04),
                    blurRadius: 6, offset: const Offset(0, 2)),
              ],
            ),
            child: Row(
              children: [
                // 음식 이미지
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: Image.asset(
                    food['image']!,
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 90,
                      height: 90,
                      color: const Color(0xFFE6F1FB),
                      child: const Icon(Icons.dinner_dining,
                          color: Color(0xFF185FA5), size: 32),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // 음식 이름 + 설명
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(food['name']!,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1A1A1A))),
                        const SizedBox(height: 4),
                        Text(food['desc']!,
                            style: const TextStyle(
                                fontSize: 12.5,
                                color: Color(0xFF888888),
                                height: 1.5)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // ── 4. 여행 코스 ──
  Widget _buildRouteSection(_L10n l) {
    final steps = l.routeSteps;
    return _SectionCard(
      icon: Icons.map,
      title: l.routeTitle,
      child: Column(
        children: List.generate(steps.length, (index) {
          final step = steps[index];
          final isLast = index == steps.length - 1;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 28, height: 28,
                    decoration: const BoxDecoration(
                        color: Color(0xFF185FA5), shape: BoxShape.circle),
                    child: Center(
                      child: Text('${index + 1}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  if (!isLast) Container(width: 2, height: 48, color: const Color(0xFFB5D4F4)),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(step['place']!,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600,
                              color: Color(0xFF1A1A1A))),
                      Text(step['time']!,
                          style: const TextStyle(fontSize: 12, color: Color(0xFF185FA5))),
                      Text(step['tip']!,
                          style: const TextStyle(fontSize: 12, color: Color(0xFF888888))),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  // ── 5. AI 활용 ──
  Widget _buildAISection(_L10n l) {
    return _SectionCard(
      icon: Icons.smart_toy,
      title: l.aiTitle,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFE6F1FB),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFB5D4F4), width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l.aiBoxTitle,
                style: const TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF0C447C))),
            const SizedBox(height: 10),
            ...l.aiItems.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                children: [
                  Icon(item['icon'] as IconData, size: 16, color: const Color(0xFF185FA5)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(item['text'] as String,
                        style: const TextStyle(fontSize: 13, color: Color(0xFF185FA5))),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

// ══════════════════════════════════════════════
//  Header 비디오 배경 위젯
// ══════════════════════════════════════════════

class _HeaderVideoBanner extends StatefulWidget {
  final String assetPath;
  final Widget child; // 위에 올릴 텍스트/UI

  const _HeaderVideoBanner({required this.assetPath, required this.child});

  @override
  State<_HeaderVideoBanner> createState() => _HeaderVideoBannerState();
}

class _HeaderVideoBannerState extends State<_HeaderVideoBanner> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  Future<void> _initVideo() async {
    try {
      _controller = VideoPlayerController.asset(widget.assetPath);
      await _controller.initialize();
      _controller.setLooping(true);
      _controller.setVolume(0.0); // 자동재생 무음
      _controller.play();
      if (mounted) setState(() => _isInitialized = true);
    } catch (_) {
      // 실패 시 그라디언트 폴백 표시
      if (mounted) setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // ── 배경: 비디오 또는 그라디언트 폴백 ──
        if (_isInitialized)
          FittedBox(
            fit: BoxFit.cover,
            clipBehavior: Clip.hardEdge,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          )
        else
        // 비디오 로딩 전/실패 시 기존 그라디언트 유지
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF042C53), Color(0xFF185FA5)],
              ),
            ),
          ),

        // ── 영상 위 어두운 오버레이 (텍스트 가독성) ──
        if (_isInitialized)
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.35),
                  Colors.black.withOpacity(0.60),
                ],
              ),
            ),
          ),

        // ── 위에 올릴 텍스트/UI ──
        widget.child,
      ],
    );
  }
}

// ══════════════════════════════════════════════
//  비디오 배너 위젯
// ══════════════════════════════════════════════

class _VideoBanner extends StatefulWidget {
  final String assetPath;
  const _VideoBanner({required this.assetPath});

  @override
  State<_VideoBanner> createState() => _VideoBannerState();
}

class _VideoBannerState extends State<_VideoBanner> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  Future<void> _initVideo() async {
    try {
      _controller = VideoPlayerController.asset(widget.assetPath);
      await _controller.initialize();
      _controller.setLooping(true);   // 무한 반복
      _controller.setVolume(0.0);     // 음소거 (자동재생)
      _controller.play();
      if (mounted) setState(() => _isInitialized = true);
    } catch (e) {
      if (mounted) setState(() => _hasError = true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 加载失败时显示图片占位
    if (_hasError) {
      return const _ImageFallback(label: '哈尔滨冬季风光', icon: Icons.landscape);
    }

    // 加载中显示转圈
    if (!_isInitialized) {
      return const _ImageLoading(height: 200);
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // 视频播放器（保持宽高比）
          SizedBox(
            height: 200,
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.cover,
              clipBehavior: Clip.hardEdge,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          // 静音/取消静音 버튼
          Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _controller.setVolume(
                    _controller.value.volume == 0 ? 1.0 : 0.0,
                  );
                });
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.45),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _controller.value.volume == 0
                      ? Icons.volume_off
                      : Icons.volume_up,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ══════════════════════════════════════════════
//  공통 위젯
// ══════════════════════════════════════════════

class _SectionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;
  const _SectionCard({required this.icon, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Icon(icon, size: 20, color: const Color(0xFF185FA5)),
            const SizedBox(width: 6),
            Text(title,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF1A1A1A))),
          ]),
          const SizedBox(height: 12),
          const Divider(height: 1, color: Color(0xFFEEEEEE)),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String label;
  final String value;
  const _InfoCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F8FC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFDDE8F5), width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(fontSize: 11, color: Color(0xFF888888))),
          Text(value,
              style: const TextStyle(
                  fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xFF1A1A1A))),
        ],
      ),
    );
  }
}

class _ImageLoading extends StatelessWidget {
  final double height;
  final double? width;
  const _ImageLoading({required this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xFFE6F1FB), borderRadius: BorderRadius.circular(10)),
      child: const Center(
        child: SizedBox(
          width: 24, height: 24,
          child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFF185FA5)),
        ),
      ),
    );
  }
}

class _ImageFallback extends StatelessWidget {
  final String label;
  final IconData icon;
  const _ImageFallback({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160, width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xFFE6F1FB), borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: const Color(0xFF185FA5)),
          const SizedBox(height: 6),
          Text(label, style: const TextStyle(color: Color(0xFF185FA5), fontSize: 12)),
        ],
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final int selectedTab;
  final List<String> tabs;
  final ValueChanged<int> onTabSelected;
  const _TabBarDelegate(
      {required this.selectedTab, required this.tabs, required this.onTabSelected});

  @override double get minExtent => 52;
  @override double get maxExtent => 52;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: tabs.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = selectedTab == index;
          return GestureDetector(
            onTap: () => onTabSelected(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFF0C447C) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? const Color(0xFF0C447C) : const Color(0xFFDDDDDD),
                  width: 0.5,
                ),
              ),
              child: Text(tabs[index],
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    color: isSelected ? Colors.white : const Color(0xFF666666),
                  )),
            ),
          );
        },
      ),
    );
  }

  @override
  bool shouldRebuild(_TabBarDelegate old) => old.selectedTab != selectedTab || old.tabs != tabs;
}