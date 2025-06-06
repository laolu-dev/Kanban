import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:kanban/config/gen/colors.gen.dart';
import 'package:kanban/core/constants/constants.dart';
import 'package:kanban/core/utils/extensions.dart';

class FormTextField extends HookWidget {
  const FormTextField({
    super.key,
    required this.fieldText,
    required this.controller,
    this.hintText,
    this.isPasswordField = false,
  });

  final String fieldText;
  final String? hintText;
  final bool isPasswordField;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final hidePassword = useState<bool>(true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldText,
          style: context.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.grey500,
          ),
        ),
        useSpaceOf6.verticalSpacing,
        TextFormField(
          controller: controller,
          obscureText: isPasswordField ? hidePassword.value : false,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon:
                isPasswordField
                    ? IconButton(
                      onPressed: () => hidePassword.value = !hidePassword.value,
                      icon: Icon(
                        hidePassword.value ? OctIcons.eye_closed : OctIcons.eye,
                        color: AppColors.grey300,
                      ),
                    )
                    : null,
          ),
        ),
        useSpaceOf20.verticalSpacing,
      ],
    );
  }
}
