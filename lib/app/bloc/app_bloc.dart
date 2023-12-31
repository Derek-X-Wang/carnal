import 'dart:async';
import 'dart:io';

import 'package:carnal/utils/platform_util.dart';
import 'package:carnal/utils/shortcut_service.dart';
import 'package:carnal/utils/tree/watcher.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:profiles_repository/profiles_repository.dart';
import 'package:protocol_handler/protocol_handler.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:watcher/watcher.dart';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:carnal/utils/path.dart';
import 'package:window_manager/window_manager.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_service.dart';
part 'app_bloc.g.dart';

const kMenuItemKeyShow = 'show';
const kMenuItemKeyQuickStartGuide = 'quick-start-guide';
const kMenuItemKeyQuitApp = 'quit-app';

const kMenuSubItemKeyJoinDiscord = 'subitem-join-discord';
const kMenuSubItemKeyJoinQQGroup = 'subitem-join-qq';

class AppBloc extends HydratedBloc<AppEvent, AppState>
    with
        TrayListener,
        WindowListener,
        ProtocolListener,
        ShortcutListener,
        WidgetsBindingObserver {
  final AuthenticationRepository _authenticationRepository;
  // late final StreamSubscription<User> _userSubscription;
  // final Map<String, Watcher> _watchers = {};
  // final Map<String, StreamSubscription> _watcherSubscriptions = {};
  final FocusNode focusNode = FocusNode();
  Offset _lastShownPosition = Offset.zero;
  // void _onUserChanged(User user) => add(AppUserChanged(user));

  AppBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(
          const AppState(),
        ) {
    // on<AppUserChanged>(_mapUserChanged);
    // on<AppLogoutRequested>(
    //     (event, emit) => unawaited(_authenticationRepository.logOut()));
    on<AppLifecycleChanged>(_mapLifecycleChanged);

    // _userSubscription = _authenticationRepository.user.listen(_onUserChanged);
    // recreate watcher and subscriptions for each item
    // _syncWatcherItems(state.items);
  }

  @override
  Future<void> close() {
    // for (final subscription in _watcherSubscriptions.values) {
    //   subscription.cancel();
    // }
    // _userSubscription.cancel();
    return super.close();
  }

  @override
  AppState fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);

  @override
  Map<String, dynamic> toJson(AppState state) => _$AppStateToJson(state);

  @override
  void onProtocolUrlReceived(String url) async {
    Uri uri = Uri.parse(url);
    if (uri.scheme != 'carnal') return;

    // if (uri.authority == 'translate') {
    //   if (_text.isNotEmpty) _handleButtonTappedClear();
    //   String? text = uri.queryParameters['text'];
    //   if (text != null && text.isNotEmpty) {
    //     _handleTextChanged(text, isRequery: true);
    //   }
    // }
    await _windowShow();
  }

  @override
  void onShortcutKeyDownShowOrHide() async {
    bool isVisible = await windowManager.isVisible();
    if (isVisible) {
      _windowHide();
    } else {
      _windowShow();
    }
  }

  @override
  void onShortcutKeyDownHide() async {
    _windowHide();
  }

  @override
  void onShortcutKeyDownExtractFromScreenSelection() {}

  @override
  void onShortcutKeyDownExtractFromScreenCapture() {}

  @override
  void onShortcutKeyDownExtractFromClipboard() {}

  @override
  void onShortcutKeyDownSubmitWithMateEnter() {}

  @override
  void onShortcutKeyDownTranslateInputContent() async {}

  @override
  void onTrayIconMouseDown() async {
    final isVisible = await windowManager.isVisible();
    if (isVisible) {
      _windowHide();
    } else {
      _windowShow(isShowBelowTray: true);
    }
  }

  @override
  void onTrayIconRightMouseDown() {
    trayManager.popUpContextMenu();
  }

  @override
  void onTrayMenuItemClick(MenuItem menuItem) async {
    switch (menuItem.key) {
      case kMenuItemKeyShow:
        await Future.delayed(Duration(milliseconds: 300));
        await _windowShow();
        break;
      case kMenuItemKeyQuickStartGuide:
        await launchUrlString('https://carnal.derekxwang.com');
        break;
      case kMenuSubItemKeyJoinDiscord:
        await launchUrlString('https://discord.gg/F5ZRWrwy');
        break;
      case kMenuSubItemKeyJoinQQGroup:
        await launchUrlString('https://jq.qq.com/?_wv=1027&k=vYQ5jW7y');
        break;
      case kMenuItemKeyQuitApp:
        await trayManager.destroy();
        exit(0);
    }
  }

  @override
  void onWindowFocus() async {
    focusNode.requestFocus();
  }

  @override
  void onWindowBlur() async {
    focusNode.unfocus();
    bool isAlwaysOnTop = await windowManager.isAlwaysOnTop();
    if (!isAlwaysOnTop) {
      windowManager.hide();
    }
  }

  @override
  void onWindowMove() async {
    _lastShownPosition = await windowManager.getPosition();
  }
}

extension AppEvents on AppBloc {
  // Future<void> _mapUserChanged(
  //     AppUserChanged event, Emitter<AppState> emit) async {
  //   // if (event.user.isNotEmpty) {
  //   //   if (event.user.isAnonymous) {
  //   //     emit(AppState.anonymous(event.user));
  //   //   } else {
  //   //     emit(AppState.authenticated(event.user));
  //   //   }
  //   // } else {
  //   //   /// AppState.unauthenticated is not used
  //   //   /// login to a new anonymous user when the current user is logged out
  //   //   /// _mapUserChangedToState will be triggered again after logInAnonymously
  //   //   await _authenticationRepository.logInAnonymously();
  //   //   emit(state);
  //   // }
  // }

  Future<void> _mapLifecycleChanged(
      AppLifecycleChanged event, Emitter<AppState> emit) async {
    switch (event.state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }
}

extension Helpers on AppBloc {
  // List<WatcherItem> _syncWatcherItems(List<WatcherItem> watcherItems) {
  //   final items = watcherItems.where((e) => isLocalPathSync(e.src)).toList();

  //   // Remove watchers and subscriptions for items no longer being watched
  //   final currentKeys = _watchers.keys.toList();
  //   for (final key in currentKeys) {
  //     if (items.every((item) => item.src != key)) {
  //       _watcherSubscriptions[key]?.cancel();
  //       _watchers.remove(key);
  //       _watcherSubscriptions.remove(key);
  //     }
  //   }

  //   // Update existing watchers if necessary

  //   // Create new watchers and subscriptions for items not yet being watched
  //   for (final item in items) {
  //     if (!_watchers.containsKey(item.src)) {
  //       final watcher = Watcher(item.src);
  //       final subscription = watcher.events.listen((event) {
  //         add(WatchFileChanged(item, event));
  //       });
  //       _watchers[item.src] = watcher;
  //       _watcherSubscriptions[item.src] = subscription;
  //     }
  //   }

  //   return items;
  // }
}
