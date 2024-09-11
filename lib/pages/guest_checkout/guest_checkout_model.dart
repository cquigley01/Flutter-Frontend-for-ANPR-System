import '/backend/backend.dart';
import '/components/current_session_details_widget_widget.dart';
import '/utils/util.dart';
import 'guest_checkout_widget.dart' show GuestCheckoutWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class GuestCheckoutModel extends FFModel<GuestCheckoutWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  final textFieldMask = MaskTextInputFormatter(mask: '###-A-######');
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for query collection in widget.
  ParkingsessionsRecord? foundSession;
  // Model for CurrentSessionDetailsWidget component.
  late CurrentSessionDetailsWidgetModel currentSessionDetailsWidgetModel;

  @override
  void initState(BuildContext context) {
    currentSessionDetailsWidgetModel =
        createModel(context, () => CurrentSessionDetailsWidgetModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    currentSessionDetailsWidgetModel.dispose();
  }
}
