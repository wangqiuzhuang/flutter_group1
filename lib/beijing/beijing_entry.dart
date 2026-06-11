/// 北京模块入口
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'utils/app_state.dart';

class BeijingEntry extends StatelessWidget {
  const BeijingEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppStateProvider(child: HomeScreen());
  }
}
