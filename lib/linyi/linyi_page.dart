// ╔══════════════════════════════════════════════════════════════╗
// ║   临沂旅行推荐应用 — 临沂页面                                      ║
// ║   임기 여행 추천 앱 — 임기 페이지                                   ║
// ╠══════════════════════════════════════════════════════════════╣
// ║  文件说明 / 파일 설명                                              ║
// ║  本文件是临沂家乡旅行推荐页面的完整代码。                              ║
// ║  이 파일은 임기 고향 여행 추천 페이지의 전체 코드입니다.                 ║
// ╠══════════════════════════════════════════════════════════════╣
// ║  页面结构 / 페이지 구조                                             ║
// ║  ① 家乡介绍页  고향 소개 페이지  — 城市概况、基本信息、AI使用内容        ║
// ║  ② 旅游景点页  관광지 페이지     — 4个景点卡片列表                    ║
// ║  ③ 代表美食页  대표 음식 페이지  — 4种美食卡片列表                    ║
// ║  ④ 推荐路线页  추천 코스 페이지  — 6节点当日游时间轴                  ║
// ╠══════════════════════════════════════════════════════════════╣
// ║  代码结构 / 코드 구조                                              ║
// ║  AppColors        — 全局颜色常量 / 전역 색상 상수                   ║
// ║  Attraction/Food/TourStep — 数据模型 / 데이터 모델               ║
// ║  attractions/foods/tourSteps — 静态数据 / 정적 데이터             ║
// ║  LinyiPage        — 根组件，管理底部导航 / 루트 위젯, 탭 관리         ║
// ║  _IntroPage       — 家乡介绍页 / 고향 소개 페이지                  ║
// ║  _AttractionsPage — 景点列表页 / 관광지 목록 페이지                 ║
// ║  _FoodsPage       — 美食列表页 / 음식 목록 페이지                  ║
// ║  _TourRoutePage   — 推荐路线页 / 추천 코스 페이지                  ║
// ║  _SectionTitle/_InfoCard/_Tag 等 — 公共UI组件 / 공통 UI 위젯    ║
// ╠══════════════════════════════════════════════════════════════╣
// ║  使用方法 / 사용 방법                                              ║
// ║  在 main.dart 中 import 本文件，然后使用 LinyiPage() 即可          ║
// ║  main.dart에서 이 파일을 import하고 LinyiPage()를 사용하면 됩니다   ║
// ║                                                              ║
// ║    import '1.dart';                                          ║
// ║    home: const LinyiPage(),                                  ║
// ╚══════════════════════════════════════════════════════════════╝

// 临沂旅行推荐应用 — 临沂页面
// 임기 여행 추천 앱 — 임기 페이지
// lib/linyi/linyi_page.dart

import 'package:flutter/material.dart';

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 全局主题色 / 전역 테마 색상
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

// ──────────────────────────────────────────
// 全局颜色常量类 / 전역 색상 상수 클래스
// 作用：统一管理应用中所有颜色，修改颜色只需改这里
// 역할：앱의 모든 색상을 통합 관리, 색상 변경 시 여기만 수정
// ──────────────────────────────────────────
class AppColors {
  // 主色调：取自蒙山绿色，代表临沂的山水特色
  // 기본 색상: 몽산 녹색에서 가져옴, 임기의 산수 특색을 표현
  static const Color primary   = Color(0xFF2E7D32);

  // 强调色：暖橙色，用于时间轴时间、数字高亮等
  // 강조 색상: 따뜻한 오렌지색, 타임라인 시간·숫자 하이라이트 등에 사용
  static const Color accent    = Color(0xFFF57F17);

  // 页面背景色：浅灰色，比纯白更柔和
  // 페이지 배경색: 연한 회색, 순백보다 부드러운 느낌
  static const Color bg        = Color(0xFFF5F5F5);

  // 卡片背景色：纯白，与背景形成层次感
  // 카드 배경색: 순백, 배경과 레이어 구분을 위해 사용
  static const Color card      = Colors.white;

  // 主要文字色：深灰近黑，用于标题、名称等重要文字
  // 주요 텍스트 색상: 짙은 회색(거의 검정), 제목·이름 등 중요 텍스트에 사용
  static const Color textMain  = Color(0xFF212121);

  // 次要文字色：中灰，用于描述、说明等辅助文字
  // 보조 텍스트 색상: 중간 회색, 설명·부가 정보 등 보조 텍스트에 사용
  static const Color textSub   = Color(0xFF757575);

  // 提示文字色：浅灰，用于韩文副标题、评分等次要信息
  // 힌트 텍스트 색상: 연한 회색, 한국어 부제목·평점 등 부가 정보에 사용
  static const Color textHint  = Color(0xFFBDBDBD);

  // 边框色：极浅灰，用于卡片边框、分隔线
  // 테두리 색상: 매우 연한 회색, 카드 테두리·구분선에 사용
  static const Color border    = Color(0xFFE0E0E0);

  // 封面渐变色（起点/终点）：用于顶部Hero图片的绿色渐变遮罩
  // 커버 그라디언트 색상 (시작/끝): 상단 Hero 이미지의 녹색 그라디언트 오버레이에 사용
  static const Color heroStart = Color(0xFF1B5E20);
  static const Color heroEnd   = Color(0xFF66BB6A);
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 数据模型 / 데이터 모델
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

// 景点模型 / 관광지 모델
class Attraction {
  final String name;        // 中文名 / 중국어 이름
  final String nameKo;      // 韩文名 / 한국어 이름
  final String desc;        // 中文描述 / 중국어 설명
  final String descKo;      // 韩文描述 / 한국어 설명
  final String emoji;       // 图标 / 아이콘
  final String? imageAsset; // 图片路径 / 이미지 경로
  final double rating;      // 评分 / 평점

