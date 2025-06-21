import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hubx_example/features/home/presentation/widgets/plant_info_card.dart';

class PlantInfoCardSlider extends StatelessWidget {
  const PlantInfoCardSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: SizedBox(
        height: 160.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(right: 10.w),
          physics: const AlwaysScrollableScrollPhysics(),
          children: const [
            PlantInfoCard(
              imagePath: 'assets/png/plant.png',
              title: 'How to identify plants easily with PlantApp?',
            ),
            PlantInfoCard(
              imagePath: 'assets/png/plant.png',
              title: 'Species and the differences',
            ),
            PlantInfoCard(
              imagePath: 'assets/png/plant.png',
              title: 'Care tips for your plants',
            ),
          ],
        ),
      ),
    );
  }
}
