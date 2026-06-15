import 'package:flutter/material.dart';
import '../data/taishun_repository.dart';
import '../models/taishun_models.dart';
import 'detail_screen.dart';

class AttractionsScreen extends StatelessWidget {
  const AttractionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final attractions = TaishunRepository.getAttractions();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: attractions.length,
      itemBuilder: (context, index) {
        final a = attractions[index];
        return _AttractionCard(
          attraction: a,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailScreen(
                  titleZh: a.nameZh,
                  titleKo: a.nameKo,
                  contentZh: a.fullDescZh,
                  contentKo: a.fullDescKo,
                  categoryZh: a.categoryZh,
                  categoryKo: a.categoryKo,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _AttractionCard extends StatelessWidget {
  final Attraction attraction;
  final VoidCallback onTap;

  const _AttractionCard({required this.attraction, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        onTap: onTap,
        leading: Container(
          width: 60,
          height: 60,
          color: const Color(0xFF2E5D3A).withOpacity(0.15),
          alignment: Alignment.center,
          child: Text(
            '${attraction.categoryZh}\n${attraction.categoryKo}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ),
        title: Text(attraction.nameZh, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(attraction.nameKo, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 2),
            Text(attraction.shortDescZh, maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}