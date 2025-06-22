import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hubx_example/core/router/app_router.dart';
import 'package:hubx_example/core/utils/extensions/context_extensions.dart';
import 'package:hubx_example/gen/assets.gen.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        DiagnoseRoute(),
        MyGardenRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomAppBar(
          notchMargin: 8.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                context: context,
                imagePath: Assets.png.homeIcon.path,
                label: context.l10n.navBarHome,
                index: 0,
                tabsRouter: tabsRouter,
              ),
              _buildNavItem(
                context: context,
                imagePath: Assets.png.healthcareIcon.path,
                label: context.l10n.navBarDiagnose,
                index: 1,
                tabsRouter: tabsRouter,
              ),
              const SizedBox(width: 40),
              _buildNavItem(
                context: context,
                imagePath: Assets.png.leafIcon.path,
                label: context.l10n.navBarMyGarden,
                index: 2,
                tabsRouter: tabsRouter,
              ),
              _buildNavItem(
                context: context,
                imagePath: Assets.png.profile.path,
                label: context.l10n.navBarProfile,
                index: 3,
                tabsRouter: tabsRouter,
              ),
            ],
          ),
        );
      },
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(40, 175, 110, 0.4),
          ),
          child: Center(
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(44, 204, 128, 1),
              ),
              child: Center(
                child: Image.asset(
                  Assets.png.identifyIcon.path,
                  width: 32,
                  height: 32,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required String imagePath,
    required String label,
    required int index,
    required TabsRouter tabsRouter,
  }) {
    final isSelected = tabsRouter.activeIndex == index;
    final color = isSelected
        ? const Color.fromRGBO(44, 204, 128, 1)
        : context.colors.appColors.secondaryLight;

    return Expanded(
      child: InkWell(
        onTap: () {
          tabsRouter.setActiveIndex(index);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(imagePath, color: color),
            Text(label, style: TextStyle(color: color, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
