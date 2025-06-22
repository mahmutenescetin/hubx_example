import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hubx_example/core/utils/extensions/context_extensions.dart';
import 'package:hubx_example/features/home/domain/entities/question.dart';

class PlantInfoCard extends StatelessWidget {
  final Question question;

  const PlantInfoCard({
    required this.question,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 240,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  question.image,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: 80,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.2),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 16,
                right: 16,
                bottom: 20,
                child: Text(
                  question.question,
                  style: context.textStyles.b15Regular400.copyWith(
                    color: context.colors.appColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
