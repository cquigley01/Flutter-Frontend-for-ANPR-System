import '/utils/theme.dart';
import '/utils/util.dart';
import '/utils/web_view.dart';
import 'package:flutter/material.dart';
import 'report_model.dart';
export 'report_model.dart';

class ReportWidget extends StatefulWidget {
  const ReportWidget({super.key});

  @override
  State<ReportWidget> createState() => _ReportWidgetState();
}

class _ReportWidgetState extends State<ReportWidget> {
  late ReportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReportModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FFTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FFTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            context.safePop();
          },
          child: Icon(
            Icons.chevron_left,
            color: FFTheme.of(context).primaryText,
            size: 30.0,
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Report an issue',
                  style: FFTheme.of(context).headlineMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 30.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Icon(
                  Icons.bug_report_outlined,
                  color: FFTheme.of(context).primary,
                  size: 50.0,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FFWebView(
                  content:
                      'https://docs.google.com/forms/d/1yb0-hhzcM-AFlTW6MwmuL1weAYhJbbGEdKAMe9dhFy0/viewform?edit_requested=true',
                  bypass: false,
                  width: 520.0,
                  height: 600.0,
                  verticalScroll: false,
                  horizontalScroll: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
