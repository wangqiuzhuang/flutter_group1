import 'package:flutter/material.dart';
import '../data/taishun_repository.dart';

class RoutesScreen extends StatelessWidget {
  const RoutesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routes = TaishunRepository.getRoutes();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: routes.length,
      itemBuilder: (context, index) {
        final r = routes[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(r.titleZh, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(r.titleKo, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                const SizedBox(height: 12),
                ...r.days.map((day) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Day ${day.dayNumber}: ${day.descriptionZh}',
                        style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF2E5D3A)),
                      ),
                      Text(
                        'Day ${day.dayNumber}: ${day.descriptionKo}',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      ...List.generate(day.highlightsZh.length, (i) => Padding(
                        padding: const EdgeInsets.only(left: 16, top: 2),
                        child: Text(
                          '• ${day.highlightsZh[i]} / ${day.highlightsKo[i]}',
                          style: const TextStyle(fontSize: 14),
                        ),
                      )),
                    ],
                  ),
                )),
              ],
            ),
          ),
        );
      },
    );
  }
}