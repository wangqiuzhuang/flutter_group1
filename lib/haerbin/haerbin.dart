import 'package:flutter/material.dart';

void main() {
  runApp(const HarbinApp());
}

class HarbinApp extends StatelessWidget {
  const HarbinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '哈尔滨家乡页',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A3A5C),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'sans-serif',
      ),
      home: const HarbinHomePage(),
    );
  }
}

// ─────────────────────────────────────────────
// 颜色常量
// ─────────────────────────────────────────────
class HarbinColors {
  static const deepBlue   = Color(0xFF1A3A5C);  // 冬夜深蓝
  static const iceBlue    = Color(0xFFB8D8F0);  // 冰雪浅蓝
  static const gold       = Color(0xFFD4A853);  // 索菲亚金
  static const snowWhite  = Color(0xFFF5F9FF);  // 雪白
  static const darkText   = Color(0xFF1A2533);
  static const lightText  = Color(0xFF6B8299);
}

// ─────────────────────────────────────────────
// 首页（导航中心）
// ─────────────────────────────────────────────
class HarbinHomePage extends StatefulWidget {
  const HarbinHomePage({super.key});

  @override
  State<HarbinHomePage> createState() => _HarbinHomePageState();
}

class _HarbinHomePageState extends State<HarbinHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    IntroPage(),
    AttractionsPage(),
    FoodPage(),
    TravelRoutePage(),
    GalleryPage(),
    AIPage(),
  ];

  final List<NavigationDestination> _destinations = const [
    NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: '地区介绍'),
    NavigationDestination(icon: Icon(Icons.photo_camera_outlined), selectedIcon: Icon(Icons.photo_camera), label: '景点'),
    NavigationDestination(icon: Icon(Icons.restaurant_outlined), selectedIcon: Icon(Icons.restaurant), label: '美食'),
    NavigationDestination(icon: Icon(Icons.map_outlined), selectedIcon: Icon(Icons.map), label: '路线'),
    NavigationDestination(icon: Icon(Icons.image_outlined), selectedIcon: Icon(Icons.image), label: '图片'),
    NavigationDestination(icon: Icon(Icons.smart_toy_outlined), selectedIcon: Icon(Icons.smart_toy), label: 'AI'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (i) => setState(() => _selectedIndex = i),
        destinations: _destinations,
        backgroundColor: HarbinColors.deepBlue,
        indicatorColor: HarbinColors.gold,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(color: HarbinColors.gold, fontWeight: FontWeight.bold, fontSize: 11);
          }
          return const TextStyle(color: HarbinColors.iceBlue, fontSize: 10);
        }),

      ),
    );
  }
}

// ─────────────────────────────────────────────
// 通用 AppBar
// ─────────────────────────────────────────────
AppBar harbinAppBar(String title) => AppBar(
  title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
  backgroundColor: HarbinColors.deepBlue,
  iconTheme: const IconThemeData(color: Colors.white),
  elevation: 0,
);

