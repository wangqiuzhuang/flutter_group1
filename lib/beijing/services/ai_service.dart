/// ============================================================
/// AI 服务 — 调用 DeepSeek API 生成旅行行程
/// ============================================================
/// 工作原理：
///   1. 收集用户的偏好（天数、兴趣标签）
///   2. 构造 prompt（中文或韩文）
///   3. 调用 DeepSeek Chat API (OpenAI 兼容格式)
///   4. 解析返回的文本，提取每天的行程信息
///
/// DeepSeek 优势：国产模型，中文理解能力强，价格极低（约 OpenAI 的 1/10）
///
/// 安全说明：
///   API Key 存放在 lib/services/api_config.dart (已 gitignore)
///   他人 clone 后需创建自己的 api_config.dart 文件
/// ============================================================

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_config.dart';

class AiService {
  static const _baseUrl = 'https://api.deepseek.com';
  static String get _apiKey => ApiConfig.deepseekKey;  // 从本地配置文件读取
  static const _model = 'deepseek-chat';

  /// 检查 Key 是否已配置
  static bool get isConfigured => _apiKey.isNotEmpty;

  /// 根据用户偏好生成北京旅行行程
  /// Key 为空时自动使用演示数据，交作业安全不泄漏 Key
  static Future<String> generateItinerary({
    required int days,
    required List<String> interests,
    required String language,
  }) async {
    if (!isConfigured) {
      // 模拟网络延迟，让用户看到加载动画
      await Future.delayed(const Duration(seconds: 2));
      return _generateDemoItinerary(days: days, interests: interests, language: language);
    }

    final langName = language == 'ko' ? '韩语' : '中文';
    final interestText = interests.join('、');

    /// 构建 prompt：告诉 AI 它的角色、用户偏好和输出格式要求
    final prompt = '''
你是一个专业的北京旅行规划师。请根据以下用户偏好，生成一份详细的北京${days}日游行程攻略。

用户兴趣偏好：$interestText
旅行天数：${days}天
输出语言：$langName

请严格按照以下格式输出，每天一个段落，用"【Day N】"作为分隔：

【Day 1】上午：xxx；中午：xxx；下午：xxx；晚上：xxx。交通提示：xxx。
【Day 2】上午：xxx；中午：xxx；下午：xxx；晚上：xxx。交通提示：xxx。
...

要求：
1. 每天安排4个时段（上午/中午/下午/晚上），每个时段1-2个具体景点或餐厅名称
2. 交通提示给出具体的地铁线路或出行方式
3. 根据用户兴趣偏好优先安排相关内容
4. 考虑地理位置合理性，不要安排相距太远的景点在同半天
5. 如果语言是韩语，请全部用韩文输出；如果是中文，用中文输出
6. 每个时段的描述控制在20字以内
7. 在最后加一行"📌 预算估算："给出大致的总花费范围（人民币）
''';

    try {
      /// 调用 DeepSeek Chat Completions API (与 OpenAI 格式兼容)
      final response = await http.post(
        Uri.parse('$_baseUrl/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          'model': _model,
          'messages': [
            {'role': 'system', 'content': '你是一个专业的北京旅行规划师，回复简洁精准。'},
            {'role': 'user', 'content': prompt},
          ],
          'max_tokens': 2048, // 限制输出长度，避免浪费 token
          'temperature': 0.8, // 稍高温度增加创意性
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'] as String;
      } else {
        return '生成失败 (${response.statusCode})，请重试。\n생성에 실패했습니다. 다시 시도해주세요.';
      }
    } catch (e) {
      return '网络错误：$e\n네트워크 오류가 발생했습니다.';
    }
  }

  /// 演示模式 — 预设行程数据，无需 API Key
  /// 交作业时 Key 不会泄漏到 APK 中
  static String _generateDemoItinerary({
    required int days,
    required List<String> interests,
    required String language,
  }) {
    final isKo = language == 'ko';
    final Map<String, List<String>> dayData = {
      '1': [
        isKo ? '오전: 천안문 광장 & 고궁 박물관' : '上午：天安门广场 & 故宫博物院',
        isKo ? '점심: 징산 공원 산책' : '中午：景山公园俯瞰故宫',
        isKo ? '오후: 국가박물관 (예약 필수)' : '下午：国家博物馆（需预约）',
        isKo ? '저녁: 왕푸징 거리 & 베이징 카오야' : '晚上：王府井大街 & 北京烤鸭',
        isKo ? '교통: 지하철 1호선 천안문동역' : '交通：地铁1号线天安门东站',
      ],
      '2': [
        isKo ? '오전: 만리장성 바다링 구간' : '上午：八达岭长城',
        isKo ? '점심: 장성 근처 현지 식당' : '中午：长城脚下农家菜',
        isKo ? '오후: 명십삼릉 & 신도' : '下午：明十三陵 & 神道',
        isKo ? '저녁: 허우하이 바 거리' : '晚上：后海酒吧街',
        isKo ? '교통: 877번 버스 (더성먼 출발)' : '交通：877路公交（德胜门出发）',
      ],
      '3': [
        isKo ? '오전: 천단 공원 & 지역 노인 태극권' : '上午：天坛公园 & 看大爷打太极',
        isKo ? '점심: 첸먼 거리 전통 간식' : '中午：前门大街老字号小吃',
        isKo ? '오후: 이화원 & 곤명호 유람선' : '下午：颐和园 & 昆明湖游船',
        isKo ? '저녁: 구이제 거리 야시장' : '晚上：簋街夜市',
        isKo ? '교통: 지하철 5호선 천단동문역' : '交通：地铁5号线天坛东门站',
      ],
      '4': [
        isKo ? '오전: 798 예술구 & 갤러리 투어' : '上午：798艺术区 & 画廊打卡',
        isKo ? '점심: 차오양 공원 피크닉' : '中午：朝阳公园野餐',
        isKo ? '오후: 싼리툰 & 타이구리 쇼핑' : '下午：三里屯 & 太古里逛潮牌',
        isKo ? '저녁: 구이러우 라이브하우스' : '晚上：鼓楼看LiveHouse演出',
        isKo ? '교통: 지하철 14호선 왕징난역' : '交通：地铁14号线望京南站',
      ],
      '5': [
        isKo ? '오전: 북해공원 & 백탑사' : '上午：北海公园 & 白塔寺',
        isKo ? '점심: 난뤄구샹 골목 탐방' : '中午：南锣鼓巷胡同小吃',
        isKo ? '오후: 국가식물원 (북원)' : '下午：国家植物园（北园）',
        isKo ? '저녁: CBD 야경 & 궈마오 전망대' : '晚上：CBD夜景 & 国贸观景台',
        isKo ? '교통: 지하철 6호선 난뤄구샹역' : '交通：地铁6号线南锣鼓巷站',
      ],
    };

    final buf = StringBuffer();
    final actualDays = days.clamp(1, 5);
    for (var d = 1; d <= actualDays; d++) {
      buf.writeln('【Day $d】');
      for (final item in dayData['$d'] ?? dayData['1']!) {
        buf.writeln('$item；');
      }
      buf.writeln();
    }

    // 根据兴趣偏好微调最后一天的推荐
    final hasArt = interests.any((i) => i.contains('文艺') || i.contains('예술'));
    final hasFood = interests.any((i) => i.contains('美食') || i.contains('맛집'));
    final tip = isKo
        ? (hasArt
            ? '🎨 추천: 국가미술관에서 현재 무료 전시 중!'
            : hasFood
                ? '🍜 추천: 후이민 거리에서 현지인 맛집 탐방!'
                : '📸 추천: 징산 공원 정상에서 고궁 전경 촬영 명소!')
        : (hasArt
            ? '🎨 推荐：中国美术馆当前有免费特展！'
            : hasFood
                ? '🍜 推荐：牛街清真美食街，本地人最爱！'
                : '📸 推荐：景山公园山顶拍故宫全景最佳机位！');

    buf.writeln('📌 预算估算：${_budgetEstimate(actualDays, isKo)}');
    buf.writeln(tip);

    return buf.toString();
  }

  static String _budgetEstimate(int days, bool isKo) {
    final perDay = 300 + (days * 50);
    final total = perDay * days;
    if (isKo) {
      return '1일 평균 ¥$perDay, 총 약 ¥$total (항공권 제외)';
    }
    return '日均¥$perDay，总计约¥$total（不含往返机票）';
  }
}
