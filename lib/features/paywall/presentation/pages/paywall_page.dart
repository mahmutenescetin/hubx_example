import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hubx_example/core/router/app_router.dart';
import 'package:hubx_example/core/utils/extensions/context_extensions.dart';
import 'package:hubx_example/features/paywall/domain/enums/paywall_plan.dart';
import 'package:hubx_example/features/paywall/presentation/bloc/patwall_cubit.dart';
import 'package:hubx_example/features/paywall/presentation/widgets/feature_slider.dart';
import 'package:hubx_example/features/paywall/presentation/widgets/subscription_option_card.dart';
import 'package:hubx_example/gen/assets.gen.dart';
import 'package:hubx_example/shared/widgets/reusable_evaleted_button.dart';
import 'package:hubx_example/shared/widgets/reusable_text.dart';
import 'package:hubx_example/shared/widgets/spannable.dart';

@RoutePage()
class PaywallPage extends StatelessWidget {
  const PaywallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PaywallCubit(),
      child: Scaffold(
        backgroundColor: context.colors.appColors.black,
        body: SingleChildScrollView(
          child: SizedBox(
            width: context.width,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: context.height * 0.6,
                    child: Image.asset(
                      Assets.png.plant.path,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: context.height * 0.6 - 1,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(15, 29, 23, 1),
                          Colors.black,
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: context.padding.top + 16,
                  right: 16,
                  child: GestureDetector(
                    onTap: () => context.router.replace(const HomeRoute()),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.4),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        Icons.close,
                        color: context.colors.appColors.white,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.32),
                          Spannable(
                            context.l10n.plantAppPremium,
                            textStyle:
                                context.textStyles.b28SemiBold300.copyWith(
                              color: context.colors.appColors.white,
                            ),
                            linkStyle:
                                context.textStyles.b28SemiBold800.copyWith(
                              color: context.colors.appColors.white,
                            ),
                          ),
                          ReusableText(
                            context.l10n.accessAllFeatures,
                            style: context.textStyles.b17Regular300.copyWith(
                              color: const Color.fromRGBO(255, 255, 255, 0.7),
                            ),
                          ),
                          Gap(24.h),
                          const FeatureSlider(),
                          Gap(24.h),
                          BlocBuilder<PaywallCubit, PaywallState>(
                            builder: (context, state) {
                              return Column(
                                children: [
                                  SubscriptionOptionCard(
                                    selected: state.selectedPlan ==
                                        PaywallPlan.monthly,
                                    title: '1 ${context.l10n.month}',
                                    subtitle: context
                                        .l10n.subscription_monthly_auto_renew,
                                    onTap: () => context
                                        .read<PaywallCubit>()
                                        .selectPlan(PaywallPlan.monthly),
                                  ),
                                  Gap(15.h),
                                  SubscriptionOptionCard(
                                    selected: state.selectedPlan ==
                                        PaywallPlan.yearly,
                                    title: '1 ${context.l10n.year}',
                                    subtitle: context.l10n
                                        .subscription_trial_then_yearly_price,
                                    badgeText: '${context.l10n.save} 50%',
                                    onTap: () => context
                                        .read<PaywallCubit>()
                                        .selectPlan(PaywallPlan.yearly),
                                  ),
                                  Gap(24.h),
                                  ReusableElevatedButton(
                                    text: context.l10n.trial_try_free,
                                    onPressed: () {
                                      context.router.replace(
                                        const HomeRoute(),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                      Gap(10.h),
                      Column(
                        children: [
                          ReusableText(
                            context.l10n.trial_description,
                            style: context.textStyles.b9Regular300.copyWith(
                              color: context.colors.appColors.white
                                  .withValues(alpha: 0.52),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Gap(8.h),
                          ReusableText(
                            '${context.l10n.terms}  •  ${context.l10n.privacy}'
                            '  •  ${context.l10n.restore} ',
                            style: context.textStyles.b11Regular400.copyWith(
                              color: context.colors.appColors.white
                                  .withValues(alpha: 0.52),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      Gap(20.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