  const Attraction({
    required this.name, required this.nameKo,
    required this.desc, required this.descKo,
    required this.emoji, required this.rating,
    this.imageAsset,
  });
}

// 美食模型 / 음식 모델
class Food {
  final String name;        // 中文名 / 중국어 이름
  final String nameKo;      // 韩文名 / 한국어 이름
  final String desc;        // 中文描述 / 중국어 설명
  final String descKo;      // 韩文描述 / 한국어 설명
  final String emoji;       // 图标 / 아이콘
  final String? imageAsset; // 图片路径 / 이미지 경로
  final double rating;      // 评分 / 평점

  const Food({
    required this.name, required this.nameKo,
    required this.desc, required this.descKo,
    required this.emoji, required this.rating,
    this.imageAsset,
  });
}

// 旅行路线步骤模型 / 여행 코스 단계 모델
class TourStep {
  final String time;        // 时间 / 시간
  final String place;       // 地点中文名 / 장소 중국어 이름
  final String placeKo;     // 地点韩文名 / 장소 한국어 이름
  final String activity;    // 活动中文描述 / 활동 중국어 설명
  final String activityKo;  // 活动韩文描述 / 활동 한국어 설명

  const TourStep({
    required this.time,
    required this.place, required this.placeKo,
    required this.activity, required this.activityKo,
  });
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 静态数据 / 정적 데이터
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

// 代表景点列表 / 대표 관광지 목록
const List<Attraction> attractions = [
  Attraction(
    name: '蒙山风景区', nameKo: '몽산 풍경구',
    desc: '山东第二高峰，素有"岱宗之亚"美称，自然风光绝美',
    descKo: '산동성 두 번째 높은 봉우리, 아름다운 자연경관으로 유명',
    emoji: '⛰️', rating: 4.8,
    imageAsset: 'assets/images/linyi/mengshan.jpg',
  ),
  Attraction(
    name: '沂蒙红嫂纪念馆', nameKo: '이몽 홍소 기념관',
    desc: '革命历史教育基地，展示沂蒙红嫂的感人故事',
    descKo: '혁명 역사 교육 기지, 이몽 홍소의 감동적인 이야기를 전시',
    emoji: '🏛️', rating: 4.7,
    imageAsset: 'assets/images/linyi/hosao.jpg', // 红嫂博物馆图片 / 홍소 박물관 사진
  ),
  Attraction(
    name: '临沂竹泉村', nameKo: '임기 죽천촌',
    desc: '明代古村落，竹林泉水相依，被誉为"中国最美乡村"之一',
    descKo: '명나라 시대 고대 마을, 대나무 숲과 샘물이 어우러진 아름다운 마을',
    emoji: '🎋', rating: 4.6,
    imageAsset: 'assets/images/linyi/zhuquan.jpg',
  ),
  Attraction(
    name: '王羲之故居', nameKo: '왕희지 고거',
    desc: '书圣王羲之的出生地，展示书法艺术与历史文化',
    descKo: '서예의 성인 왕희지의 출생지, 서예 예술과 역사문화 전시',
    emoji: '✍️', rating: 4.5,
    imageAsset: 'assets/images/linyi/wangxizhi.jpg',
  ),
];

// 代表美食列表 / 대표 음식 목록
const List<Food> foods = [
  Food(
    name: '糁汤', nameKo: '산탕',
    desc: '临沂传统早餐，以骨头汤为底，加入面粉制成，浓郁香醇',
    descKo: '임기 전통 아침 식사, 사골 육수에 밀가루를 넣어 만든 진한 수프',
    emoji: '🍲', rating: 4.9,
    imageAsset: 'assets/images/linyi/santangsantang.jpg',
  ),
  Food(
    name: '炒鸡', nameKo: '임기 볶음 닭',
    desc: '临沂特色菜，用农家土鸡爆炒，香辣鲜嫩，名扬全国',
    descKo: '임기의 명물 요리, 농가 토종닭을 센 불에 볶은 매콤하고 부드러운 닭 요리',
    emoji: '🍗', rating: 4.8,
    imageAsset: 'assets/images/linyi/chaoji.jpg',
  ),
  Food(
    name: '煎饼', nameKo: '전병',
    desc: '沂蒙山区传统主食，以玉米或小麦为原料，薄脆香甜',
    descKo: '이몽산 지역 전통 주식, 옥수수나 밀로 만든 얇고 바삭한 전통 전병',
    emoji: '🫓', rating: 4.6,
    imageAsset: 'assets/images/linyi/jianbing.jpg',
  ),
  Food(
    name: '八宝豆豉', nameKo: '팔보두시',
    desc: '临沂特产，以多种豆类及香料精制而成，味道鲜美独特',
    descKo: '임기 특산품, 여러 콩류와 향신료로 정성껏 만든 독특한 맛의 발효 음식',
    emoji: '🫘', rating: 4.5,
    imageAsset: 'assets/images/linyi/douchi.jpg',
  ),
];

// 推荐路线步骤（1日游）/ 추천 코스 단계 (당일치기)
const List<TourStep> tourSteps = [
  TourStep(time: '08:00', place: '糁汤老店', placeKo: '산탕 노포',
    activity: '品尝正宗临沂糁汤，开启美食之旅',
    activityKo: '정통 임기 산탕으로 미식 여행 시작'),
  TourStep(time: '09:30', place: '王羲之故居', placeKo: '왕희지 고거',
    activity: '参观书圣故居，感受书法文化魅力',
    activityKo: '서성 고거 관람, 서예 문화의 매력 체험'),
  TourStep(time: '12:00', place: '临沂老街', placeKo: '임기 구시가지',
    activity: '午餐品尝炒鸡，逛特色小吃街',
    activityKo: '볶음 닭으로 점심 식사, 특색 먹거리 거리 구경'),
  TourStep(time: '14:00', place: '竹泉村', placeKo: '죽천촌',
    activity: '漫步古村落，体验竹林泉水之美',
    activityKo: '고대 마을 산책, 대나무 숲과 샘물의 아름다움 체험'),
  TourStep(time: '17:00', place: '蒙山风景区', placeKo: '몽산 풍경구',
    activity: '登山赏景，欣赏日落美景',
    activityKo: '등산 및 경치 감상, 일몰 풍경 감상'),
  TourStep(time: '19:00', place: '临沂夜市', placeKo: '임기 야시장',
    activity: '夜市品尝煎饼和各类小吃',
    activityKo: '야시장에서 전병과 각종 간식 맛보기'),
];

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 根组件（带底部导航）/ 루트 위젯 (하단 탭 네비게이션 포함)
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
//
// 这是整个临沂页面的"总指挥"组件。
// 이것은 임기 페이지 전체의 "총괄" 위젯입니다.
//
// 职责 / 역할:
//   1. 管理底部导航栏的选中状态（用 _currentIndex 记录当前Tab）
//      하단 탭바의 선택 상태 관리 (_currentIndex로 현재 탭 기록)
//   2. 根据 _currentIndex 切换显示不同的子页面
//      _currentIndex에 따라 다른 서브 페이지로 전환
//   3. StatefulWidget：有状态组件，因为需要记住"当前选中哪个Tab"
//      StatefulWidget: 상태 있는 위젯, "현재 어느 탭이 선택됐는지" 기억 필요
//
// 结构图 / 구조도:
//   LinyiPage
//   ├── BottomNavigationBar（底部导航 / 하단 탭바）
//   └── body: _pages[_currentIndex]（当前页面 / 현재 페이지）
//       ├── [0] _IntroPage       家乡介绍 / 고향 소개
//       ├── [1] _AttractionsPage 旅游景点 / 관광지
//       ├── [2] _FoodsPage       代表美食 / 대표 음식
//       └── [3] _TourRoutePage   推荐路线 / 추천 코스

class LinyiPage extends StatefulWidget {
  const LinyiPage({super.key});

