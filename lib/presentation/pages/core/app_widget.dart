import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:test_task/domain/common/token_ext.dart';

import '../../../infrastructure/services/db_service.dart';
import '../../routes/routes.dart';
import '../../styles/theme.dart';

class AppWidget extends StatelessWidget {
  final DBService dbService;
  final bool connectivityX;

  const AppWidget({
    Key? key,
    required this.dbService,
    required this.connectivityX,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => GridTheme.create(dbService),
        builder: (BuildContext context, _) {
          return RepositoryProvider(
            // create: (BuildContext context) =>
            //     RepositoryProvider(create: (_) => dbService),
            create: (BuildContext context) => dbService,
            child: Builder(builder: (context) {
              return CupertinoApp(
                  debugShowCheckedModeBanner: false,
                  builder: EasyLoading.init(),
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(
                        context: context,
                        authFailure: dbService.token.hasFailure,
                        notConnection: !connectivityX,
                      ));
            }),
          );
        });
  }
}
