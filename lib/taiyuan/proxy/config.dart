// ============================================
// 文件: proxy/lib/config.dart
// 用途: DeepSeek API 代理配置
// 说明:
//   - deepseekApiKey: 从环境变量 DEEPSEEK_API_KEY 读取
//   - port: 代理服务器监听端口
//   - 启动示例: DEEPSEEK_API_KEY=sk-xxxx dart run lib/taiyuan/proxy/server.dart
// ============================================

import 'dart:io';

/// 代理服务器配置
class ProxyConfig {
  /// DeepSeek API Key
  static String get deepseekApiKey =>
      Platform.environment['DEEPSEEK_API_KEY'] ?? '';

  /// DeepSeek API 地址
  static const String deepseekBaseUrl = 'https://api.deepseek.com';

  /// 代理服务器监听端口
  static const int port = 8080;
}
