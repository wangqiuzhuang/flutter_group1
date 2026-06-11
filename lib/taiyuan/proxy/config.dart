// ============================================
// 文件: proxy/lib/config.dart
// 用途: DeepSeek API 代理配置
// 说明:
//   - deepseekApiKey: 替换为你的 DeepSeek API Key
//   - port: 代理服务器监听端口
//   - 此文件不提交到 Git（建议加入 .gitignore）
// ============================================

/// 代理服务器配置
class ProxyConfig {
  /// DeepSeek API Key — 请替换为真实 Key
  static const String deepseekApiKey = '';

  /// DeepSeek API 地址
  static const String deepseekBaseUrl = 'https://api.deepseek.com';

  /// 代理服务器监听端口
  static const int port = 8080;
}
