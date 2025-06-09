import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:kanban/src/features/overview/presentation/widgets/dashboard_metric.dart';
import 'package:kanban/src/shared/data_widget.dart';

@RoutePage()
class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      spacing: 24,
      runSpacing: 24,
      direction: Axis.horizontal,
      children: [
        DataWidget(
          title: "Sales Overview",
          children: [
            DashboardMetric(
              icon: Iconsax.chart_21_outline,
              name: "Sales",
              value: "200",
            ),
            DashboardMetric(
              icon: Iconsax.chart_21_outline,
              name: "Revenue",
              value: "200",
            ),
            DashboardMetric(
              icon: Iconsax.chart_21_outline,
              name: "Profit",
              value: "200",
            ),
            DashboardMetric(
              icon: Iconsax.chart_21_outline,
              name: "Cost",
              value: "200",
              showDivider: false,
            ),
          ],
        ),
        DataWidget(
          title: "Inventory Summary",
          children: [
            DashboardMetric(
              icon: Iconsax.chart_21_outline,
              name: "Sales",
              value: "200",
              useSecondForm: true,
            ),
            DashboardMetric(
              icon: Iconsax.chart_21_outline,
              name: "Revenue",
              value: "200",
              useSecondForm: true,
              showDivider: false,
            ),
          ],
        ),
        DataWidget(
          title: "Purchase Overview",
          children: [
            DashboardMetric(
              icon: Iconsax.chart_21_outline,
              name: "Sales",
              value: "200",
            ),
            DashboardMetric(
              icon: Iconsax.chart_21_outline,
              name: "Revenue",
              value: "200",
            ),
            DashboardMetric(
              icon: Iconsax.chart_21_outline,
              name: "Profit",
              value: "200",
            ),
            DashboardMetric(
              icon: Iconsax.chart_21_outline,
              name: "Cost",
              value: "200",
              showDivider: false,
            ),
          ],
        ),
        DataWidget(
          title: "Product Summary",
          children: [
            DashboardMetric(
              icon: Iconsax.chart_21_outline,
              name: "Sales",
              value: "200",
              useSecondForm: true,
            ),
            DashboardMetric(
              icon: Iconsax.chart_21_outline,
              name: "Revenue",
              value: "200",
              useSecondForm: true,
              showDivider: false,
            ),
          ],
        ),
      ],
    );
  }
}
