import 'package:auto_route/auto_route.dart';
import 'package:kanban/config/router/router.gr.dart';

@AutoRouterConfig()
class KanbanRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      path: "/login",
      page: LoginRoute.page,
    ),
    AutoRoute(
      path: "/create-account-page",
      page: CreateAccountRoute.page,
    ),
    AutoRoute(
      path: "/dashboard",
      page: DashboardRoute.page,
    ),
    AutoRoute(
      path: "/inventory",
      page: InventoryRoute.page,
    ),
    AutoRoute(
      path: "/reports",
      page: ReportsRoute.page,
    ),
    AutoRoute(
      path: "/suppliers",
      page: SuppliersRoute.page,
    ),
    AutoRoute(
      path: "/orders",
      page: OrderRoute.page,
    ),
    AutoRoute(
      path: "/manage-store",
      page: ManageStoreRoute.page,
    ),
  ];
}
