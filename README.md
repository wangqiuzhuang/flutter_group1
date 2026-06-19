# 我和我的家乡 / 나와 나의 고향 / My Hometown

展示中国城市旅游导览的 Flutter 应用，支持中韩双语。

Flutter 앱으로 제작한 중국 도시 여행 가이드입니다. 중한 이중 언어를 지원합니다.

A Flutter app showcasing travel guides for Chinese cities, with bilingual support (Chinese/Korean).

---

## 城市模块 / 도시 모듈 / Cities

| 城市 / 도시 / City | 入口 / Entry | 特色 / 특징 / Highlights |
|------|------|------|
| 北京 / 베이징 | `BeijingEntry` | AI 行程规划、景点美食攻略 |
| 太原 / 타이위안 | `TaiyuanCityPage` | 城市介绍、路线、AI 助手 |
| 临沂 / 린이 | `LinyiPage` | 旅游景点、代表美食、推荐路线 |
| 哈尔滨 / 하얼빈 | `HarbinPage` | 视频头图、冰雪特色、双语展示 |
| 温州泰顺 / 원저우 타이순 | `TaishunEntry` | 廊桥之乡、景点美食 |

---

## 项目结构 / 프로젝트 구조 / Structure

```
lib/
├── main.dart              # 入口 / 엔트리 / Entry
├── beijing/               # 北京 / 베이징
├── haerbin/               # 哈尔滨 / 하얼빈
├── linyi/                 # 临沂 / 린이
├── taiyuan/               # 太原 / 타이위안
└── wenzhoutaishun/        # 温州泰顺 / 원저우 타이순
```

## 技术栈 / 기술 스택 / Tech Stack

- **框架 / 프레임워크**: Flutter 3.x / Dart
- **视频 / 비디오**: video_player
- **AI**: DeepSeek Chat API (无 Key 时自动演示 / Key 없으면 데모 모드)
- **本地化 / 로컬라이제이션**: InheritedWidget (中文 / 한국어)

---

## 运行 / 실행 / Run

```bash
flutter pub get
flutter run
```

## 构建 APK / APK 빌드 / Build

```bash
# Release（不带 Key，演示数据 / Key 없음, 데모 데이터）
flutter build apk --release

# 带 AI Key（仅开发测试 / 개발 테스트용）
flutter build apk --release --dart-define=DEEPSEEK_KEY=sk-xxxx
```

## 资源 / 리소스 / Assets

```
assets/
├── images/{beijing,harbin,linyi,taishun,taiyuan}/
└── videos/   # 城市头图视频 / 도시 헤더 영상
```
