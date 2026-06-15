import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/attractions_screen.dart';
import 'screens/food_screen.dart';
import 'screens/routes_screen.dart';
import 'screens/ai_demo_screen.dart';

class TaishunMainScreen extends StatefulWidget {
  const TaishunMainScreen({super.key});

  @override
  State<TaishunMainScreen> createState() => _TaishunMainScreenState();
}

class _TaishunMainScreenState extends State<TaishunMainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    AttractionsScreen(),
    FoodScreen(),
    RoutesScreen(),
    AiDemoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('泰顺旅游 / 타이순 여행'),
        centerTitle: true,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2E5D3A),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页/홈'),
          BottomNavigationBarItem(icon: Icon(Icons.temple_buddhist), label: '景点/명소'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: '美食/음식'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: '路线/코스'),
          BottomNavigationBarItem(icon: Icon(Icons.smart_toy), label: 'AI'),
        ],
      ),
    );
  }
}