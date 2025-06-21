import 'package:flutter/material.dart';
import 'package:hubx_example/features/home/domain/entities/plant_category.dart';
import 'package:hubx_example/features/home/presentation/widgets/plant_category_card.dart';

class PlantCategoryGrid extends StatelessWidget {
  final List<PlantCategory> categories;

  const PlantCategoryGrid({
    required this.categories,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.1,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return PlantCategoryCard(category: category);
      },
    );
  }
}
