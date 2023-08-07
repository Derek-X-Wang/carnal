import 'dart:io';
import 'package:flutter/material.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  final Directory dir = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: dir);
  Bloc.observer = AppBlocObserver();
  Bloc.transformer = sequential<dynamic>();
  final authenticationRepository = AuthenticationRepository();
  // var user = await authenticationRepository.user.first;
  // if (user.isEmpty) {
  //   await authenticationRepository.logInAnonymously();
  //   user = await authenticationRepository.user.first;
  // }
  // print("on start user ${user.isEmpty} $user");
  final router = AppRouter();
  runApp(App(
      authenticationRepository: authenticationRepository, appRouter: router));
}
