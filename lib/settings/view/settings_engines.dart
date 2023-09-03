import 'package:carnal/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:carnal/widgets/preference_list/preference_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class SettingsEnginesPage extends StatefulWidget {
  const SettingsEnginesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingsEnginesPageState();
}

class _SettingsEnginesPageState extends State<SettingsEnginesPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _handleTranslationModeChanged(newValue) {
    // _configuration.translationMode = newValue;
  }

  Widget _buildBody(BuildContext context) {
    return PreferenceList(
      children: [
        PreferenceListSection(
          title:
              Text('page_settings_engines.pref_section_title_default_llm'.tr()),
          children: [
            PreferenceListRadioItem(
              value: "openai",
              groupValue: "openai",
              onChanged: _handleTranslationModeChanged,
              title: Text(
                  'page_settings_engines.pref_item_title_openai_3_turbo'.tr()),
            ),
          ],
        ),
      ],
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Text('page_settings_engines.title'.tr()),
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
