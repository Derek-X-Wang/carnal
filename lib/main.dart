import 'dart:io';
import 'package:agent_repository/agent_repository.dart';
import 'package:flutter/material.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:local_storage/local_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:profiles_repository/profiles_repository.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();
  final Directory dir = await getApplicationDocumentsDirectory();
  await LocalStorage.build(storageDirectory: dir);
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: dir);
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
  runApp(App(
      authenticationRepository: authenticationRepository,
      profilesRepository: profilesRepository,
      agentRepository: agentRepository,
      appRouter: router));
}
