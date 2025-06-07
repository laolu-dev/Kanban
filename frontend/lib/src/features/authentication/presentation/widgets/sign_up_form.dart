import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:kanban/config/gen/assets.gen.dart';
import 'package:kanban/config/gen/colors.gen.dart';
import 'package:kanban/core/constants/constants.dart';
import 'package:kanban/core/utils/extensions.dart';
import 'package:kanban/src/features/authentication/presentation/widgets/form_text_field.dart';

class SignUpForm extends HookConsumerWidget {
  SignUpForm({super.key});

  final TapGestureRecognizer _login = TapGestureRecognizer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = useTextEditingController();
    final email = useTextEditingController();
    final password = useTextEditingController();

    return Form(
      child: Column(
        children: [
          AppAssets.icons.kanbanLogo.svg(width: 48),
          useSpaceOf24.verticalSpacing,
          Text(
            "Create an account",
            style: context.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          useSpaceOf12.verticalSpacing,
          Text(
            "Start your 30-day free trial.",
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.grey500,
            ),
          ),
          useSpaceOf32.verticalSpacing,
          FormTextField(
            fieldText: "Name*",
            controller: name,
            hintText: "Enter your name",
          ),
          FormTextField(
            fieldText: "Email*",
            controller: email,
            hintText: "Enter your email",
          ),
          FormTextField(
            fieldText: "Password*",
            controller: password,
            hintText: "Create a password",
            isPasswordField: true,
          ),
          FilledButton(
            onPressed: () {},
            child: Text("Get started"),
          ),
          useSpaceOf16.verticalSpacing,
          OutlinedButton.icon(
            onPressed: () {},
            icon: Brand(Brands.google),
            label: Text("Sign up with Google"),
          ),
          useSpaceOf32.verticalSpacing,
          RichText(
            text: TextSpan(
              text: "Already have an acccount? ",
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColors.grey500,
              ),
              children: [
                TextSpan(
                  text: "Log in",
                  recognizer:
                      _login..onTap = () => context.router.popUntilRoot(),
                  style: context.textTheme.bodySmall?.copyWith(
                    color: AppColors.primary700,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
