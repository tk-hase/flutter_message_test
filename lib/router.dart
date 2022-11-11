import 'package:flutter_message_test/ui/material_banner_test1.dart';
import 'package:flutter_message_test/ui/material_banner_test2.dart';
import 'package:flutter_message_test/ui/snackbar_test1.dart';
import 'package:flutter_message_test/ui/snackbar_test2.dart';
import 'package:go_router/go_router.dart';

import 'ui/home.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(path: 'snackbar_test1', builder: (context, state) => const SnackBarTest1Page()),
        GoRoute(path: 'snackbar_test2', builder: (context, state) => const SnackBarTest2Page()),
        GoRoute(path: 'material_banner_test1', builder: (context, state) => const MaterialBannerTest1()),
        GoRoute(path: 'material_banner_test2', builder: (context, state) => const MaterialBannerTest2()),
      ],
    ),
  ],
);
