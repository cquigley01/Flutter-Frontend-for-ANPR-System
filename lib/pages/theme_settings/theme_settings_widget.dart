import '/utils/theme.dart';
import '/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_settings_model.dart';
export 'theme_settings_model.dart';

class ThemeSettingsWidget extends StatefulWidget {
  const ThemeSettingsWidget({super.key});

  @override
  State<ThemeSettingsWidget> createState() => _ThemeSettingsWidgetState();
}

class _ThemeSettingsWidgetState extends State<ThemeSettingsWidget> {
  late ThemeSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ThemeSettingsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
                    'Theme',
                    style: FFTheme.of(context).headlineMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 30.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Icon(
                    Icons.palette_rounded,
                    color: FFTheme.of(context).primaryText,
                    size: 50.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Mode',
                        style: FFTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FFTheme.of(context).secondaryText,
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: FFTheme.of(context).secondaryBackground,
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          32.0, 16.0, 32.0, 16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setDarkModeSetting(context, ThemeMode.light);
                              setState(() {
                                FFAppState().theme = 'light';
                              });
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            FFAppState().theme == 'light'
                                                ? FFTheme.of(context)
                                                    .primary
                                                : FFTheme.of(context)
                                                    .secondaryBackground,
                                            FFTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              FFAppState().theme == 'light'
                                                  ? FFTheme.of(context)
                                                      .primary
                                                  : FFTheme.of(context)
                                                      .secondaryBackground,
                                              FFTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            width: 2.0,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                          child: Image.asset(
                                            'assets/images/lighttheme.png',
                                            width: 60.0,
                                            height: 100.0,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FFTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          FFAppState().theme == 'light'
                                              ? FFTheme.of(context)
                                                  .primary
                                              : FFTheme.of(context)
                                                  .secondaryBackground,
                                          FFTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 2.0, 10.0, 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Light',
                                            style: FFTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FFTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setDarkModeSetting(context, ThemeMode.dark);
                              setState(() {
                                FFAppState().theme = 'dark';
                              });
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            FFAppState().theme == 'dark'
                                                ? FFTheme.of(context)
                                                    .primary
                                                : FFTheme.of(context)
                                                    .secondaryBackground,
                                            FFTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              FFAppState().theme == 'dark'
                                                  ? FFTheme.of(context)
                                                      .primary
                                                  : FFTheme.of(context)
                                                      .secondaryBackground,
                                              FFTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            width: 2.0,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                          child: Image.asset(
                                            'assets/images/darktheme.png',
                                            width: 60.0,
                                            height: 100.0,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FFTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          FFAppState().theme == 'dark'
                                              ? FFTheme.of(context)
                                                  .primary
                                              : FFTheme.of(context)
                                                  .secondaryBackground,
                                          FFTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 2.0, 10.0, 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Dark',
                                            style: FFTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FFTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setDarkModeSetting(context, ThemeMode.system);
                              setState(() {
                                FFAppState().theme = 'system';
                              });
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 0.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: valueOrDefault<Color>(
                                            FFAppState().theme == 'system'
                                                ? FFTheme.of(context)
                                                    .primary
                                                : FFTheme.of(context)
                                                    .secondaryBackground,
                                            FFTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              FFAppState().theme == 'system'
                                                  ? FFTheme.of(context)
                                                      .primary
                                                  : FFTheme.of(context)
                                                      .secondaryBackground,
                                              FFTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            width: 2.0,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                          child: Image.asset(
                                            'assets/images/combinedtheme.png',
                                            width: 60.0,
                                            height: 100.0,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Material(
                                  color: Colors.transparent,
                                  elevation: 0.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: FFTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(24.0),
                                      border: Border.all(
                                        color: valueOrDefault<Color>(
                                          FFAppState().theme == 'system'
                                              ? FFTheme.of(context)
                                                  .primary
                                              : FFTheme.of(context)
                                                  .secondaryBackground,
                                          FFTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        width: 2.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          10.0, 2.0, 10.0, 2.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'System',
                                            style: FFTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Readex Pro',
                                                  color: FFTheme.of(
                                                          context)
                                                      .primaryText,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
