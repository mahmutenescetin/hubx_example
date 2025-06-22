import 'package:flutter/material.dart';
import 'package:hubx_example/core/utils/extensions/context_extensions.dart';
import 'package:hubx_example/core/utils/extensions/string_extension.dart';
import 'package:hubx_example/features/home/domain/entities/category.dart';

class PlantCategoryCard extends StatelessWidget {
  final Category category;

  const PlantCategoryCard({
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    final imagePath = category.image;

    imageWidget = Image.network(
      imagePath,
      width: 190,
      height: 190,
      fit: BoxFit.fill,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const SizedBox(
          width: 111,
          height: 111,
          child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
        );
      },
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1.2),
        borderRadius: BorderRadius.circular(18),
        color: context.colors.appColors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned(
                  top: 16,
                  left: 16,
                  child: SizedBox(
                    width: constraints.maxWidth - 50,
                    child: Text(
                      category.name.replaceAll('-', ' ').capitalizeWords(),
                      style: context.textStyles.b16Regular500,
                      softWrap: true,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -10,
                  right: -10,
                  child: imageWidget,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
