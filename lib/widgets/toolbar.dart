import 'package:flutter/material.dart';

import 'toolbar_item_always_on_top.dart';
import 'toolbar_item_settings.dart';

PreferredSizeWidget buildToolbar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(34),
    child: Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ToolbarItemAlwaysOnTop(),
          Expanded(child: Container()),
          const ToolbarItemSettings(),
        ],
      ),
    ),
  );
}
