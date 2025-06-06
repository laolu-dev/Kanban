import 'package:flutter/material.dart';
import 'package:kanban/config/env.dart' show Env;
import 'package:kanban/config/router/router.dart' show KanbanRouter;
import 'package:kanban/config/theme.dart' show theme;

final KanbanRouter _router = KanbanRouter();

class Kanban extends StatelessWidget {
  const Kanban({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: theme,
      routerConfig: _router.config(),
      debugShowCheckedModeBanner: false,
      builder:
          Env.isDev
              ? (context, child) => Stack(children: [child!, _flavorBanner()])
              : null,
    );
  }
}

Widget _flavorBanner() {
  return Banner(
    message: "${Env.flavor}",
    color: Env.color,
    textDirection: TextDirection.ltr,
    location: BannerLocation.topStart,
  );
}
