import 'package:carnal/settings/settings.dart';
import 'package:carnal/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:carnal/widgets/preference_list/preference_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsApiKeysPage extends StatefulWidget {
  const SettingsApiKeysPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsApiKeysPageState();
}

class _SettingsApiKeysPageState extends State<SettingsApiKeysPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildBody(BuildContext context) {
    final bloc = BlocProvider.of<SettingsBloc>(context);
    return PreferenceList(
      children: [
        PreferenceListSection(
          title: Text('page_settings_api_keys.pref_section_title_openai'.tr()),
          children: [
            PreferenceListTextFieldItem(
              controller: bloc.apiKeyController,
              placeholder:
                  'page_settings_api_keys.pref_item_placeholder_openai_key'
                      .tr(),
              obscureText: true,
            ),
          ],
        ),
      ],
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    final bloc = BlocProvider.of<SettingsBloc>(context);
    return CustomAppBar(
      title: Text('page_settings_api_keys.title'.tr()),
      actions: [
        CustomAppBarActionItem(
          text: 'save'.tr(),
          onPressed: () {
            bloc.add(SettingsSaveRequested());
            context.pop();
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }
}
