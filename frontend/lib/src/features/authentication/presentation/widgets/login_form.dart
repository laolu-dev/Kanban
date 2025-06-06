import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:kanban/config/gen/assets.gen.dart';
import 'package:kanban/config/gen/colors.gen.dart';
import 'package:kanban/config/router/router.gr.dart';
import 'package:kanban/core/constants/constants.dart';
import 'package:kanban/core/utils/extensions.dart';
import 'package:kanban/src/features/authentication/presentation/widgets/form_text_field.dart';

class LoginForm extends HookConsumerWidget {
  LoginForm({super.key});

  final TapGestureRecognizer _signUp = TapGestureRecognizer();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = useTextEditingController();
    final password = useTextEditingController();

    return Form(
      child: Column(
        children: [
          AppAssets.icons.kanbanLogo.svg(width: 48),
          useSpaceOf24.verticalSpacing,
          Text(
            "Log in to your account",
            style: context.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          useSpaceOf12.verticalSpacing,
          Text(
            "Welcome back! Please enter your details.",
            style: context.textTheme.bodyMedium?.copyWith(
              color: AppColors.grey500,
            ),
          ),
          useSpaceOf32.verticalSpacing,
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
         
          // Row(
            
          //   children: [
          //     // Checkbox(value: false, onChanged: (value) {}),
          //     Text(
          //       "Remember for 30 days",
          //       style: context.textTheme.bodyMedium?.copyWith(
          //         color: AppColors.grey700,
          //         fontWeight: FontWeight.w500,
          //       ),
          //     ),
          //   ],
          // ),
          useSpaceOf24.verticalSpacing,
          FilledButton(
            onPressed: () {
              context.router.push(DashboardRoute());
            },
            child: Text("Sign in"),
          ),
          useSpaceOf16.verticalSpacing,
          OutlinedButton.icon(
            onPressed: () {},
            icon: Brand(Brands.google),
            label: Text("Sign in with Google"),
          ),
          useSpaceOf32.verticalSpacing,
          RichText(
            text: TextSpan(
              text: "Don't have an account? ",
              style: context.textTheme.bodySmall?.copyWith(
                color: AppColors.grey500,
              ),
              children: [
                TextSpan(
                  text: "Sign up",
                  recognizer:
                      _signUp
                        ..onTap =
                            () => context.router.push(CreateAccountRoute()),
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
