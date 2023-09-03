import 'package:agent_repository/agent_repository.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:carnal/utils/platform_util.dart';
import 'package:carnal/utils/shortcut_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:profiles_repository/profiles_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:carnal/utils/logger.dart';
import 'package:carnal/app/app.dart';
import 'package:carnal/theme.dart';
import 'package:protocol_handler/protocol_handler.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:window_manager/window_manager.dart';

class App extends StatelessWidget {
  final AuthenticationRepository _authenticationRepository;
  final ProfilesRepository _profilesRepository;
  final AgentRepository _agentRepository;
  final AppRouter _appRouter;

  const App({
    Key? key,
    required AuthenticationRepository authenticationRepository,
    required ProfilesRepository profilesRepository,
    required AgentRepository agentRepository,
    required AppRouter appRouter,
  })  : _authenticationRepository = authenticationRepository,
        _profilesRepository = profilesRepository,
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
        RepositoryProvider<ProfilesRepository>(
            create: (context) => _profilesRepository),
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
        child: Builder(builder: (context) {
          final bloc = BlocProvider.of<AppBloc>(context);
          return AppView(bloc: bloc);
        }),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  final AppBloc bloc;
  const AppView({Key? key, required this.bloc}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    protocolHandler.addListener(widget.bloc);
    ShortcutService.instance.setListener(widget.bloc);
    trayManager.addListener(widget.bloc);
    windowManager.addListener(widget.bloc);
    widget.bloc.startServices();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    protocolHandler.removeListener(widget.bloc);
    ShortcutService.instance.setListener(null);
    trayManager.removeListener(widget.bloc);
    windowManager.removeListener(widget.bloc);
    widget.bloc.stopServices();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    context.read<AppBloc>().add(AppLifecycleChanged(state));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AppBloc>(context);
    final botToastBuilder = BotToastInit();
    final router = RepositoryProvider.of<AppRouter>(context).router;

    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: router,
          title: 'Carnal App',
          theme: FlexThemeData.light(scheme: FlexScheme.deepPurple),
          darkTheme: FlexThemeData.dark(scheme: FlexScheme.deepPurple),
          themeMode: ThemeMode.system,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          builder: (context, child) {
            if (kIsLinux || kIsWindows) {
              child = Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(7),
                      topRight: Radius.circular(7),
                    ),
                    child: child,
                  ),
                  const DragToMoveArea(
                    child: SizedBox(
                      width: double.infinity,
                      height: 34,
                    ),
                  ),
                ],
              );
            }
            child = botToastBuilder(context, child);
            return child;
          },
        );
      },
    );
  }
}