// ─────────────────────────────────────────────
// Page 1 · 家乡地区介绍
// ─────────────────────────────────────────────
class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HarbinColors.snowWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 260,
            pinned: true,
            backgroundColor: HarbinColors.deepBlue,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('哈尔滨 · 冰城', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [HarbinColors.deepBlue, Color(0xFF2E6DA4)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40),
                      Text('🏙️', style: TextStyle(fontSize: 70)),
                      Text('黑龙江省省会', style: TextStyle(color: HarbinColors.iceBlue, fontSize: 14)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle('城市概览'),
                  const SizedBox(height: 12),
                  _infoCard(
                    '哈尔滨，别称"冰城"，是黑龙江省省会，中国东北地区中心城市之一。'
                        '地处中国东北平原东北部，松花江南岸，全市面积约53,100平方公里，人口约1000万。'
                        '哈尔滨是中国纬度最高、气温最低的省会城市，冬季漫长寒冷，素有"天鹅项下的珍珠"之美誉。',
                  ),
                  const SizedBox(height: 20),
                  _sectionTitle('基本信息'),
                  const SizedBox(height: 12),
                  _infoGrid([
                    _InfoItem('🌍', '地区', '黑龙江省'),
                    _InfoItem('🌡️', '年均气温', '3.6°C'),
                    _InfoItem('👥', '人口', '约1000万'),
                    _InfoItem('🗓️', '建城时间', '1898年'),
                    _InfoItem('✈️', '机场', '太平国际机场'),
                    _InfoItem('🚄', '高铁', '哈尔滨站'),
                  ]),
                  const SizedBox(height: 20),
                  _sectionTitle('历史文化'),
                  const SizedBox(height: 12),
                  _infoCard(
                    '哈尔滨有着深厚的中西文化融合历史。19世纪末中东铁路的建设吸引了大批俄罗斯、欧洲移民，'
                        '留下了大量欧式建筑，形成了独特的"东方小巴黎"风格。'
                        '每年举办的国际冰雪节已成为全球知名的冬季盛典，吸引数百万国内外游客。',
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String t) => Text(t,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: HarbinColors.deepBlue));

  Widget _infoCard(String text) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 10, offset: const Offset(0,4))],
    ),
    child: Text(text, style: const TextStyle(fontSize: 15, height: 1.7, color: HarbinColors.darkText)),
  );

  Widget _infoGrid(List<_InfoItem> items) => GridView.count(
    crossAxisCount: 3,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    mainAxisSpacing: 12,
    crossAxisSpacing: 12,
    childAspectRatio: 1.1,
    children: items.map((item) => Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: HarbinColors.iceBlue),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(item.emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 4),
          Text(item.label, style: const TextStyle(fontSize: 11, color: HarbinColors.lightText)),
          Text(item.value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: HarbinColors.deepBlue)),
        ],
      ),
    )).toList(),
  );
}

class _InfoItem { final String emoji, label, value; const _InfoItem(this.emoji, this.label, this.value); }

// ─────────────────────────────────────────────
// Page 2 · 代表旅游景点
// ─────────────────────────────────────────────
class AttractionsPage extends StatelessWidget {
  const AttractionsPage({super.key});

