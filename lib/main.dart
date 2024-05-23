import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nic_test/home/app_data/appata.dart';
import 'package:nic_test/home/items/add_items.dart';
import 'package:nic_test/home/main_home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppData()),
      ],
      child: const MyApp(),
    ),
  );
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return LandingScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'add_items',
          builder: (BuildContext context, GoRouterState state) {
            return const AddItems();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}
