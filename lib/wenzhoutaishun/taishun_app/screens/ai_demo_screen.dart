import 'package:flutter/material.dart';

class AiDemoScreen extends StatelessWidget {
  const AiDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---- 标题 ----
          const Text(
            'AI 开发过程',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'AI 개발 과정',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20),

          // ---- 使用的AI工具 ----
          _sectionTitle('使用的 AI 工具', '사용된 AI 도구'),
          const SizedBox(height: 8),
          _aiToolCard(
            icon: Icons.auto_awesome,
            titleZh: 'Cursor / Claude',
            titleKo: 'Cursor / Claude',
            descZh: '代码生成、UI 布局设计、数据模型编写',
            descKo: '코드 생성, UI 레이아웃 설계, 데이터 모델 작성',
          ),
          _aiToolCard(
            icon: Icons.image,
            titleZh: 'AI 图像生成',
            titleKo: 'AI 이미지 생성',
            descZh: '首页背景图、景点插画制作',
            descKo: '홈페이지 배경 이미지, 관광지 일러스트 제작',
          ),
          _aiToolCard(
            icon: Icons.translate,
            titleZh: 'AI 翻译',
            titleKo: 'AI 번역',
            descZh: '中文 → 韩文 内容翻译',
            descKo: '중국어 → 한국어 콘텐츠 번역',
          ),
          const SizedBox(height: 20),

          // ---- 开发过程 ----
          _sectionTitle('开发过程', '개발 과정'),
          const SizedBox(height: 12),
          _stepCard(
            step: '01',
            titleZh: '素材整理',
            titleKo: '소재 정리',
            descZh: '收集整理了泰顺的旅游资料、景点介绍和美食信息。',
            descKo: '타이순의 관광 자료, 명소 소개, 음식 정보를 수집하고 정리했습니다.',
          ),
          _stepCard(
            step: '02',
            titleZh: '向 AI 输入指令',
            titleKo: 'AI에 명령어 입력',
            descZh: '"请用 Flutter 帮我做一个泰顺旅游 App，支持中韩双语，包含 4 个标签页，使用 Material 3 设计风格。"',
            descKo: '"Flutter로 타이순 관광 앱을 만들어 주세요. 중국어와 한국어 이중 언어를 지원하고, 4개의 탭, Material 3 디자인 스타일을 사용해 주세요."',
          ),
          _stepCard(
            step: '03',
            titleZh: '代码生成与调整',
            titleKo: '코드 생성 및 수정',
            descZh: '将 AI 生成的代码复制到项目中，修复报错，并调整成自己想要的设计。',
            descKo: 'AI가 생성한 코드를 프로젝트에 복사하고, 오류를 수정하며 원하는 디자인으로 조정했습니다.',
          ),
          _stepCard(
            step: '04',
            titleZh: '双语适配',
            titleKo: '이중 언어 적용',
            descZh: '请 AI 将所有文本翻译成韩文，实现中韩双语显示。',
            descKo: 'AI에게 모든 텍스트의 한국어 번역을 요청하여 중국어-한국어 이중 언어 표시를 구현했습니다.',
          ),
          _stepCard(
            step: '05',
            titleZh: '完成与演示',
            titleKo: '완성 및 시연',
            descZh: '运行 App，验证所有功能是否正常工作。',
            descKo: '앱을 실행하여 모든 기능이 정상적으로 작동하는지 확인했습니다.',
          ),
          const SizedBox(height: 20),

          // ---- 示例提示词 ----
          _sectionTitle('实际使用的提示词示例', '실제 사용한 프롬프트 예시'),
          const SizedBox(height: 12),
          _promptCard(
            titleZh: '📝 生成整个项目',
            titleKo: '📝 전체 프로젝트 생성',
            prompt: '"Create a Flutter tourism app for Taishun, China. Use Material 3, with 5 bottom tabs: Home, Attractions, Food, Routes, AI. Support Chinese and Korean bilingual display."',
          ),
          _promptCard(
            titleZh: '📝 生成数据模型',
            titleKo: '📝 데이터 모델 생성',
            prompt: '"Create Dart model classes for a tourism app: Attraction (with id, nameZh, nameKo, descriptionZh, descriptionKo, category), FoodItem, and RouteItem with RouteDay."',
          ),
          _promptCard(
            titleZh: '📝 生成 UI 组件',
            titleKo: '📝 UI 컴포넌트 생성',
            prompt: '"Create a Flutter Card widget for displaying a food item. Show food name in Chinese and Korean, description, and a tag chip. Use Material 3 design."',
          ),
          _promptCard(
            titleZh: '📝 修复错误',
            titleKo: '📝 오류 수정',
            prompt: '"Fix this error: The argument type \'String\' can\'t be assigned to the parameter type \'Widget\'."',
          ),
          const SizedBox(height: 32),

          // ---- 总结 ----
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF2E5D3A).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Column(
              children: [
                Icon(Icons.lightbulb, color: Color(0xFF2E5D3A), size: 32),
                SizedBox(height: 8),
                Text(
                  '借助 AI 工具，大幅缩短了开发时间，\n成功打造了一款高质量的双语旅游 App。',
                  style: TextStyle(fontSize: 14, color: Colors.black87, height: 1.6),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 6),
                Text(
                  'AI 도구를 활용하여 개발 시간을 크게 단축하고,\n고품질의 이중 언어 관광 앱을 완성했습니다.',
                  style: TextStyle(fontSize: 12, color: Colors.black54, height: 1.6),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget _sectionTitle(String zh, String ko) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(zh, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF2E5D3A))),
        Text(ko, style: const TextStyle(fontSize: 13, color: Colors.grey)),
      ],
    );
  }

  Widget _aiToolCard({
    required IconData icon,
    required String titleZh,
    required String titleKo,
    required String descZh,
    required String descKo,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF2E5D3A).withOpacity(0.15),
          child: Icon(icon, color: const Color(0xFF2E5D3A)),
        ),
        title: Text(titleZh, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titleKo, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 4),
            Text(descZh, style: const TextStyle(fontSize: 13)),
            Text(descKo, style: const TextStyle(fontSize: 12, color: Colors.black54)),
          ],
        ),
      ),
    );
  }

  Widget _stepCard({
    required String step,
    required String titleZh,
    required String titleKo,
    required String descZh,
    required String descKo,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xFF2E5D3A),
              radius: 18,
              child: Text(step, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titleZh, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Text(titleKo, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text(descZh, style: const TextStyle(fontSize: 13)),
                  const SizedBox(height: 2),
                  Text(descKo, style: const TextStyle(fontSize: 12, color: Colors.black54)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _promptCard({
    required String titleZh,
    required String titleKo,
    required String prompt,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(titleZh, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(titleKo, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                prompt,
                style: const TextStyle(fontFamily: 'monospace', fontSize: 12, height: 1.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}