import '/utils/theme.dart';
import '/utils/util.dart';
import 'package:flutter/material.dart';
import 'no_transactions_model.dart';
export 'no_transactions_model.dart';

class NoTransactionsWidget extends StatefulWidget {
  const NoTransactionsWidget({super.key});

  @override
  State<NoTransactionsWidget> createState() => _NoTransactionsWidgetState();
}

class _NoTransactionsWidgetState extends State<NoTransactionsWidget> {
  late NoTransactionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoTransactionsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                child: Text(
                  'No Recent Transactions',
                  style: FFTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
