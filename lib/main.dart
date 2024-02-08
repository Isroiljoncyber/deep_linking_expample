import 'dart:async';

import 'package:deep_linking_expample/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uni_links/uni_links.dart';

void main() => runApp(
      MaterialApp.router(
        routerConfig: router,
      ),
    );

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomeApp(),
      routes: [
        GoRoute(
          path: 'details',
          builder: (_, state) => DetailsScreen(
            detailId: state.uri.queryParameters["id"].toString(),
          ),
        ),
      ],
    ),
  ],
);

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  void initState() {
    super.initState();
    initUniLinks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            GoRouter.of(context).go(
              '/details',
            );
          },
          child: const Text('Go to Details'),
        ),
      ),
    );
  }

  late StreamSubscription _sub;

  Future<void> initUniLinks() async {
    _sub = linkStream.listen((event) {
      if (event != null) {
        var uri = Uri.parse(event);
        print(uri.queryParameters["id"].toString());
      }
    }, onError: (err) {});
  }
}

// https://isroiljoncyber.github.io/deep_linking_expample/
// https://isroiljoncyber.github.io/details
// https://isroiljoncyber.github.io/details?id=12
