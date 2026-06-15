import 'package:flutter/material.dart';
import '../data/taishun_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final featured = TaishunRepository.getAttractions().take(3).toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero 头部 — 使用本地图片
          Container(
            width: double.infinity,
            height: 320,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/taishun/home_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.5), Colors.black.withOpacity(0.3)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '走走泰顺，一切都顺',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    '타이순을 거닐면 모든 것이 순조로워진다',
                    style: TextStyle(fontSize: 14, color: Colors.white60),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    '中国廊桥之乡 · 中国天然氧吧\n森林覆盖率76.1% · 负氧离子最高10万个/cm³',
                    style: TextStyle(fontSize: 14, color: Colors.white70, height: 1.6),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 4),
                  Text(
                    '중국 랑교의 고향 · 중국 천연 산소방\n산림覆盖率 76.1% · 음이온 최고 10만 개/cm³',
                    style: TextStyle(fontSize: 12, color: Colors.white54, height: 1.6),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // 精选景点
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('精选推荐 / 추천 명소', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: featured.length,
              itemBuilder: (context, index) {
                final a = featured[index];
                return Container(
                  width: 220,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/taishun/${a.imageName}',
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            height: 100,
                            color: const Color(0xFF8B5A2B).withOpacity(0.2),
                            alignment: Alignment.center,
                            child: Text(
                              '${a.categoryZh} / ${a.categoryKo}',
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(a.nameZh, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                              Text(a.nameKo, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                              const SizedBox(height: 4),
                              Text(a.shortDescZh, style: const TextStyle(fontSize: 12, color: Colors.black87), maxLines: 2, overflow: TextOverflow.ellipsis),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 24),

          // 数字名片
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('泰顺 · 数字名片 / 타이순 · 숫자로 보기', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                _StatCard(titleZh: '森林覆盖率', titleKo: '산림覆盖率', value: '76.1%'),
                _StatCard(titleZh: '古廊桥', titleKo: '고대 랑교', value: '32座'),
                _StatCard(titleZh: '千米高峰', titleKo: '1000m 이상 봉우리', value: '179座'),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String titleZh;
  final String titleKo;
  final String value;
  const _StatCard({required this.titleZh, required this.titleKo, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF2E5D3A).withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF2E5D3A))),
            Text(titleZh, style: const TextStyle(fontSize: 12, color: Colors.black87)),
            Text(titleKo, style: const TextStyle(fontSize: 10, color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}