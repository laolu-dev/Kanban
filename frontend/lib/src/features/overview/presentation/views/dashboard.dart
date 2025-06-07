import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:kanban/core/constants/constants.dart';
import 'package:kanban/src/features/overview/presentation/widgets/dashboard_metric.dart';
import 'package:kanban/src/shared/data_widget.dart';

@RoutePage()
class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      spacing: 22,
      runSpacing: 22,
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.end,

      children: [
        DataWidget(
          title: "Sales Overview",
          content: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: useSpaceOf16),
            child: Row(
              children: [
                DashboardMetric(
                  icon: Iconsax.chart_21_outline,
                  name: "Sales",
                  value: "200",
                  showDivider: true,
                  useSecondForm: true,
                ),
                DashboardMetric(
                  icon: Iconsax.chart_21_outline,
                  name: "Sales",
                  value: "200",
                ),
                DashboardMetric(
                  icon: Iconsax.chart_21_outline,
                  name: "Sales",
                  value: "200",
                ),
                DashboardMetric(
                  icon: Iconsax.chart_21_outline,
                  name: "Sales",
                  value: "200",
                ),
              ],
            ),
          ),
        ),
        DataWidget(
          title: "Inventory Summary",
        ),
        DataWidget(
          title: "Purchase Overview",
        ),
        DataWidget(
          title: "Product Summary",
        ),
      ],
    );
  }
}
