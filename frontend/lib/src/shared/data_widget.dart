import 'package:flutter/material.dart';
import 'package:kanban/config/gen/colors.gen.dart';
import 'package:kanban/core/constants/constants.dart';
import 'package:kanban/core/utils/extensions.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
    required this.title,
    this.content,
    this.titleTrailingWidget,
  });

  final String title;
  final Widget? titleTrailingWidget;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        spacing: useSpaceOf22,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: useSpaceOf16,
              vertical: useSpaceOf20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: AppColors.grey800,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (titleTrailingWidget != null) titleTrailingWidget!,
              ],
            ),
          ),

          if (content != null) content!,
        ],
      ),
    );
  }
}
