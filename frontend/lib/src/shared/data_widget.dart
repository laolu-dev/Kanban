import 'package:flutter/material.dart';
import 'package:kanban/config/gen/colors.gen.dart';
import 'package:kanban/core/constants/constants.dart';
import 'package:kanban/core/utils/extensions.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
    this.padding,
    this.children,
    this.titleTrailingWidget,
    required this.title,
  });

  final String title;
  final EdgeInsetsGeometry? padding;
  final Widget? titleTrailingWidget;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: context.screenHeight * .2),

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(
              left: useSpaceOf16,
              right: useSpaceOf16,
              top: useSpaceOf20,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
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

          if (children != null)
            Padding(
              padding:
                  padding ??
                  EdgeInsets.only(
                    left: useSpaceOf16,
                    right: useSpaceOf16,
                    bottom: useSpaceOf24,
                  ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: children!,
              ),
            ),
        ],
      ),
    );
  }
}
