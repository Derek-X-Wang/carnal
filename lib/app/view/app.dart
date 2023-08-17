import 'package:agent_repository/agent_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:profiles_repository/profiles_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:carnal/utils/logger.dart';
import 'package:carnal/app/app.dart';
import 'package:carnal/theme.dart';

class App extends StatelessWidget {
  final AuthenticationRepository _authenticationRepository;
  final AgentRepository _agentRepository;
  final AppRouter _appRouter;

  const App({
    Key? key,
    required AuthenticationRepository authenticationRepository,
    required AgentRepository agentRepository,
    required AppRouter appRouter,
  })  : _authenticationRepository = authenticationRepository,
        _agentRepository = agentRepository,
        _appRouter = appRouter,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    logger.i("Building App");
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
            create: (context) => _authenticationRepository),
        RepositoryProvider<AgentRepository>(
            create: (context) => _agentRepository),
        RepositoryProvider<AppRouter>(create: (context) => _appRouter),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            create: (BuildContext context) => AppBloc(
              authenticationRepository: _authenticationRepository,
            ),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    context.read<AppBloc>().add(AppLifecycleChanged(state));
  }

  @override
  Widget build(BuildContext context) {
    final router = RepositoryProvider.of<AppRouter>(context).router;
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return MaterialApp.router(
          routerConfig: router,
          title: 'Carnal App',
        );
      },
    );
  }
}
