import '/backend/backend.dart';
import '/dashwidgets/dashboard_balance_widget/dashboard_balance_widget_widget.dart';
import '/dashwidgets/profile_icon_widget/profile_icon_widget_widget.dart';
import '/utils/util.dart';
import '/regwidgets/non_editable_reg_widget/non_editable_reg_widget_widget.dart';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FFModel<DashboardWidget> {

  final unfocusNode = FocusNode();
  // Stores action output result for query collection in Dashboard widget.
  ParkingsessionsRecord? ifExists;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for DashboardBalanceWidget component.
  late DashboardBalanceWidgetModel dashboardBalanceWidgetModel;
  // Model for NonEditableRegWidget component.
  late NonEditableRegWidgetModel nonEditableRegWidgetModel;
  // Model for ProfileIconWidget component.
  late ProfileIconWidgetModel profileIconWidgetModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    dashboardBalanceWidgetModel =
        createModel(context, () => DashboardBalanceWidgetModel());
    nonEditableRegWidgetModel =
        createModel(context, () => NonEditableRegWidgetModel());
    profileIconWidgetModel =
        createModel(context, () => ProfileIconWidgetModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    dashboardBalanceWidgetModel.dispose();
    nonEditableRegWidgetModel.dispose();
    profileIconWidgetModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
