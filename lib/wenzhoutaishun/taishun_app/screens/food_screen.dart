import 'package:flutter/material.dart';
import '../data/taishun_repository.dart';
import '../models/taishun_models.dart';
import 'detail_screen.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final foods = TaishunRepository.getFoods();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: foods.length,
      itemBuilder: (context, index) {
        final f = foods[index];
        return _FoodCard(
          food: f,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailScreen(
                  titleZh: f.nameZh,
                  titleKo: f.nameKo,
                  contentZh: f.descriptionZh,
                  contentKo: f.descriptionKo,
                  categoryZh: f.tagZh,
                  categoryKo: f.tagKo,
                  imageName: f.imageName,
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _FoodCard extends StatelessWidget {
  final FoodItem food;
  final VoidCallback onTap;

  const _FoodCard({required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset(
              'assets/images/taishun/${food.imageName}',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                color: const Color(0xFF8B5A2B).withOpacity(0.2),
                alignment: Alignment.center,
                child: Text(
                  '${food.tagZh}\n${food.tagKo}',
                  style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              onTap: onTap,
              title: Text(food.nameZh, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(food.nameKo, style: const TextStyle(fontSize: 11, color: Colors.grey)),
                  const SizedBox(height: 2),
                  Text(food.descriptionZh, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12)),
                ],
              ),
              trailing: Chip(
                label: Text('${food.tagZh} / ${food.tagKo}', style: const TextStyle(fontSize: 9)),
                backgroundColor: const Color(0xFF2E5D3A).withOpacity(0.1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}