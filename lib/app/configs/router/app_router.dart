import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sawargi/app/views/dashboard/dashboard_page.dart';
import 'package:sawargi/app/views/login/login_page.dart';
import 'package:sawargi/app/views/register/register_page.dart';

class AppRouter {
  static Page _loginPageRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) => MaterialPage(child: const LoginPage());

  static Page _registerPageRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) => MaterialPage(child: const RegisterPage());

  static Page _dashboardPageRouteBuilder(
    BuildContext context,
    GoRouterState state,
  ) => MaterialPage(child: const DashboardPage());

  static final _route = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: LoginPage.routeName,
    routes: [
      GoRoute(
        path: LoginPage.routeName,
        name: LoginPage.routeName,
        pageBuilder: _loginPageRouteBuilder,
      ),
      GoRoute(
        path: RegisterPage.routeName,
        name: RegisterPage.routeName,
        pageBuilder: _registerPageRouteBuilder,
      ),
      GoRoute(
        path: DashboardPage.routeName,
        name: DashboardPage.routeName,
        pageBuilder: _dashboardPageRouteBuilder,
      ),
    ],
  );

  static GoRouter get router => _route;
}
