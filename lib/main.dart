import 'dart:io';
import 'package:agent_repository/agent_repository.dart';
import 'package:carnal/app/app.dart';
import 'package:carnal/utils/language_util.dart';
import 'package:carnal/utils/platform_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:launch_at_startup/launch_at_startup.dart';
import 'package:local_storage/local_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:profiles_repository/profiles_repository.dart';
import 'package:protocol_handler/protocol_handler.dart';
import 'package:window_manager/window_manager.dart';

Future<void> _initEnv() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  await dotenv.load(fileName: ".env", mergeWith: {
    "APP_BUILD_NUMBER": packageInfo.buildNumber,
    "APP_VERSION": packageInfo.version
  });
}

Future<void> _initDatabase() async {
  await Hive.initFlutter();
  final Directory dir = await getApplicationDocumentsDirectory();
  await LocalStorage.build(storageDirectory: dir);
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: dir);
}

Future<void> _ensureInitialized() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  if (kIsLinux || kIsMacOS || kIsWindows) {
    await windowManager.ensureInitialized();
  }

  // if (kIsMacOS || kIsWindows) {
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   LaunchAtStartup.instance.setup(
  //     appName: packageInfo.appName,
  //     appPath: Platform.resolvedExecutable,
  //   );
  //   await protocolHandler.register('carnal');
  // }

  await _initEnv();
  await _initDatabase();
}

void main() async {
  FlutterError.onError = (FlutterErrorDetails details) {
    print(details);
  };
  await _ensureInitialized();
  Bloc.observer = AppBlocObserver();
  Bloc.transformer = sequential<dynamic>();
  final authenticationRepository = AuthenticationRepository();
  var user = await authenticationRepository.user.first;
  // if (user.isEmpty) {
  //   await authenticationRepository.logInAnonymously();
  //   user = await authenticationRepository.user.first;
  // }
  print("on start user ${user.isEmpty} $user");
  final profilesRepository = LocalProfilesRepository();
  final agentRepository = AgentRepository();
  final router = AppRouter();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale(kLanguageEN),
        Locale(kLanguageZH),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale(kLanguageEN),
      child: App(
          authenticationRepository: authenticationRepository,
          profilesRepository: profilesRepository,
          agentRepository: agentRepository,
          appRouter: router),
    ),
  );
}