  @override
  State<LinyiPage> createState() => _LinyiPageState();
}

class _LinyiPageState extends State<LinyiPage> {
  // 当前选中的底部导航索引 / 현재 선택된 하단 탭 인덱스
  int _currentIndex = 0;

  // 四个页面列表 / 4개 페이지 목록
  final List<Widget> _pages = const [
    _IntroPage(),       // 家乡介绍 / 고향 소개
    _AttractionsPage(), // 旅游景点 / 관광지
    _FoodsPage(),       // 代表美食 / 대표 음식
    _TourRoutePage(),   // 推荐路线 / 추천 코스
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      // 底部导航栏 / 하단 탭 네비게이션 바
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i), // 切换页面 / 페이지 전환
        type: BottomNavigationBarType.fixed,              // 固定宽度标签 / 고정 너비 탭
        selectedItemColor: AppColors.primary,             // 选中颜色：蒙山绿 / 선택 색상: 몽산 녹색
        unselectedItemColor: AppColors.textSub,           // 未选中颜色 / 미선택 색상
        backgroundColor: Colors.white,
        elevation: 8,                                     // 阴影高度 / 그림자 높이
        // 底部导航项（中韩双语）/ 하단 탭 항목 (중한 이중언어)
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: '家乡介绍 · 고향 소개',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.landscape_outlined),
            activeIcon: Icon(Icons.landscape),
            label: '旅游景点 · 관광지',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_outlined),
            activeIcon: Icon(Icons.restaurant),
            label: '代表美食 · 대표 음식',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            activeIcon: Icon(Icons.map),
            label: '推荐路线 · 추천 코스',
          ),
        ],
      ),
      // 当前页面内容 / 현재 페이지 내용
      body: _pages[_currentIndex],
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 页面一：家乡介绍 / 페이지1: 고향 소개
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
//
// 内容区块（从上到下）/ 내용 섹션 (위에서 아래로):
//   ① SliverAppBar   — 顶部封面大图（蒙山照片+渐变遮罩+标语）
//                      상단 커버 이미지 (몽산 사진+그라디언트+슬로건)
//   ② 城市介绍        — 临沂文字简介（中韩双语）/ 도시 소개 텍스트 (중한)
//   ③ 文化特色        — 4个绿色标签（革命/书法/民俗/山水）
//                      4개 녹색 태그 (혁명/서예/민속/산수)
//   ④ 基本信息        — 彩色大数字卡（人口/面积/建城史/GDP）
//                      컬러 큰 숫자 카드 (인구/면적/역사/GDP)
//   ⑤ 城市名片        — 横向滚动荣誉标签 / 가로 스크롤 명예 태그
//   ⑥ 发展实力        — 3列彩色卡片（物流/交通/商贸）
//                      3열 컬러 카드 (물류/교통/상업)
//   ⑦ 人文底蕴        — 带图标列表（名人/革命/生态/矿产）
//                      아이콘 목록 (명인/혁명/생태/광물)
//   ⑧ AI使用内容      — 绿色渐变卡片，说明AI辅助内容
//                      녹색 그라디언트 카드, AI 활용 내용 설명
//
// 使用 CustomScrollView + SliverAppBar 实现滚动时标题栏固定效果
// CustomScrollView + SliverAppBar로 스크롤 시 타이틀바 고정 효과 구현

