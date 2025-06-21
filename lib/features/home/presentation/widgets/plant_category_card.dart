import 'package:flutter/material.dart';
import 'package:hubx_example/features/home/domain/entities/plant_category.dart';

class PlantCategoryCard extends StatelessWidget {
  final PlantCategory category;

  const PlantCategoryCard({
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1.2),
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16,
            left: 16,
            child: Text(
              category.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              maxLines: 2,
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(18),
              ),
              child: Image.asset(
                category.imagePath,
                width: 90,
                height: 90,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
