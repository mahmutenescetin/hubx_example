import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hubx_example/core/utils/extensions/context_extensions.dart';
import 'package:hubx_example/features/home/domain/entities/plant_category.dart';
import 'package:hubx_example/features/home/presentation/widgets/plant_category_card.dart';
import 'package:hubx_example/features/home/presentation/widgets/plant_category_grid.dart';
import 'package:hubx_example/features/home/presentation/widgets/plant_info_card_slider.dart';
import 'package:hubx_example/features/home/presentation/widgets/plant_search_bar.dart';
import 'package:hubx_example/features/home/presentation/widgets/premium_banner.dart';
import 'package:hubx_example/gen/assets.gen.dart';
import 'package:hubx_example/shared/widgets/reusable_text.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                Assets.png.homeBackground.path,
                height: 270,
                fit: BoxFit.fill,
                width: double.infinity,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          // İçerik
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(46.h),
                Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        "Hi, plant lover!",
                        style: context.textStyles.b16Regular400,
                      ),
                      Gap(6.h),
                      ReusableText(
                        "Good Afternoon! ⛅",
                        style: context.textStyles.b24Regular500,
                      ),
                      Gap(16.h),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.r),
                  child: PlantSearchBar(
                    onChanged: (value) {},
                  ),
                ),
                Gap(24.h),
                PremiumBanner(
                  onTap: () {},
                ),
                Gap(24.h),
                const PlantInfoCardSlider(),
                Gap(24.h),
                PlantCategoryGrid(
                  categories: [
                    PlantCategory(title: 'Edible Plants', imagePath: 'assets/png/tree.png'),
                    PlantCategory(title: 'Ferns', imagePath: 'assets/png/tree.png'),
                    PlantCategory(title: 'Cacti and Succulents', imagePath: 'assets/png/tree.png'),
                    PlantCategory(title: 'Palms', imagePath: 'assets/png/tree.png'),
                    PlantCategory(title: 'Palms', imagePath: 'assets/png/tree.png'),
                    PlantCategory(title: 'Palms', imagePath: 'assets/png/tree.png'),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