  static const _spots = [
    _Spot('🕌', '圣索菲亚大教堂', '拜占庭式建筑，哈尔滨地标，始建于1907年，是中国最大的东正教堂。', '道里区透笼街88号', '★★★★★'),
    _Spot('❄️', '冰雪大世界', '每年12月开放的超大型冰雕公园，冰雪建筑规模居世界首位。', '松北区太阳岛西区', '★★★★★'),
    _Spot('🐯', '东北虎林园', '世界最大的东北虎人工繁育基地，可近距离观赏百余只东北虎。', '道外区松北路88号', '★★★★☆'),
    _Spot('🌊', '太阳岛风景区', '松花江北岸著名湿地公园，夏日花海，冬日雪博会主场。', '松北区太阳大道', '★★★★☆'),
    _Spot('🛍️', '中央大街', '亚洲最长的步行街，欧式建筑林立，美食、购物、咖啡馆一应俱全。', '道里区中央大街', '★★★★★'),
    _Spot('⛷️', '亚布力滑雪场', '中国最大的综合性滑雪场，距哈尔滨约200公里，是冬奥会训练基地。', '尚志市亚布力镇', '★★★★☆'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HarbinColors.snowWhite,
      appBar: harbinAppBar('代表旅游景点'),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _spots.length,
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemBuilder: (context, i) {
          final s = _spots[i];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 10, offset: const Offset(0,4))],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60, height: 60,
                    decoration: BoxDecoration(
                      color: HarbinColors.iceBlue.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(child: Text(s.emoji, style: const TextStyle(fontSize: 30))),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(s.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: HarbinColors.deepBlue)),
                            Text(s.rating, style: const TextStyle(fontSize: 12, color: HarbinColors.gold)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(s.desc, style: const TextStyle(fontSize: 13, color: HarbinColors.darkText, height: 1.5)),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 13, color: HarbinColors.lightText),
                            const SizedBox(width: 4),
                            Expanded(child: Text(s.address, style: const TextStyle(fontSize: 12, color: HarbinColors.lightText))),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Spot {
  final String emoji, name, desc, address, rating;
  const _Spot(this.emoji, this.name, this.desc, this.address, this.rating);
}

// ─────────────────────────────────────────────
// Page 3 · 代表美食
// ─────────────────────────────────────────────
class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  static const _foods = [
    _Food('🍡', '马迭尔冰棍', '哈尔滨百年老字号冰棍，奶香浓郁，中央大街必吃，已有近百年历史。', '甜/冷'),
    _Food('🥩', '哈尔滨红肠', '源自俄罗斯口味，熏烤工艺独特，蒜香浓郁，是最具代表性的哈尔滨特产。', '咸/烟熏'),
    _Food('🍺', '哈尔滨啤酒', '创立于1900年，中国最早的啤酒品牌之一，口感清爽，是东北饭桌必备。', '清爽'),
    _Food('🥟', '东北锅贴', '皮薄馅大，底部焦脆，汁水充盈，是哈尔滨街头最受欢迎的小吃之一。', '咸/香'),
    _Food('🐟', '松花江鱼', '松花江鲜鱼，炖制或烤制，鲜嫩肥美，是当地家庭聚餐首选。', '鲜/淡'),
    _Food('🥣', '格瓦斯', '俄式面包发酵饮料，酸甜适口，是哈尔滨特色饮品，夏季消暑佳品。', '酸甜'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HarbinColors.snowWhite,
      appBar: harbinAppBar('代表美食'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: _foods.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 14, crossAxisSpacing: 14, childAspectRatio: 0.85,
          ),
          itemBuilder: (context, i) {
            final f = _foods[i];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 10, offset: const Offset(0,4))],
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(f.emoji, style: const TextStyle(fontSize: 44)),
                    const SizedBox(height: 10),
                    Text(f.name, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: HarbinColors.deepBlue)),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: HarbinColors.gold.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(f.flavor, style: const TextStyle(fontSize: 11, color: HarbinColors.gold, fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(height: 8),
                    Text(f.desc, style: const TextStyle(fontSize: 12, color: HarbinColors.lightText, height: 1.5), textAlign: TextAlign.center),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Food { final String emoji, name, desc, flavor; const _Food(this.emoji, this.name, this.desc, this.flavor); }

// ─────────────────────────────────────────────
// Page 4 · 推荐旅行路线
// ─────────────────────────────────────────────
class TravelRoutePage extends StatefulWidget {
  const TravelRoutePage({super.key});
  @override State<TravelRoutePage> createState() => _TravelRoutePageState();
}

class _TravelRoutePageState extends State<TravelRoutePage> with SingleTickerProviderStateMixin {
  late TabController _tab;
  @override void initState() { super.initState(); _tab = TabController(length: 2, vsync: this); }
  @override void dispose() { _tab.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HarbinColors.snowWhite,
      appBar: AppBar(
        title: const Text('推荐旅行路线', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: HarbinColors.deepBlue,
        bottom: TabBar(
          controller: _tab,
          labelColor: HarbinColors.gold,
          unselectedLabelColor: HarbinColors.iceBlue,
          indicatorColor: HarbinColors.gold,
          tabs: const [Tab(text: '❄️ 冬季路线（3天）'), Tab(text: '🌸 夏季路线（2天）')],
        ),
      ),
      body: TabBarView(
        controller: _tab,
        children: [
          _buildRoute(_winterRoute),
          _buildRoute(_summerRoute),
        ],
      ),
    );
  }

  static const _winterRoute = [
    _RouteDay('第1天', '冰雪奇缘', [
      _RouteStop('09:00', '中央大街早餐', '品尝马迭尔冰棍、锅贴', Icons.breakfast_dining),
      _RouteStop('10:30', '圣索菲亚大教堂', '参观百年欧式建筑', Icons.church),
      _RouteStop('14:00', '冰雪大世界', '欣赏超大型冰雕艺术', Icons.ac_unit),
      _RouteStop('19:00', '防洪纪念塔夜景', '观赏松花江夜景', Icons.nightlight),
    ]),
    _RouteDay('第2天', '东北虎与太阳岛', [
      _RouteStop('09:00', '东北虎林园', '近距离观察东北虎', Icons.pets),
      _RouteStop('13:00', '太阳岛雪博会', '观赏大型雪雕展', Icons.landscape),
      _RouteStop('17:00', '哈尔滨啤酒博物馆', '了解百年啤酒文化', Icons.local_bar),
    ]),
    _RouteDay('第3天', '滑雪体验', [
      _RouteStop('08:00', '出发亚布力', '乘大巴约2小时', Icons.directions_bus),
      _RouteStop('11:00', '亚布力滑雪', '初学者/专业道自选', Icons.downhill_skiing),
      _RouteStop('17:00', '返回哈尔滨', '中央大街购物纪念品', Icons.shopping_bag),
    ]),
  ];

  static const _summerRoute = [
    _RouteDay('第1天', '城市文化游', [
      _RouteStop('09:00', '索菲亚教堂广场', '拍照打卡地标建筑', Icons.photo_camera),
      _RouteStop('11:00', '中央大街漫步', '欧式建筑、咖啡馆', Icons.directions_walk),
      _RouteStop('14:00', '太阳岛花海', '夏日花卉博览园', Icons.local_florist),
      _RouteStop('19:00', '松花江游船', '夕阳下游览母亲河', Icons.sailing),
    ]),
    _RouteDay('第2天', '自然与美食', [
      _RouteStop('09:00', '东北虎林园', '观虎、了解保护项目', Icons.pets),
      _RouteStop('13:00', '哈尔滨老道外', '中华巴洛克建筑群', Icons.location_city),
      _RouteStop('16:00', '红博城购物', '特产选购', Icons.shopping_cart),
      _RouteStop('18:30', '烤全羊晚宴', '地道东北烧烤', Icons.local_dining),
    ]),
  ];

  Widget _buildRoute(List<_RouteDay> days) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: days.length,
      itemBuilder: (context, i) {
        final day = days[i];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 12, top: i == 0 ? 0 : 16),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: HarbinColors.deepBlue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('${day.title} · ${day.theme}',
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            ...day.stops.asMap().entries.map((e) {
              final stop = e.value;
              final isLast = e.key == day.stops.length - 1;
              return IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 36, height: 36,
                          decoration: const BoxDecoration(color: HarbinColors.iceBlue, shape: BoxShape.circle),
                          child: Icon(stop.icon, size: 18, color: HarbinColors.deepBlue),
                        ),
                        if (!isLast) Expanded(child: Container(width: 2, color: HarbinColors.iceBlue)),
                      ],
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6)],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Text(stop.time, style: const TextStyle(color: HarbinColors.gold, fontWeight: FontWeight.bold, fontSize: 12)),
                              const SizedBox(width: 8),
                              Text(stop.name, style: const TextStyle(fontWeight: FontWeight.bold, color: HarbinColors.deepBlue)),
                            ]),
                            const SizedBox(height: 4),
                            Text(stop.desc, style: const TextStyle(fontSize: 12, color: HarbinColors.lightText)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        );
      },
    );
  }
}

