import '/utils/util.dart';
import 'current_session_details_widget_widget.dart'
    show CurrentSessionDetailsWidgetWidget;
import 'package:flutter/material.dart';

class CurrentSessionDetailsWidgetModel
    extends FFModel<CurrentSessionDetailsWidgetWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Stripe Payment] action in Button widget.
  String? paymentId;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
