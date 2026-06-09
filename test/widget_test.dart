import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_group1/ty_taiyuan_app.dart';

/// 太原城市 App 测试
void main() {
  testWidgets('shows Taiyuan hometown introduction', (tester) async {
    await tester.pumpWidget(const TaiyuanApp());
    await tester.pump();
    expect(find.text('太原'), findsOneWidget);
  });
}