class _IntroPage extends StatelessWidget {
  const _IntroPage();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // 顶部封面 / 상단 커버
        SliverAppBar(
          expandedHeight: 200,
          pinned: true,
          backgroundColor: AppColors.primary,
          flexibleSpace: FlexibleSpaceBar(
            // 标题（中韩双语）/ 제목 (중한 이중언어)
            title: const Text('临沂 · 임기',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            background: Stack(
              fit: StackFit.expand,
              children: [
                // 封面图片 / 커버 이미지
                Image.asset('assets/images/linyi/mengshan.jpg', fit: BoxFit.cover),
                // 渐变遮罩 / 그라디언트 오버레이
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter, end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Color(0xCC1B5E20)],
                    ),
                  ),
                ),
                // 封面标语（中韩双语）/ 커버 슬로건
                const Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 20),
                      Text('沂蒙山水 · 革命圣地',
                          style: TextStyle(color: Colors.white, fontSize: 15,
                              fontWeight: FontWeight.bold, letterSpacing: 2,
                              shadows: [Shadow(blurRadius: 8, color: Colors.black54)])),
                      SizedBox(height: 4),
                      Text('이몽 산수 · 혁명 성지',
                          style: TextStyle(color: Colors.white70, fontSize: 12,
                              shadows: [Shadow(blurRadius: 6, color: Colors.black45)])),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 城市介绍区块 / 도시 소개 섹션
                _SectionTitle(zh: '城市介绍', ko: '도시 소개'),
                const SizedBox(height: 8),
                _InfoCard(
                  child: const Text(
                    '临沂市位于山东省东南部，是沂蒙山区的中心城市，也是著名的革命老区。'
                    '这里山清水秀，人杰地灵，孕育了王羲之、诸葛亮等历史名人。\n\n'
                    '임기시는 산동성 동남부에 위치하며 이몽산 지역의 중심 도시이자 유명한 혁명 노구입니다. '
                    '아름다운 산수와 뛰어난 인재를 배출한 곳으로 왕희지, 제갈량 등 역사적 명인의 고향입니다.',
                    style: TextStyle(fontSize: 13, height: 1.7, color: AppColors.textSub),
                  ),
                ),

                const SizedBox(height: 16),

                // 文化特色标签 / 문화 특색 태그
                _SectionTitle(zh: '文化特色', ko: '문화 특색'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8, runSpacing: 8,
                  children: const [
                    _Tag(zh: '革命文化', ko: '혁명 문화'),
                    _Tag(zh: '书法文化', ko: '서예 문화'),
                    _Tag(zh: '沂蒙民俗', ko: '이몽 민속'),
                    _Tag(zh: '山水文化', ko: '산수 문화'),
                  ],
                ),

                const SizedBox(height: 16),

