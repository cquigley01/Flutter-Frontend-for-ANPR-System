import '/utils/theme.dart';
import '/utils/util.dart';
import 'package:flutter/material.dart';
import 'topup_amount_widget_model.dart';
export 'topup_amount_widget_model.dart';

class TopupAmountWidgetWidget extends StatefulWidget {
  const TopupAmountWidgetWidget({
    super.key,
    required this.amount,
  });

  final int? amount;

  @override
  State<TopupAmountWidgetWidget> createState() =>
      _TopupAmountWidgetWidgetState();
}

class _TopupAmountWidgetWidgetState extends State<TopupAmountWidgetWidget> {
  late TopupAmountWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopupAmountWidgetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RichText(
            textScaler: MediaQuery.of(context).textScaler,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '€',
                  style: FFTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FFTheme.of(context).primaryText,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                TextSpan(
                  text: valueOrDefault<String>(
                    widget.amount?.toString(),
                    'null',
                  ),
                  style: TextStyle(
                    color: FFTheme.of(context).primaryText,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                )
              ],
              style: FFTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    fontSize: 18.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
