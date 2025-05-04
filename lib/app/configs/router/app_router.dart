// import 'package:flutter/cupertino.dart';
// import 'package:go_router/go_router.dart';
// import 'package:sawargi/app/views/dashboard/dashboard_page.dart';
// import 'package:sawargi/app/views/login/login_page.dart';
// import 'package:sawargi/app/views/register/register_page.dart';
// import 'package:sawargi/app/views/splash/splash_page.dart';

// class AppRouter {
//   static Page _splashPageRouteBuilder(
//     BuildContext context,
//     GoRouterState state,
//   ) => CupertinoPage(child: const SplashPage());

//   static Page _loginPageRouteBuilder(
//     BuildContext context,
//     GoRouterState state,
//   ) => CupertinoPage(child: const LoginPage());

//   static Page _registerPageRouteBuilder(
//     BuildContext context,
//     GoRouterState state,
//   ) => CupertinoPage(child: const RegisterPage());

//   static Page _dashboardPageRouteBuilder(
//     BuildContext context,
//     GoRouterState state,
//   ) => CupertinoPage(child: const DashboardPage());

//   static final _route = GoRouter(
//     debugLogDiagnostics: true,
//     initialLocation: SplashPage.routeName,
//     routes: [
//       GoRoute(
//         path: SplashPage.routeName,
//         name: SplashPage.routeName,
//         pageBuilder: _splashPageRouteBuilder,
//       ),
//       GoRoute(
//         path: LoginPage.routeName,
//         name: LoginPage.routeName,
//         pageBuilder: _loginPageRouteBuilder,
//       ),
//       GoRoute(
//         path: RegisterPage.routeName,
//         name: RegisterPage.routeName,
//         pageBuilder: _registerPageRouteBuilder,
//       ),
//       GoRoute(
//         path: DashboardPage.routeName,
//         name: DashboardPage.routeName,
//         pageBuilder: _dashboardPageRouteBuilder,
//       ),
//     ],
//   );

//   static GoRouter get router => _route;
// }

import 'package:flutter/widgets.dart';
import 'package:sawargi/app/configs/router/pagetransition_builder.dart';
import 'package:sawargi/app/views/login/login_page.dart';
import 'package:sawargi/app/views/register/register_page.dart';
import 'package:sawargi/app/views/splash/splash_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(
    BuildContext context,
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case SplashPage.routeName:
        return pageTransitionBuilder(
          context,
          settings,
          child: const SplashPage(),
        );
      case LoginPage.routeName:
        return pageTransitionBuilder(
          context,
          settings,
          child: const LoginPage(),
        );
      case RegisterPage.routeName:
        return pageTransitionBuilder(
          context,
          settings,
          child: const RegisterPage(),
        );
      default:
        return pageTransitionBuilder(
          context,
          settings,
          child: const Placeholder(),
        );
    }
  }
}
