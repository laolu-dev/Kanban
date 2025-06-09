import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:kanban/config/gen/colors.gen.dart';
import 'package:kanban/core/constants/constants.dart';
import 'package:kanban/core/utils/extensions.dart';
import 'package:kanban/src/features/inventory/presentation/views/inventory.dart';
import 'package:kanban/src/features/order/presentation/views/order.dart';
import 'package:kanban/src/features/overview/presentation/views/dashboard.dart';
import 'package:kanban/src/features/overview/presentation/views/manage_store.dart';
import 'package:kanban/src/features/overview/presentation/views/reports.dart';
import 'package:kanban/src/features/suppliers/presentation/views/suppliers.dart';
import 'package:kanban/src/shared/custom_app_bar.dart';
import 'package:kanban/src/shared/custom_nav_rail.dart';

@RoutePage()
class InAppScreen extends HookWidget {
  InAppScreen({super.key});

  final Map<String, Widget> _destinations = {
    "Dashboard": DashboardScreen(),
    "Inventory": InventoryScreen(),
    "Reports": ReportsScreen(),
    "Suppliers": SuppliersScreen(),
    "Orders": OrderScreen(),
    "Manage Store": ManageStoreScreen(),
  };

  @override
  Widget build(BuildContext context) {
    final currentTab = useState<String>("Dashboard");

    return Scaffold(
      backgroundColor: AppColors.grey50,
      body: SafeArea(
        child: Row(
          children: [
            CustomNavigationRail(
              onTabSelected: (value) => currentTab.value = value,
            ),
            VerticalDivider(
              width: 2,
              color: AppColors.grey50,
              radius: BorderRadius.circular(8.0.r),
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomAppBar(),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: useSpaceOf22,
                        horizontal: useSpaceOf32,
                      ),
                      child: _destinations[currentTab.value],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
