# 我和我的家乡 — Flutter 城市导览 App

展示中国城市旅游导览的 Flutter 应用，支持中韩双语，每个城市拥有独立的介绍页、景点、美食、旅行路线。

## 城市模块

| 城市 | 入口 | 特色 |
|------|------|------|
| 北京 | `BeijingEntry` | AI 智能行程、景点美食攻略 |
| 太原 | `TaiyuanCityPage` | 城市介绍、路线、AI 助手 |
| 临沂 | `LinyiPage` | 旅游景点、代表美食、推荐路线 |
| 哈尔滨 | `HarbinPage` | 中韩双语、视频头图、冰雪特色 |
| 温州泰顺 | `TaishunEntry` | 廊桥之乡、景点美食 |

## 项目结构

```
lib/
├── main.dart              # 入口，城市选择主页
├── beijing/               # 北京（screens/services/widgets）
├── haerbin/               # 哈尔滨
├── linyi/                 # 临沂
├── taiyuan/               # 太原（structure/l10n/shared）
└── wenzhoutaishun/        # 温州泰顺
```

## 技术栈

- **框架**: Flutter 3.x / Dart
- **视频**: video_player
- **AI**: DeepSeek Chat API（无 Key 时自动演示模式）
- **本地化**: 中韩双语 InheritedWidget

## 运行

```bash
flutter pub get
flutter run
```

## 构建 APK

```bash
# Release（不带 Key，演示数据）
flutter build apk --release

# 带 AI Key（仅开发测试）
flutter build apk --release --dart-define=DEEPSEEK_KEY=sk-xxxx
```

## 资源

```
assets/
├── images/{beijing,harbin,linyi,taishun,taiyuan}/
└── videos/   # 城市头图视频
```
