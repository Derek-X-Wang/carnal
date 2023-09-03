part of 'app_bloc.dart';

extension Services on AppBloc {
  void startServices() async {
    ShortcutService.instance.start();
    await _initTrayIcon();
    await Future.delayed(const Duration(milliseconds: 100));
    WindowOptions windowOptions = const WindowOptions(
      titleBarStyle: TitleBarStyle.hidden,
      windowButtonVisibility: false,
      skipTaskbar: true,
      backgroundColor: Colors.transparent,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      if (kIsMacOS) {
        await windowManager.setVisibleOnAllWorkspaces(
          true,
          visibleOnFullScreen: true,
        );
      }
      if (kIsLinux || kIsWindows) {
        Display primaryDisplay = await screenRetriever.getPrimaryDisplay();
        Size windowSize = await windowManager.getSize();
        _lastShownPosition = Offset(
          primaryDisplay.size.width - windowSize.width - 50,
          50,
        );
        await windowManager.setPosition(_lastShownPosition);
      }
      await Future.delayed(const Duration(milliseconds: 100));
      await _windowShow(
        isShowBelowTray: kIsMacOS,
      );
    });
  }

  void stopServices() async {
    ShortcutService.instance.stop();
  }
}

extension ProtocolHandler on AppBloc {}

extension Shortcut on AppBloc {}

extension TrayManager on AppBloc {
  Future<void> _initTrayIcon() async {
    String trayIconName = platformSelect<String>(
      () => 'tray_icon_black.png',
      windows: () => 'tray_icon_black.ico',
      linux: () => 'tray_icon.ico',
    );
    // if (_brightness == Brightness.dark) {
    //   trayIconName = platformSelect<String>(
    //     () => 'tray_icon.png',
    //     windows: () => 'tray_icon.ico',
    //   );
    // }

    await trayManager.destroy();
    await trayManager.setIcon(
      'assets/images/$trayIconName',
      isTemplate: kIsMacOS ? true : false,
    );
    await Future.delayed(const Duration(milliseconds: 10));
    Menu menu = Menu(
      items: [
        MenuItem(
          label:
              '${"app_name".tr()} v${dotenv.env['APP_VERSION']} (Build ${dotenv.env['APP_BUILD_NUMBER']})',
          disabled: true,
        ),
        MenuItem.separator(),
        if (kIsLinux)
          MenuItem(
            key: kMenuItemKeyShow,
            label: "tray_context_menu_item_show".tr(),
          ),
        MenuItem(
          key: kMenuItemKeyQuickStartGuide,
          label: 'tray_context_menu.item_quick_start_guide'.tr(),
        ),
        MenuItem.submenu(
          label: 'tray_context_menu.item_discussion'.tr(),
          submenu: Menu(
            items: [
              MenuItem(
                key: kMenuSubItemKeyJoinDiscord,
                label:
                    'tray_context_menu.item_discussion_subitem_discord_server'
                        .tr(),
              ),
              MenuItem(
                key: kMenuSubItemKeyJoinQQGroup,
                label:
                    'tray_context_menu.item_discussion_subitem_qq_group'.tr(),
              ),
            ],
          ),
        ),
        MenuItem.separator(),
        MenuItem(
          key: kMenuItemKeyQuitApp,
          label: 'tray_context_menu.item_quit_app'.tr(),
        ),
      ],
    );
    await trayManager.setContextMenu(menu);
  }
}

extension WindowManager on AppBloc {
  Future<void> _windowShow({
    bool isShowBelowTray = false,
  }) async {
    bool isAlwaysOnTop = await windowManager.isAlwaysOnTop();
    Size windowSize = await windowManager.getSize();

    if (kIsLinux) {
      await windowManager.setPosition(_lastShownPosition);
    }

    if (kIsMacOS && isShowBelowTray) {
      Rect? trayIconBounds = await trayManager.getBounds();
      if (trayIconBounds != null) {
        Size trayIconSize = trayIconBounds.size;
        Offset trayIconPosition = trayIconBounds.topLeft;

        Offset newPosition = Offset(
          trayIconPosition.dx - ((windowSize.width - trayIconSize.width) / 2),
          trayIconPosition.dy,
        );

        if (!isAlwaysOnTop) {
          await windowManager.setPosition(newPosition);
        }
      }
    }

    bool isVisible = await windowManager.isVisible();
    if (!isVisible) {
      await windowManager.show();
    } else {
      await windowManager.focus();
    }

    // Linux 下无法激活窗口临时解决方案
    if (kIsLinux && !isAlwaysOnTop) {
      await windowManager.setAlwaysOnTop(true);
      await Future.delayed(const Duration(milliseconds: 10));
      await windowManager.setAlwaysOnTop(false);
      await Future.delayed(const Duration(milliseconds: 10));
      await windowManager.focus();
    }
  }

  Future<void> _windowHide() async {
    await windowManager.hide();
  }
}
