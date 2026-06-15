import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String titleZh;
  final String titleKo;
  final String contentZh;
  final String contentKo;
  final String categoryZh;
  final String categoryKo;
  final String imageName;

  const DetailScreen({
    super.key,
    required this.titleZh,
    required this.titleKo,
    required this.contentZh,
    required this.contentKo,
    required this.categoryZh,
    required this.categoryKo,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titleZh)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/taishun/$imageName',
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF2E5D3A), Color(0xFF4A90B8)],
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '$categoryZh / $categoryKo',
                    style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(titleZh, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(titleKo, style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 8),
            Chip(
              label: Text('$categoryZh / $categoryKo', style: const TextStyle(fontSize: 12)),
              backgroundColor: const Color(0xFF2E5D3A).withOpacity(0.1),
            ),
            const SizedBox(height: 16),
            Text(contentZh, style: const TextStyle(fontSize: 16, height: 1.8, color: Colors.black87)),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            Text(contentKo, style: const TextStyle(fontSize: 14, height: 1.8, color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}