import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:kanban/config/gen/assets.gen.dart';
import 'package:kanban/config/gen/colors.gen.dart';
import 'package:kanban/core/constants/constants.dart';
import 'package:kanban/core/utils/extensions.dart';

class CustomNavigationRail extends HookWidget {
  CustomNavigationRail({super.key, required this.onTabSelected});
  final ValueChanged<String> onTabSelected;

  final Map<String, IconData> _destinations = {
    "Dashboard": Iconsax.home_2_outline,
    "Inventory": Iconsax.shopping_cart_outline,
    "Reports": Iconsax.chart_1_outline,
    "Suppliers": Iconsax.user_outline,
    "Orders": Iconsax.box_1_outline,
    "Manage Store": Iconsax.task_outline,
  };

  @override
  Widget build(BuildContext context) {
    final tabTracker = useState<String>("Dashboard");

    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 40, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: useSpaceOf12),
              child: Row(
                spacing: useSpaceOf12,
                children: [
                  AppAssets.icons.kanbanLogo.svg(width: 48),
                  Text(
                    "KANBAN",
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary500,
                    ),
                  ),
                ],
              ),
            ),
            useSpaceOf32.verticalSpacing,
            ..._destinations.keys.map(
              (label) => _CustomNavigationRailTab(
                tabName: label,
                icon: _destinations[label]!,
                selectedTab: tabTracker.value == label,
                onTap: () {
                  tabTracker.value = label;
                  onTabSelected(label);
                },
              ),
            ),
            Spacer(),
            _CustomNavigationRailTab(
              tabName: "Log out",
              selectedTab: false,
              icon: Iconsax.logout_1_outline,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomNavigationRailTab extends HookWidget {
  const _CustomNavigationRailTab({
    required this.icon,
    required this.tabName,
    required this.selectedTab,
    this.onTap,
  });

  final bool selectedTab;
  final String tabName;
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkResponse(
          onTap: onTap,
          containedInkWell: true,
          highlightShape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: EdgeInsetsGeometry.only(
              top: useSpaceOf16,
              bottom: useSpaceOf16,
              right: useSpaceOf32,
              left: useSpaceOf16,
            ),
            child: Row(
              spacing: useSpaceOf16,
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: selectedTab ? AppColors.primary500 : AppColors.grey600,
                ),
                Text(
                  tabName,
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color:
                        selectedTab ? AppColors.primary500 : AppColors.grey600,
                  ),
                ),
              ],
            ),
          ),
        ),
        useSpaceOf12.verticalSpacing,
      ],
    );
  }
}
