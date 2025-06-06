import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kanban/config/gen/assets.gen.dart';
import 'package:kanban/core/utils/extensions.dart';
import 'package:kanban/src/features/authentication/presentation/widgets/login_form.dart';

@RoutePage()
class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 160.0.h, horizontal: 220.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppAssets.icons.kanbanLogo.svg(),
              Spacer(),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
