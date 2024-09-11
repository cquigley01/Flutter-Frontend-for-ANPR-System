import '/components/t_t_w_widget_widget.dart';
import '/utils/theme.dart';
import '/utils/util.dart';
import 'package:flutter/material.dart';
import 'analytics_widgets_page_model.dart';
export 'analytics_widgets_page_model.dart';

class AnalyticsWidgetsPageWidget extends StatefulWidget {
  const AnalyticsWidgetsPageWidget({super.key});

  @override
  State<AnalyticsWidgetsPageWidget> createState() =>
      _AnalyticsWidgetsPageWidgetState();
}

class _AnalyticsWidgetsPageWidgetState
    extends State<AnalyticsWidgetsPageWidget> {
  late AnalyticsWidgetsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnalyticsWidgetsPageModel());

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
      backgroundColor: FFTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FFTheme.of(context).primaryBackground,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Analytics widgets',
                    style: FFTheme.of(context).headlineMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 30.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Icon(
                    Icons.ssid_chart,
                    color: FFTheme.of(context).primary,
                    size: 50.0,
                  ),
                ],
              ),
            ),
            wrapWithModel(
              model: _model.tTWWidgetModel,
              updateCallback: () => setState(() {}),
              child: const TTWWidgetWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
