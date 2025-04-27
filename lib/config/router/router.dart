import 'package:auto_route/auto_route.dart';
import 'package:kanban/config/router/router.gr.dart';

@AutoRouterConfig()
class KanbanRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      path: "/create-account",
      page: CreateAccountRoute.page,
    ),
  ];
}
