import '/utils/theme.dart';
import '/utils/util.dart';
import 'package:flutter/material.dart';
import 'no_recent_trips_model.dart';
export 'no_recent_trips_model.dart';

class NoRecentTripsWidget extends StatefulWidget {
  const NoRecentTripsWidget({super.key});

  @override
  State<NoRecentTripsWidget> createState() => _NoRecentTripsWidgetState();
}

class _NoRecentTripsWidgetState extends State<NoRecentTripsWidget> {
  late NoRecentTripsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoRecentTripsModel());

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
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No Recent Trips',
              style: FFTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FFTheme.of(context).secondaryText,
                    letterSpacing: 0.0,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
