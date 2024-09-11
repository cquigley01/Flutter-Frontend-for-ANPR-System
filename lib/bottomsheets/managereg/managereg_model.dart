import '/utils/util.dart';
import '/regwidgets/editable_reg_widget/editable_reg_widget_widget.dart';
import 'managereg_widget.dart' show ManageregWidget;
import 'package:flutter/material.dart';

class ManageregModel extends FFModel<ManageregWidget> {
  late EditableRegWidgetModel editableRegWidgetModel;

  @override
  void initState(BuildContext context) {
    editableRegWidgetModel =
        createModel(context, () => EditableRegWidgetModel());
  }

  @override
  void dispose() {
    editableRegWidgetModel.dispose();
  }
}
