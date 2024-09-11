import '/dashwidgets/profile_icon_widget/profile_icon_widget_widget.dart';
import '/utils/util.dart';
import 'settings_widget.dart' show SettingsWidget;
import 'package:flutter/material.dart';

class SettingsModel extends FFModel<SettingsWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for ProfileIconWidget component.
  late ProfileIconWidgetModel profileIconWidgetModel;

  @override
  void initState(BuildContext context) {
    profileIconWidgetModel =
        createModel(context, () => ProfileIconWidgetModel());
  }

  @override
  void dispose() {
    profileIconWidgetModel.dispose();
  }
}
