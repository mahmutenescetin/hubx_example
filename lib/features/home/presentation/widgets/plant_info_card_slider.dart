import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hubx_example/features/home/domain/entities/question.dart';
import 'package:hubx_example/features/home/presentation/widgets/plant_info_card.dart';

class PlantInfoCardSlider extends StatelessWidget {
  final List<Question> questions;

  const PlantInfoCardSlider({
    required this.questions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const SizedBox();
    }

    return SizedBox(
      height: 140.h,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return PlantInfoCard(
            question: questions[index],
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 12.w),
      ),
    );
  }
}
