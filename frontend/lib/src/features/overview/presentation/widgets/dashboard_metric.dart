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
    this.iconColor,
    this.widgetColor,
    this.showDivider = true,
    this.useSecondForm = false,
  });

  final String name;
  final String value;
  final Color? iconColor;
  final Color? widgetColor;
  final IconData icon;
  final bool showDivider;
  final bool useSecondForm;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: useSpaceOf22,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: widgetColor,
                borderRadius: BorderRadius.circular(4.0.r),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 30.0.r,
              ),
            ),
            if (useSecondForm) ...[
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
            ] else ...[
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
            ],
          ],
        ),

        if (showDivider) ...[
          VerticalDivider(width: 5, thickness: 5, color: AppColors.black),
          useSpaceOf22.horizontalSpacing,
        ],
      ],
    );
  }
}
