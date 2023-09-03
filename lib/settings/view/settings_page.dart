import 'dart:io';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:carnal/settings/bloc/settings_bloc.dart';
import 'package:carnal/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:carnal/widgets/preference_list/preference_list.dart';
import 'package:carnal/widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:carnal/app/app.dart';
import 'package:carnal/utils/tree/tree.dart';
import 'package:profiles_repository/profiles_repository.dart';
import 'package:tray_manager/tray_manager.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({
    Key? key,
  }) : super(key: key);

  static Page page() => const MaterialPage<void>(child: SettingsPage());

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SettingsView(),
    );
  }
}

class SettingsView extends StatelessWidget {
  SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SettingsBloc>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.windowResize();
    });
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(context),
        );
      },
    );
  }

  Widget _buildBodyOld(BuildContext context) {
    final bloc = BlocProvider.of<SettingsBloc>(context);
    final scaffoldManager = ScaffoldMessenger.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: bloc.apiKeyController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'API Key',
              hintText: 'Enter your API key here',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: bloc.ignoreFilesController,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
              labelText: 'Ignore Files',
              hintText: 'Enter the files that should be ignored, one per line',
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Save settings here
              final apiKey = bloc.apiKeyController.text;
              final ignoreFiles = bloc.ignoreFilesController.text;
              print('API Key: $apiKey');
              print('Ignore Files: $ignoreFiles');
              bloc.add(SettingsSaveRequested());
              scaffoldManager.showSnackBar(SnackBar(
                content: Text("Successfully saved"),
              ));
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Text('page_settings.title'.tr()),
      leading: CustomAppBarCloseButton(
        onPressed: () {
          context.go('/');
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return PreferenceList(
      children: [
        PreferenceListSection(
          title: Text('page_settings.pref_section_title_llm'.tr()),
          children: [
            PreferenceListItem(
              title: Text('page_settings.pref_item_title_api_keys'.tr()),
              onTap: () {
                context.go('/settings/api-keys');
              },
            ),
            PreferenceListItem(
              title: Text('page_settings.pref_item_title_engines'.tr()),
              onTap: () {
                context.go('/settings/engines');
              },
            ),
          ],
        ),
        // PreferenceListSection(
        //   title: Text('page_settings.pref_section_title_appearance'.tr()),
        //   children: [
        //     PreferenceListItem(
        //       title: Text('page_settings.pref_item_title_app_language'.tr()),
        //       // detailText: Text(getLanguageName(_configuration.appLanguage)),
        //       onTap: () {
        //         // Navigator.of(context).push(
        //         //   MaterialPageRoute(
        //         //     builder: (_) => SettingAppLanguagePage(
        //         //       initialLanguage: _configuration.appLanguage,
        //         //     ),
        //         //   ),
        //         // );
        //       },
        //     ),
        //     PreferenceListItem(
        //       title: Text('page_settings.pref_item_title_theme_mode'.tr()),
        //       // detailText: Text(
        //       //   'theme_mode.${describeEnum(_configuration.themeMode)}'.tr(),
        //       // ),
        //       onTap: () {
        //         // Navigator.of(context).push(
        //         //   MaterialPageRoute(
        //         //     builder: (_) => const SettingThemeModePage(),
        //         //   ),
        //         // );
        //       },
        //     ),
        //   ],
        // ),
        // PreferenceListSection(
        //   title: Text('page_settings.pref_section_title_shortcuts'.tr()),
        //   children: [
        //     PreferenceListItem(
        //       title:
        //           Text('page_settings.pref_item_title_keyboard_shortcuts'.tr()),
        //       onTap: () {
        //         // Navigator.of(context).push(
        //         //   MaterialPageRoute(
        //         //     builder: (_) => const SettingShortcutsPage(),
        //         //   ),
        //         // );
        //       },
        //     ),
        //   ],
        // ),
        // PreferenceListSection(
        //   title: Text(t('pref_section_title_input_settings')),
        //   children: [
        //     PreferenceListRadioItem<String>(
        //       value: kInputSettingSubmitWithEnter,
        //       groupValue: _configuration.inputSetting,
        //       title: Text(t('pref_item_title_submit_with_enter')),
        //       onChanged: (newValue) {
        //         _configuration.inputSetting = newValue;
        //       },
        //     ),
        //     PreferenceListRadioItem<String>(
        //       value: kInputSettingSubmitWithMetaEnter,
        //       groupValue: _configuration.inputSetting,
        //       title: Text(t(kIsMacOS
        //           ? 'pref_item_title_submit_with_meta_enter_mac'
        //           : 'pref_item_title_submit_with_meta_enter')),
        //       onChanged: (newValue) {
        //         _configuration.inputSetting = newValue;
        //       },
        //     ),
        //   ],
        // ),
        // PreferenceListSection(
        //   title: Text(t('pref_section_title_advanced')),
        //   children: [
        //     PreferenceListSwitchItem(
        //       value: _launchAtStartupIsEnabled,
        //       title: Text(t('pref_item_title_launch_at_startup')),
        //       onChanged: (newValue) async {
        //         if (newValue) {
        //           LaunchAtStartup.instance.enable();
        //         } else {
        //           LaunchAtStartup.instance.disable();
        //         }
        //         _launchAtStartupIsEnabled = await launchAtStartup.isEnabled();
        //         setState(() {});
        //       },
        //     ),
        //   ],
        // ),
        PreferenceListSection(
          title: Text('page_settings.pref_section_title_others'.tr()),
          children: [
            PreferenceListItem(
              title: Text('page_settings.pref_item_title_about'.tr()),
              onTap: () async {
                Uri url = Uri.parse('https://github.com/Derek-X-Wang/carnal');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
            ),
          ],
        ),
        PreferenceListSection(
          children: [
            PreferenceListItem(
              title: Container(
                margin: EdgeInsets.zero,
                width: double.infinity,
                child: Text(
                  'page_settings.pref_item_title_exit_app'.tr(),
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
              accessoryView: Container(),
              onTap: () async {
                await trayManager.destroy();
                exit(0);
              },
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 20,
              ),
              child: Text(
                'page_settings.text_version'.tr(args: [
                  '${dotenv.env['APP_VERSION']}',
                  '${dotenv.env['APP_BUILD_NUMBER']}',
                ]),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
