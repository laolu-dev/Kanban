import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:kanban/config/gen/colors.gen.dart';
import 'package:kanban/core/constants/constants.dart';
import 'package:kanban/core/utils/extensions.dart';

class CustomAppBar extends HookConsumerWidget {
  const CustomAppBar({super.key, this.profilePicUrl});

  final String? profilePicUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColoredBox(
      color: AppColors.white,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          horizontal: useSpaceOf32,
          vertical: useSpaceOf28,
        ),
        child: Row(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search product, supplier, order",
                prefixIcon: Icon(
                  Iconsax.search_normal_outline,
                  color: AppColors.grey300,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: useSpaceOf16),
                constraints: BoxConstraints(
                  maxWidth: kSearchTextFieldSize.width,
                  maxHeight: kSearchTextFieldSize.height,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey300),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Iconsax.notification_bing_outline,
                color: AppColors.grey300,
              ),
            ),
            useSpaceOf20.horizontalSpacing,
            AnimatedContainer(
              width: 40,
              height: 40,
              duration: kThemeChangeDuration,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    profilePicUrl != null
                        ? Colors.transparent
                        : AppColors.grey100,
                image:
                    profilePicUrl == null
                        ? null
                        : DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(profilePicUrl!),
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
