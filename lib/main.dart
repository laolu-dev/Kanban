import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kanban/src/kanban.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(child: Kanban()));
}
