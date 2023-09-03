import 'package:carnal/widgets/custom_button.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ToolbarItemSettings extends StatefulWidget {
  const ToolbarItemSettings({
    Key? key,
    this.onSubPageDismissed,
  }) : super(key: key);

  final VoidCallback? onSubPageDismissed;

  @override
  State<ToolbarItemSettings> createState() => _ToolbarItemSettingsState();
}

class _ToolbarItemSettingsState extends State<ToolbarItemSettings> {
  void _handleDismiss() async {
    await Future.delayed(const Duration(milliseconds: 200));
    // widget.onSubPageDismissed();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildContextButton(context),
        const SizedBox(width: 10),
        _buildSettingsButton(context),
      ],
    );
  }

  Widget _buildContextButton(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: CustomButton(
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.zero,
        child: Icon(
          FluentIcons.brain_circuit_20_regular,
          size: 20,
          color: Theme.of(context).iconTheme.color,
        ),
        onPressed: () {
          context.go('/knowledge');
        },
      ),
    );
  }

  Widget _buildSettingsButton(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: CustomButton(
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.zero,
        child: Icon(
          FluentIcons.settings_20_regular,
          size: 20,
          color: Theme.of(context).iconTheme.color,
        ),
        onPressed: () {
          context.go('/settings');
        },
      ),
    );
  }
}
