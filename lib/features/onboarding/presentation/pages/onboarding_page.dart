import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hubx_example/shared/widgets/reusable_evaleted_button.dart';
import 'package:hubx_example/shared/widgets/reusable_text.dart';
import 'package:hubx_example/shared/widgets/spannable.dart';

@RoutePage()
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spannable(
                'Welcome to %%PlantApp%%',
                linkStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                ),
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 28,
                ),
              ),
              Gap(8.h),
              const ReusableText(
                'Identify more than 3000+ plants and 88% accuracy.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color.fromRGBO(19, 35, 27, 0.7),
                ),
              ),
              Gap(40.h),
              Image.asset('assets/png/get_started.png'),
              ReusableElevatedButton(
                text: 'Get Started',
                onPressed: () {},
              ),
              Gap(16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44.0.w),
                child: const Spannable(
                  align: TextAlign.center,
                  'By tapping next, you are agreeing to PlantID %%Terms of Use%% & %%Privacy Policy%%.',
                  textStyle: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Color.fromRGBO(89, 113, 101, 0.7),
                  ),
                  linkStyle: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Color.fromRGBO(89, 113, 101, 0.7),
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
