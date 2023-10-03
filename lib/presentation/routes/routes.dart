import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/application/auth/auth_bloc.dart';
import 'package:test_task/infrastructure/apis/apis.dart';
import 'package:test_task/infrastructure/repositories/auth_repo.dart';
import 'package:test_task/presentation/pages/auth/login_page.dart';
import 'package:test_task/presentation/pages/core/home_control.dart';
import 'package:test_task/presentation/pages/home/home_pages.dart';

import '../../domain/auth/auth_failure.dart';
import '../../infrastructure/services/db_service.dart';
import '../pages/core/app_widget.dart';
import '../pages/core/no_connection.dart';

class AppRoutes {
  static PageRoute getAppWidget(
    DBService dbService,
    bool connectivityResult,
  ) =>
      MaterialPageRoute(
        builder: (_) => AppWidget(
          dbService: dbService,
          connectivityX: connectivityResult,
        ),
      );



  static MaterialPageRoute login(BuildContext context) {
    return MaterialPageRoute(builder: (_) => LoginPage(context: context));
  }

  static MaterialPageRoute getHome(BuildContext context) => MaterialPageRoute(
        builder: (_) => BlocProvider.value(
          value: BlocProvider.of<AuthBloc>(context),
          child: const HomePage(),
        ),
      );


  static MaterialPageRoute getNetworkNotFound() => MaterialPageRoute(
        builder: (_) => const NoConnection(),
      );

  static PageRoute getHomeControl() => MaterialPageRoute(
      builder: (_) => BlocProvider(
            create: (context) => AuthBloc(
              AuthRepository(
                context.read<DBService>(),
                AuthService.create(),
              ),
            )..add(const AuthEvent.checkAuth()),
            child: const HomeControl(),
          ));

  static PageRoute onGenerateRoute({
    required BuildContext context,
    required AuthFailure? authFailure,
    required bool notConnection,
  }) {
    if (notConnection) {
      return getNetworkNotFound();
    } else if (authFailure == null) {
      return getHomeControl();
    } else {
      return getHomeControl();
    }
  }
}
