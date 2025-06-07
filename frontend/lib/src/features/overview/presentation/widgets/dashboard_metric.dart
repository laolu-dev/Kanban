import 'package:flutter/material.dart';
import 'package:kanban/config/gen/colors.gen.dart';
import 'package:kanban/core/constants/constants.dart';
import 'package:kanban/core/utils/extensions.dart';

class DashboardMetric extends StatelessWidget {
  const DashboardMetric({
    super.key,
    required this.icon,
    required this.name,
    required this.value,
    this.showDivider = true,
    this.useSecondForm = false,
  });

  final String name;
  final String value;
  final IconData icon;
  final bool showDivider;
  final bool useSecondForm;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: useSpaceOf22,
      children: [
        Column(
          children:
              !useSecondForm
                  ? [
                    Icon(icon),
                    useSpaceOf12.verticalSpacing,
                    Row(
                      spacing: useSpaceOf32,
                      children: [
                        Text(
                          value,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: AppColors.grey600,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          name,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: AppColors.grey500,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ]
                  : [
                    Icon(icon),
                    useSpaceOf8.verticalSpacing,
                    Text(
                      value,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.grey600,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    useSpaceOf2.verticalSpacing,
                    Text(
                      name,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: AppColors.grey500,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
        ),
        if (showDivider) ...[
          VerticalDivider(width: 5, thickness: 5, color: AppColors.grey50),
          useSpaceOf22.horizontalSpacing,
        ],
      ],
    );
  }
}