class _RouteDay { final String title, theme; final List<_RouteStop> stops; const _RouteDay(this.title, this.theme, this.stops); }
class _RouteStop { final String time, name, desc; final IconData icon; const _RouteStop(this.time, this.name, this.desc, this.icon); }

// ─────────────────────────────────────────────
// Page 5 · 图片及页面设计
// ─────────────────────────────────────────────
class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  static const _items = [
    _GalleryItem('❄️', '冰雪大世界', '每年冬季限定，冰雕艺术震撼人心'),
    _GalleryItem('🕌', '索菲亚教堂', '百年欧式建筑，哈尔滨之魂'),
    _GalleryItem('🐯', '东北虎', '珍稀物种，东北之骄傲'),
    _GalleryItem('🌊', '松花江', '哈尔滨母亲河，四季各有风情'),
    _GalleryItem('🍡', '马迭尔冰棍', '零下30度也要排队的冰棍'),
    _GalleryItem('🛍️', '中央大街', '亚洲第一步行街，百年历史长街'),
    _GalleryItem('⛷️', '亚布力雪场', '中国最大综合性滑雪场'),
    _GalleryItem('🏮', '哈尔滨夜景', '冰灯点亮的璀璨冬夜'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HarbinColors.snowWhite,
      appBar: harbinAppBar('图片及页面设计'),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: _items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 1.0,
          ),
          itemBuilder: (context, i) {
            final item = _items[i];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [
                    HarbinColors.deepBlue.withOpacity(0.85),
                    HarbinColors.deepBlue.withOpacity(0.6),
                  ],
                  begin: Alignment.topLeft, end: Alignment.bottomRight,
                ),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0,4))],
              ),
              child: Stack(
                children: [
                  // 背景装饰
                  Positioned(top: -10, right: -10,
                      child: Text('❄', style: TextStyle(fontSize: 60, color: Colors.white.withOpacity(0.08)))),
                  Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.emoji, style: const TextStyle(fontSize: 40)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                            const SizedBox(height: 4),
                            Text(item.desc, style: TextStyle(color: Colors.white.withOpacity(0.75), fontSize: 11, height: 1.4)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _GalleryItem { final String emoji, title, desc; const _GalleryItem(this.emoji, this.title, this.desc); }

// ─────────────────────────────────────────────
// Page 6 · AI 功能（模拟旅行问答）
// ─────────────────────────────────────────────
class AIPage extends StatefulWidget {
  const AIPage({super.key});
  @override State<AIPage> createState() => _AIPageState();
}

class _AIPageState extends State<AIPage> {
  final TextEditingController _ctrl = TextEditingController();
  final ScrollController _scroll = ScrollController();
  final List<_ChatMsg> _msgs = [
    const _ChatMsg(false, '你好！我是哈尔滨AI旅行助手 🤖❄️\n\n我可以回答关于哈尔滨的一切问题，例如：\n• 冬天去哈尔滨需要带什么？\n• 有哪些必吃的美食？\n• 冰雪大世界几月份开放？\n\n请问有什么可以帮您？'),
  ];
  bool _loading = false;

  static const Map<String, String> _faq = {
    '冰棍': '马迭尔冰棍是哈尔滨最著名的冰棍！🍡 创立于1906年，奶香浓郁，中央大街上可以购买，即使在零下几十度也有人排队购买，已成为哈尔滨标志性美食。',
    '红肠': '哈尔滨红肠是最具代表性的特产之一！🥩 源自俄罗斯配方，采用猪肉加蒜及天然香料，经过传统熏烤工艺制作，蒜香浓郁，是馈赠亲友的首选伴手礼。',
    '冰雪大世界': '冰雪大世界通常在每年12月底开放，持续到次年2月底或3月初。❄️ 建议选择晴天白天入场，晚上灯光亮起时更美。门票约300元，建议提前网上购买。',
    '最佳时间': '哈尔滨一年四季各有特色：\n❄️ 冬季（12月-2月）：冰雪节、冰灯，最具特色\n🌸 春季（4月-5月）：踏青赏花\n☀️ 夏季（6月-8月）：避暑胜地，气候凉爽\n🍂 秋季（9月-10月）：层林尽染，风景如画',
    '穿衣': '冬季去哈尔滨必备装备：\n🧥 羽绒服（最好-30°C规格）\n🧤 防风手套\n🧣 厚围巾\n👢 防滑雪地靴\n🎿 护耳帽\n\n室内暖气很充足，建议洋葱式穿法，方便进出室内外随时增减。',
    '交通': '哈尔滨交通便捷：\n✈️ 太平国际机场：国内外航班通达\n🚄 高铁：北京约5小时，沈阳约2小时\n🚇 地铁：目前2条线路，覆盖主要景点\n🚌 公交：线路丰富，性价比高',
    '住宿': '推荐住宿区域：\n🏨 道里区中央大街附近：交通最便利\n🏨 松北区太阳岛旁：靠近冰雪大世界\n💰 价格参考：经济型200-400元/晚，品牌酒店500-1000元/晚\n\n旺季（冰雪节期间）价格会上涨2-3倍，建议提前预订。',
  };

  void _send() async {
    final text = _ctrl.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _msgs.add(_ChatMsg(true, text));
      _loading = true;
      _ctrl.clear();
    });
    _scrollDown();

    await Future.delayed(const Duration(milliseconds: 800));

    String reply = '感谢您的提问！关于"$text"，哈尔滨确实是一个非常值得一游的城市。🏙️\n\n建议您可以从以下几点入手：\n• 提前了解当地天气情况\n• 规划好行程路线\n• 预订知名景点门票\n\n如果您有更具体的问题，欢迎继续询问！';

    for (final key in _faq.keys) {
      if (text.contains(key)) { reply = _faq[key]!; break; }
    }

    setState(() { _msgs.add(_ChatMsg(false, reply)); _loading = false; });
    _scrollDown();
  }

  void _scrollDown() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scroll.hasClients) _scroll.animateTo(_scroll.position.maxScrollExtent, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HarbinColors.snowWhite,
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.smart_toy, color: HarbinColors.gold),
            SizedBox(width: 8),
            Text('AI 旅行助手', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
        backgroundColor: HarbinColors.deepBlue,
      ),
      body: Column(
        children: [
          // 快捷问题
          Container(
            height: 44,
            color: Colors.white,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              children: ['最佳时间', '穿衣', '交通', '冰雪大世界', '红肠', '住宿'].map((q) =>
                  GestureDetector(
                    onTap: () { _ctrl.text = q; _send(); },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: HarbinColors.iceBlue.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: HarbinColors.iceBlue),
                      ),
                      child: Text(q, style: const TextStyle(fontSize: 12, color: HarbinColors.deepBlue)),
                    ),
                  ),
              ).toList(),
            ),
          ),
          // 聊天记录
          Expanded(
            child: ListView.builder(
              controller: _scroll,
              padding: const EdgeInsets.all(16),
              itemCount: _msgs.length + (_loading ? 1 : 0),
              itemBuilder: (context, i) {
                if (_loading && i == _msgs.length) {
                  return const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 12),
                      child: _TypingIndicator(),
                    ),
                  );
                }
                final msg = _msgs[i];
                return Align(
                  alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                    decoration: BoxDecoration(
                      color: msg.isUser ? HarbinColors.deepBlue : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 6)],
                    ),
                    child: Text(msg.text,
                        style: TextStyle(
                          color: msg.isUser ? Colors.white : HarbinColors.darkText,
                          fontSize: 14, height: 1.6,
                        )),
                  ),
                );
              },
            ),
          ),
          // 输入框
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _ctrl,
                    decoration: InputDecoration(
                      hintText: '问我关于哈尔滨的任何问题...',
                      hintStyle: const TextStyle(color: HarbinColors.lightText, fontSize: 13),
                      filled: true,
                      fillColor: HarbinColors.snowWhite,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    ),
                    onSubmitted: (_) => _send(),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _send,
                  child: Container(
                    width: 44, height: 44,
                    decoration: const BoxDecoration(color: HarbinColors.deepBlue, shape: BoxShape.circle),
                    child: const Icon(Icons.send, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatMsg { final bool isUser; final String text; const _ChatMsg(this.isUser, this.text); }

class _TypingIndicator extends StatelessWidget {
  const _TypingIndicator();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('AI 正在思考', style: TextStyle(color: HarbinColors.lightText, fontSize: 13)),
          SizedBox(width: 6),
          SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: HarbinColors.deepBlue)),
        ],
      ),
    );
  }
}