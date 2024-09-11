import '/utils/util.dart';
import 'all_sessions_widget.dart' show AllSessionsWidget;
import 'package:flutter/material.dart';

class AllSessionsModel extends FFModel<AllSessionsWidget> {

  bool reversed = false;


  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