                // ── 数据亮点：4格彩色数字卡 / 데이터 하이라이트: 4칸 컬러 숫자 카드
                _SectionTitle(zh: '基本信息', ko: '기본 정보'),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _BigStatCard(value: '1200万', labelZh: '户籍人口', labelKo: '등록 인구',
                        icon: '👥', color: const Color(0xFF1976D2)),
                    const SizedBox(width: 10),
                    _BigStatCard(value: '1.72万', labelZh: '面积 km²', labelKo: '면적 km²',
                        icon: '🗺️', color: const Color(0xFF388E3C)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _BigStatCard(value: '3000+', labelZh: '建城史 (年)', labelKo: '역사 (년)',
                        icon: '🏯', color: const Color(0xFFF57F17)),
                    const SizedBox(width: 10),
                    _BigStatCard(value: '6862亿', labelZh: 'GDP (2025)', labelKo: 'GDP (2025)',
                        icon: '📈', color: const Color(0xFF7B1FA2)),
                  ],
                ),

                const SizedBox(height: 20),

                // ── 城市名片：横向滚动荣誉标签 / 도시 명함: 가로 스크롤 명예 태그
                _SectionTitle(zh: '城市名片', ko: '도시 명함'),
                const SizedBox(height: 10),
                SizedBox(
                  height: 90,  // 增加高度容纳中韩双语 / 높이 늘려 이중언어 수용
                  child: ListView(
                    scrollDirection: Axis.horizontal, // 横向滚动 / 가로 스크롤
                    children: const [
                      _HonorChip(icon: '🏆', zh: '中国物流之都',   ko: '중국 물류 수도'),
                      _HonorChip(icon: '🖊️', zh: '中国书法名城',   ko: '중국 서예 명성'),
                      _HonorChip(icon: '🏪', zh: '中国市场名城',   ko: '중국 시장 명성'),
                      _HonorChip(icon: '🌳', zh: '国家园林城市',   ko: '국가 원림 도시'),
                      _HonorChip(icon: '⭐', zh: '全国文明城市',   ko: '전국 문명 도시'),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // ── 发展实力：三项横向指标条 / 발전 역량: 3개 가로 지표 바
                _SectionTitle(zh: '发展实力', ko: '발전 역량'),
                const SizedBox(height: 10),
                _StrengthCard(
                  items: const [
                    _StrengthItem(icon: '🚚', zh: '物流之都', ko: '물류 수도',
                        detail: '物流额突破1万亿元\n"南有义乌，北有临沂"',
                        detailKo: '물류액 1조(万亿) 위안 돌파\n"남엔 이우, 북엔 임기"'),
                    _StrengthItem(icon: '✈️', zh: '交通枢纽', ko: '교통 허브',
                        detail: '鲁南高铁·6条高速\n启阳国际机场',
                        detailKo: '루난 고속철·고속도로 6개\n치양 국제공항'),
                    _StrengthItem(icon: '📦', zh: '商贸中心', ko: '상업 중심',
                        detail: '配载线路覆盖全国\n所有县级以上城市',
                        detailKo: '전국 모든 현급 이상\n도시에 노선 연결'),
                  ],
                ),

                const SizedBox(height: 20),

                // ── 人文底蕴：时间轴风格 / 인문 역사: 타임라인 스타일
                _SectionTitle(zh: '人文底蕴', ko: '인문 역사'),
                const SizedBox(height: 10),
                _CultureCard(
                  items: const [
                    _CultureItem(icon: '🖋️', zh: '历史名人', ko: '역사 명인',
                        content: '王羲之(书圣) · 诸葛亮(智圣)\n曾子(宗圣) · 颜真卿 · 刘洪',
                        contentKo: '왕희지(서성) · 제갈량(지성)\n증자(종성) · 안진경 · 유홍'),
                    _CultureItem(icon: '🌟', zh: '革命圣地', ko: '혁명 성지',
                        content: '沂蒙精神发源地\n党和国家的宝贵精神财富',
                        contentKo: '이몽 정신 발원지\n당과 국가의 소중한 정신적 재산'),
                    _CultureItem(icon: '💧', zh: '生态水城', ko: '생태 수도시',
                        content: '八水绕城 "不是江南，胜似江南"\n橡胶坝1247m · 吉尼斯世界纪录',
                        contentKo: '여덟 강이 도시를 둘러싸\n고무댐 1247m 기네스 기록'),
                    _CultureItem(icon: '💎', zh: '矿产资源', ko: '광물 자원',
                        content: '白云岩储量全国第一\n金刚石储量全国第二',
                        contentKo: '백운암 매장량 전국 1위\n다이아몬드 매장량 전국 2위'),
                  ],
                ),

                const SizedBox(height: 20),

                // ── AI使用内容 / AI 활용 내용 ─────────────
                _SectionTitle(zh: 'AI 使用内容', ko: 'AI 활용 내용'),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    // 渐变背景 / 그라디언트 배경
                    gradient: const LinearGradient(
                      colors: [Color(0xFFE8F5E9), Color(0xFFF1F8E9)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFA5D6A7)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 标题行 / 제목 행
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text('🤖', style: TextStyle(fontSize: 16)),
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('AI 使用内容',
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,
                                      color: AppColors.primary)),
                              Text('AI 활용 내용',
                                  style: TextStyle(fontSize: 11, color: Color(0xFF66BB6A))),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Divider(color: Color(0xFFA5D6A7), height: 1),
                      const SizedBox(height: 12),
                      // AI使用项列表（中韩双语）/ AI 활용 항목 목록 (중한 이중언어)
                      _AiItem(zh: '景点介绍文案润色与翻译（中↔韩）', ko: '관광지 소개 문구 다듬기 및 번역 (중↔한)'),
                      _AiItem(zh: '美食描述内容生成',                 ko: '음식 설명 내용 생성'),
                      _AiItem(zh: '城市基本信息整理与双语翻译',       ko: '도시 기본 정보 정리 및 이중언어 번역'),
                      _AiItem(zh: '推荐旅行路线规划建议',             ko: '추천 여행 코스 기획 제안'),
                      _AiItem(zh: 'Flutter 代码结构设计与优化',       ko: 'Flutter 코드 구조 설계 및 최적화'),
                    ],
                  ),
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 页面二：旅游景点 / 페이지2: 관광지
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
//
// 显示 attractions 列表中的4个景点，每个景点用 _AttractionCard 渲染
// attractions 목록의 4개 관광지를 표시, 각각 _AttractionCard로 렌더링
//
// 景点列表（4个）/ 관광지 목록 (4개):
//   1. 蒙山风景区    — 图片：mengshan.jpg
//   2. 沂蒙红嫂纪念馆 — 图片：hosao.jpg
//   3. 临沂竹泉村    — 图片：zhuquan.jpg
//   4. 王羲之故居    — 图片：wangxizhi.jpg

class _AttractionsPage extends StatelessWidget {
  const _AttractionsPage();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // 页面标题AppBar / 페이지 제목 앱바
        SliverAppBar(
          pinned: true,
          backgroundColor: AppColors.primary,
          title: const Text('旅游景点 · 관광지',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _AttractionCard(attraction: attractions[i]),
              ),
              childCount: attractions.length,
            ),
          ),
        ),
      ],
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 页面三：代表美食 / 페이지3: 대표 음식
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
//
// 显示 foods 列表中的4种美食，每种用 _FoodCard 渲染
// foods 목록의 4가지 음식을 표시, 각각 _FoodCard로 렌더링
//
// 美食列表（4种）/ 음식 목록 (4가지):
//   1. 糁汤   산탕     — 图片：santangsantang.jpg
//   2. 炒鸡   볶음닭   — 图片：chaoji.jpg
//   3. 煎饼   전병     — 图片：jianbing.jpg
//   4. 八宝豆豉 팔보두시 — 图片：douchi.jpg

