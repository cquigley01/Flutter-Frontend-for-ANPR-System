import '/utils/theme.dart';
import '/utils/util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'non_editable_reg_widget_model.dart';
export 'non_editable_reg_widget_model.dart';

class NonEditableRegWidgetWidget extends StatefulWidget {
  const NonEditableRegWidgetWidget({
    super.key,
    this.parameter1,
    String? county,
  }) : county = county ?? 'Unknown';

  final String? parameter1;
  final String county;

  @override
  State<NonEditableRegWidgetWidget> createState() =>
      _NonEditableRegWidgetWidgetState();
}

class _NonEditableRegWidgetWidgetState
    extends State<NonEditableRegWidgetWidget> {
  late NonEditableRegWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NonEditableRegWidgetModel());

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
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              width: 380.0,
              height: 75.0,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 3.0,
                    color: FFTheme.of(context).widgetShadow,
                    offset: const Offset(
                      0.0,
                      1.0,
                    ),
                    spreadRadius: 2.0,
                  )
                ],
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.black,
                  width: 4.0,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 75.0,
                    decoration: BoxDecoration(
                      color: FFTheme.of(context).regPlate,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(4.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 22.0,
                          height: 22.0,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: SvgPicture.asset(
                            'assets/images/European_stars.svg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                2.0, 0.0, 2.0, 0.0),
                            child: Text(
                              'IRL',
                              style: FFTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.county,
                          style:
                              FFTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: const Color(0xFF14181B),
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        Flexible(
                          child: SelectionArea(
                              child: AutoSizeText(
                            valueOrDefault<String>(
                              widget.parameter1,
                              'NULL',
                            ),
                            style: FFTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: 'Bebas Neue',
                                  color: const Color(0xFF14181B),
                                  fontSize: 62.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.normal,
                                  lineHeight: 0.95,
                                ),
                            minFontSize: 53.0,
                          )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
