import '/components/t_t_w_widget_widget.dart';
import '/utils/util.dart';
import 'analytics_widgets_page_widget.dart' show AnalyticsWidgetsPageWidget;
import 'package:flutter/material.dart';

class AnalyticsWidgetsPageModel
    extends FFModel<AnalyticsWidgetsPageWidget> {

  // Model for TTWWidget component.
  late TTWWidgetModel tTWWidgetModel;

  @override
  void initState(BuildContext context) {
    tTWWidgetModel = createModel(context, () => TTWWidgetModel());
  }

  @override
  void dispose() {
    tTWWidgetModel.dispose();
  }
}