class _FoodsPage extends StatelessWidget {
  const _FoodsPage();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: AppColors.primary,
          title: const Text('代表美食 · 대표 음식',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _FoodCard(food: foods[i]),
              ),
              childCount: foods.length,
            ),
          ),
        ),
      ],
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 页面四：推荐路线 / 페이지4: 추천 코스
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
//
// 以时间轴（Timeline）形式展示6个行程节点
// 타임라인 형식으로 6개 일정 노드를 표시
//
// 时间轴原理 / 타임라인 원리:
//   每个节点 = 时间(橙色) + 绿色圆点 + 连接线 + 地点+活动(双语)
//   각 노드 = 시간(오렌지) + 녹색 점 + 연결선 + 장소+활동(이중언어)
//   最后一个节点不显示连接线（isLast: true）
//   마지막 노드에는 연결선 없음 (isLast: true)
//
// 行程安排（6节点）/ 일정 (6노드):
//   08:00 糁汤老店 → 09:30 王羲之故居 → 12:00 临沂老街
//   14:00 竹泉村  → 17:00 蒙山风景区  → 19:00 临沂夜市

class _TourRoutePage extends StatelessWidget {
  const _TourRoutePage();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: AppColors.primary,
          title: const Text('推荐路线（1日游）· 추천 코스 (당일치기)',
              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.card,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06),
                    blurRadius: 12, offset: const Offset(0, 4))],
              ),
              padding: const EdgeInsets.all(16),
              // 时间轴列表 / 타임라인 목록
              child: Column(
                children: List.generate(tourSteps.length, (i) =>
                  _TourStepTile(step: tourSteps[i], isLast: i == tourSteps.length - 1),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 通用小组件 / 공통 소형 위젯
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

// 区块标题（中韩双语）/ 섹션 제목 (중한 이중언어)
class _SectionTitle extends StatelessWidget {
  final String zh; // 中文标题 / 중국어 제목
  final String ko; // 韩文标题 / 한국어 제목
  const _SectionTitle({required this.zh, required this.ko});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(zh, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textMain)),
        const SizedBox(width: 6),
        Text('· $ko', style: const TextStyle(fontSize: 11, color: AppColors.primary)),
      ],
    );
  }
}

// 通用信息卡片 / 공통 정보 카드
class _InfoCard extends StatelessWidget {
  final Widget child;
  const _InfoCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: child,
    );
  }
}

// 文化特色标签 / 문화 특색 태그
class _Tag extends StatelessWidget {
  final String zh; // 中文标签 / 중국어 태그
  final String ko; // 韩文标签 / 한국어 태그
  const _Tag({required this.zh, required this.ko});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9), // 浅绿背景 / 연녹색 배경
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFA5D6A7)),
      ),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 12),
          children: [
            TextSpan(text: zh, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w500)),
            TextSpan(text: ' · $ko', style: const TextStyle(color: Color(0xFF66BB6A))),
          ],
        ),
      ),
    );
  }
}

