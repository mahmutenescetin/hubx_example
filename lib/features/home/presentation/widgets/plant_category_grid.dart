import 'package:flutter/material.dart';
import 'package:hubx_example/features/home/domain/entities/category.dart';
import 'package:hubx_example/features/home/presentation/widgets/plant_category_card.dart';

class PlantCategoryGrid extends StatelessWidget {
  final List<Category> categories;

  const PlantCategoryGrid({
    required this.categories,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return PlantCategoryCard(
          category: categories[index],
        );
      },
    );
  }
}
