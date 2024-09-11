import '/auth/firebase_auth/auth_util.dart';
import '/utils/theme.dart';
import '/utils/util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dashboard_balance_widget_model.dart';
export 'dashboard_balance_widget_model.dart';

class DashboardBalanceWidgetWidget extends StatefulWidget {
  const DashboardBalanceWidgetWidget({super.key});

  @override
  State<DashboardBalanceWidgetWidget> createState() =>
      _DashboardBalanceWidgetWidgetState();
}

class _DashboardBalanceWidgetWidgetState
    extends State<DashboardBalanceWidgetWidget> {
  late DashboardBalanceWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardBalanceWidgetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Balance · EUR',
              style: FFTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: Colors.white,
                    fontSize: 14.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            AuthUserStreamWidget(
              builder: (context) => Text(
                valueOrDefault<String>(
                  formatNumber(
                    valueOrDefault(currentUserDocument?.balance, 0),
                    formatType: FormatType.decimal,
                    decimalType: DecimalType.automatic,
                    currency: '€',
                  ),
                  'NULL',
                ),
                style: FFTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                      fontSize: 40.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.0),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 3.0,
                    sigmaY: 3.0,
                  ),
                  child: Container(
                    width: 100.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      color: FFTheme.of(context).transDBBtns,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Manage',
                          style:
                              FFTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
