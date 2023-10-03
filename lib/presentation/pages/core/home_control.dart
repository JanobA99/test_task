import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task/infrastructure/services/db_service.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../infrastructure/apis/apis.dart';
import '../../../infrastructure/repositories/auth_repo.dart';
import '../../routes/routes.dart';

class HomeControl extends StatelessWidget {
  const HomeControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(
                AuthRepository(
                  context.read<DBService>(),
                  AuthService.create(),
                ),
              )..add(const AuthEvent.checkAuth()),
            ),
          ],
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.proceedToHome) {
                Navigator.push(context, AppRoutes.getHome(context));
              } else {
                Navigator.push(context, AppRoutes.login(context));
              }
            },
            child: const SizedBox(
              child: Center(
                child: Text(""),
              ),
            ),
          ),
        );
      },
    );
  }
}
