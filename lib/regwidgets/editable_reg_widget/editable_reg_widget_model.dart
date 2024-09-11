import '/utils/util.dart';
import 'editable_reg_widget_widget.dart' show EditableRegWidgetWidget;
import 'package:flutter/material.dart';

class EditableRegWidgetModel extends FFModel<EditableRegWidgetWidget> {

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