// 统计数据项 / 통계 데이터 항목
class _StatItem extends StatelessWidget {
  final String label; // 标签（中韩双语）/ 라벨 (중한 이중언어)
  final String value; // 数值 / 수치
  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: const TextStyle(fontSize: 11, color: AppColors.textSub)),
        const SizedBox(height: 2),
        Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.textMain)),
      ],
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 景点卡片组件 / 관광지 카드 위젯
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _AttractionCard extends StatelessWidget {
  final Attraction attraction; // 景点数据 / 관광지 데이터
  const _AttractionCard({required this.attraction});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 景点图片（有图片时显示，否则显示渐变占位）/ 관광지 이미지 (없으면 그라디언트 플레이스홀더)
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(13)),
            child: attraction.imageAsset != null
                ? Image.asset(attraction.imageAsset!, width: double.infinity, height: 160, fit: BoxFit.cover)
                : Container(
                    width: double.infinity, height: 120,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.heroStart, AppColors.heroEnd],
                        begin: Alignment.topLeft, end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(child: Text(attraction.emoji, style: const TextStyle(fontSize: 40))),
                  ),
          ),
          // 景点信息区 / 관광지 정보 영역
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 景点名称（中韩双语）/ 관광지 이름 (중한 이중언어)
                Row(
                  children: [
                    Text(attraction.name,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textMain)),
                    const SizedBox(width: 6),
                    Text(attraction.nameKo,
                        style: const TextStyle(fontSize: 11, color: AppColors.textSub)),
                  ],
                ),
                const SizedBox(height: 4),
                // 中文描述 / 중국어 설명
                Text(attraction.desc,
                    style: const TextStyle(fontSize: 12, color: AppColors.textSub, height: 1.5)),
                // 韩文描述 / 한국어 설명
                Text(attraction.descKo,
                    style: const TextStyle(fontSize: 11, color: AppColors.textHint, height: 1.4)),
                const SizedBox(height: 6),
                // 评分显示 / 평점 표시
                Row(
                  children: [
                    const Icon(Icons.star_rounded, color: Colors.orange, size: 14),
                    const SizedBox(width: 3),
                    Text('${attraction.rating}',
                        style: const TextStyle(fontSize: 12, color: AppColors.textSub, fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 美食卡片组件 / 음식 카드 위젯
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _FoodCard extends StatelessWidget {
  final Food food; // 美食数据 / 음식 데이터
  const _FoodCard({required this.food});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 美食图片（有图片时显示，否则显示渐变占位）/ 음식 이미지 (없으면 그라디언트 플레이스홀더)
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(13)),
            child: food.imageAsset != null
                ? Image.asset(food.imageAsset!, width: double.infinity, height: 120, fit: BoxFit.cover)
                : Container(
                    width: double.infinity, height: 120,
                    color: const Color(0xFFFFF8E1),
                    child: Center(child: Text(food.emoji, style: const TextStyle(fontSize: 40))),
                  ),
          ),
          // 美食信息区 / 음식 정보 영역
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 名称（中韩双语）/ 이름 (중한 이중언어)
                Row(
                  children: [
                    Text(food.name,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textMain)),
                    const SizedBox(width: 6),
                    Text(food.nameKo,
                        style: const TextStyle(fontSize: 11, color: AppColors.textSub)),
                  ],
                ),
                const SizedBox(height: 4),
                // 中文描述 / 중국어 설명
                Text(food.desc,
                    style: const TextStyle(fontSize: 12, color: AppColors.textSub, height: 1.5)),
                // 韩文描述 / 한국어 설명
                Text(food.descKo,
                    style: const TextStyle(fontSize: 11, color: AppColors.textHint, height: 1.4)),
                const SizedBox(height: 6),
                // 评分显示 / 평점 표시
                Row(
                  children: [
                    const Icon(Icons.star_rounded, color: Colors.orange, size: 14),
                    const SizedBox(width: 3),
                    Text('${food.rating}',
                        style: const TextStyle(fontSize: 12, color: AppColors.textSub, fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 旅行路线时间轴条目 / 여행 코스 타임라인 아이템
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _TourStepTile extends StatelessWidget {
  final TourStep step;  // 步骤数据 / 단계 데이터
  final bool isLast;    // 是否最后一步 / 마지막 단계 여부
  const _TourStepTile({required this.step, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 时间列 / 시간 열
        SizedBox(
          width: 52,
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(step.time,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.accent),
                textAlign: TextAlign.center),
          ),
        ),
        // 时间轴：圆点 + 连接线 / 타임라인: 점 + 연결선
        Column(
          children: [
            Container(width: 12, height: 12,
                decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle)),
            if (!isLast) // 最后一步不画连接线 / 마지막 단계에는 연결선 없음
              Container(width: 2, height: 72, color: const Color(0xFFC8E6C9)),
          ],
        ),
        const SizedBox(width: 12),
        // 步骤内容（地点+活动，中韩双语）/ 단계 내용 (장소+활동, 중한 이중언어)
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 地点名称（中韩双语）/ 장소 이름 (중한 이중언어)
                Text(step.place,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textMain)),
                Text(step.placeKo,
                    style: const TextStyle(fontSize: 11, color: AppColors.textSub)),
                const SizedBox(height: 4),
                // 活动描述（中韩双语）/ 활동 설명 (중한 이중언어)
                Text(step.activity,
                    style: const TextStyle(fontSize: 12, color: Color(0xFF616161), height: 1.5)),
                Text(step.activityKo,
                    style: const TextStyle(fontSize: 11, color: AppColors.textHint, height: 1.4)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 详情行组件（图标 + 中韩双语标签 + 双语内容）
// 상세 행 위젯 (아이콘 + 중한 이중언어 라벨 + 이중언어 내용)


// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 基本信息：彩色大数字卡 / 기본 정보: 컬러 큰 숫자 카드
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _BigStatCard extends StatelessWidget {
  final String value;    // 数值 / 수치
  final String labelZh;  // 中文标签 / 중국어 라벨
  final String labelKo;  // 韩文标签 / 한국어 라벨
  final String icon;     // 图标 / 아이콘
  final Color color;     // 主题色 / 테마 색상

  const _BigStatCard({
    required this.value, required this.labelZh,
    required this.labelKo, required this.icon, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withOpacity(0.18)),
          boxShadow: [
            BoxShadow(color: color.withOpacity(0.08), blurRadius: 10, offset: const Offset(0, 3)),
          ],
        ),
        child: Row(
          children: [
            // 彩色图标背景圆 / 컬러 아이콘 배경 원
            Container(
              width: 42, height: 42,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: Center(child: Text(icon, style: const TextStyle(fontSize: 20))),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 大数字 / 큰 숫자
                Text(value,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
                // 中文标签 / 중국어 라벨
                Text(labelZh,
                    style: const TextStyle(fontSize: 11, color: AppColors.textSub)),
                // 韩文标签 / 한국어 라벨
                Text(labelKo,
                    style: const TextStyle(fontSize: 11, color: AppColors.textSub)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 城市名片：横向滚动荣誉标签 / 도시 명함: 가로 스크롤 명예 태그
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _HonorChip extends StatelessWidget {
  final String icon;  // 图标 / 아이콘
  final String zh;    // 中文 / 중국어
  final String ko;    // 韩文 / 한국어

  const _HonorChip({required this.icon, required this.zh, required this.ko});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFA5D6A7)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 6)],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(icon, style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 2),
          // 中文标签 / 중국어 라벨
          Text(zh, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600,
              color: AppColors.primary)),
          // 韩文标签 / 한국어 라벨
          Text(ko, style: const TextStyle(fontSize: 9, color: AppColors.textSub)),
        ],
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 发展实力：三列卡片 / 발전 역량: 3열 카드
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

// 发展实力数据项 / 발전 역량 데이터 항목
class _StrengthItem {
  final String icon;
  final String zh;       // 中文标题 / 중국어 제목
  final String ko;       // 韩文标题 / 한국어 제목
  final String detail;   // 中文详情 / 중국어 상세
  final String detailKo; // 韩文详情 / 한국어 상세
  const _StrengthItem({
    required this.icon, required this.zh, required this.ko,
    required this.detail, required this.detailKo,
  });
}

// 发展实力卡片组 / 발전 역량 카드 그룹
class _StrengthCard extends StatelessWidget {
  final List<_StrengthItem> items; // 数据项列表 / 데이터 항목 목록
  const _StrengthCard({required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items.asMap().entries.map((e) {
        final i = e.key;
        final item = e.value;
        // 三种颜色循环 / 3가지 색상 순환
        final colors = [
          const Color(0xFF1976D2), // 蓝 / 파랑
          const Color(0xFF388E3C), // 绿 / 초록
          const Color(0xFFF57F17), // 橙 / 오렌지
        ];
        final c = colors[i % colors.length];
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(right: i < items.length - 1 ? 8 : 0),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: c.withOpacity(0.2)),
              boxShadow: [BoxShadow(color: c.withOpacity(0.07), blurRadius: 8)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 图标 + 标题（中韩双语）/ 아이콘 + 제목 (중한 이중언어)
                Text(item.icon, style: const TextStyle(fontSize: 22)),
                const SizedBox(height: 6),
                Text(item.zh,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: c)),
                Text(item.ko,
                    style: const TextStyle(fontSize: 10, color: AppColors.textSub)),
                const SizedBox(height: 6),
                // 详情（中韩双语）/ 상세 (중한 이중언어)
                Text(item.detail,
                    style: const TextStyle(fontSize: 11, color: AppColors.textMain, height: 1.5)),
                Text(item.detailKo,
                    style: const TextStyle(fontSize: 10, color: AppColors.textHint, height: 1.4)),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// 人文底蕴：左边框时间轴风格 / 인문 역사: 왼쪽 테두리 타임라인 스타일
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

// 人文底蕴数据项 / 인문 역사 데이터 항목
class _CultureItem {
  final String icon;
  final String zh;        // 中文标题 / 중국어 제목
  final String ko;        // 韩文标题 / 한국어 제목
  final String content;   // 中文内容 / 중국어 내용
  final String contentKo; // 韩文内容 / 한국어 내용
  const _CultureItem({
    required this.icon, required this.zh, required this.ko,
    required this.content, required this.contentKo,
  });
}

// 人文底蕴卡片组 / 인문 역사 카드 그룹
class _CultureCard extends StatelessWidget {
  final List<_CultureItem> items; // 数据项列表 / 데이터 항목 목록
  const _CultureCard({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
      ),
      child: Column(
        children: items.asMap().entries.map((e) {
          final i = e.key;
          final item = e.value;
          final isLast = i == items.length - 1; // 是否最后一项 / 마지막 항목 여부
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 左侧彩色圆形图标 / 왼쪽 컬러 원형 아이콘
                    Container(
                      width: 38, height: 38,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFA5D6A7)),
                      ),
                      child: Center(child: Text(item.icon, style: const TextStyle(fontSize: 18))),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 标题（中韩双语）/ 제목 (중한 이중언어)
                          Row(
                            children: [
                              Text(item.zh,
                                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold,
                                      color: AppColors.primary)),
                              const SizedBox(width: 5),
                              Text('· ${item.ko}',
                                  style: const TextStyle(fontSize: 11, color: Color(0xFF66BB6A))),
                            ],
                          ),
                          const SizedBox(height: 4),
                          // 中文内容 / 중국어 내용
                          Text(item.content,
                              style: const TextStyle(fontSize: 12, color: AppColors.textMain,
                                  height: 1.5)),
                          // 韩文内容 / 한국어 내용
                          Text(item.contentKo,
                              style: const TextStyle(fontSize: 11, color: AppColors.textSub,
                                  height: 1.4)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // 分隔线（最后一项不显示）/ 구분선 (마지막 항목에는 미표시)
              if (!isLast)
                const Divider(height: 1, thickness: 0.5, indent: 64, color: AppColors.border),
            ],
          );
        }).toList(),
      ),
    );
  }
}

// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
// AI使用内容列表项 / AI 활용 내용 목록 항목
// ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

class _AiItem extends StatelessWidget {
  final String zh; // 中文说明 / 중국어 설명
  final String ko; // 韩文说明 / 한국어 설명
  const _AiItem({required this.zh, required this.ko});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 绿色圆点 / 녹색 점
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Container(
              width: 7, height: 7,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 中文说明 / 중국어 설명
                Text(zh, style: const TextStyle(fontSize: 12,
                    color: AppColors.textMain, height: 1.5)),
                // 韩文说明 / 한국어 설명
                Text(ko, style: const TextStyle(fontSize: 11,
                    color: AppColors.textSub, height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}