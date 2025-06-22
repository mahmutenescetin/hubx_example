import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hubx_example/core/utils/extensions/context_extensions.dart';
import 'package:hubx_example/features/home/presentation/bloc/home_cubit.dart';
import 'package:hubx_example/features/home/presentation/bloc/home_state.dart';
import 'package:hubx_example/features/home/presentation/widgets/plant_category_grid.dart';
import 'package:hubx_example/features/home/presentation/widgets/plant_info_card_slider.dart';
import 'package:hubx_example/features/home/presentation/widgets/plant_search_bar.dart';
import 'package:hubx_example/features/home/presentation/widgets/premium_banner.dart';
import 'package:hubx_example/gen/assets.gen.dart';
import 'package:hubx_example/shared/widgets/reusable_text.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeCubit>().loadData();
    });
  }

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
          Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(46.h),
                  Padding(
                    padding: EdgeInsets.all(20.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          context.l10n.hiPlantLover,
                          style: context.textStyles.b16Regular400,
                        ),
                        Gap(6.h),
                        ReusableText(
                          context.l10n.goodAfternoon,
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
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoading) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      if (state is HomeError) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                ReusableText(
                                  context.l10n.categoriesAndQuestionsError(
                                      state.message),
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                                ElevatedButton(
                                  onPressed: () {
                                    context.read<HomeCubit>().loadData();
                                  },
                                  child: Text(context.l10n.tryAgain),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      if (state is DataLoaded) {
                        return Column(
                          children: [
                            Gap(24.h),
                            PremiumBanner(
                              onTap: () {},
                            ),
                            PlantInfoCardSlider(questions: state.questions),
                            Gap(24.h),
                            PlantCategoryGrid(categories: state.categories),
                            Gap(20.h),
                          ],
                        );
                      }

                      if (state is QuestionsLoaded) {
                        return Column(
                          children: [
                            PlantInfoCardSlider(questions: state.questions),
                            Gap(24.h),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(context.l10n.categoriesLoading),
                              ),
                            ),
                            Gap(20.h),
                          ],
                        );
                      }

                      if (state is CategoriesLoaded) {
                        return Column(
                          children: [
                            const PlantInfoCardSlider(questions: []),
                            Gap(24.h),
                            PlantCategoryGrid(categories: state.categories),
                            Gap(20.h),
                          ],
                        );
                      }

                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(context.l10n.dataLoading),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
