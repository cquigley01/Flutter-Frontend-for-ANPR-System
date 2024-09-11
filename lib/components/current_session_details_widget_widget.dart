import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/utils/theme.dart';
import '/utils/util.dart';
import '/utils/widgets.dart';
import 'dart:async';
import '/utils/component_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'current_session_details_widget_model.dart';
export 'current_session_details_widget_model.dart';

class CurrentSessionDetailsWidgetWidget extends StatefulWidget {
  const CurrentSessionDetailsWidgetWidget({
    super.key,
    required this.sessiondoc,
  });

  final ParkingsessionsRecord? sessiondoc;

  @override
  State<CurrentSessionDetailsWidgetWidget> createState() =>
      _CurrentSessionDetailsWidgetWidgetState();
}

class _CurrentSessionDetailsWidgetWidgetState
    extends State<CurrentSessionDetailsWidgetWidget> {
  late CurrentSessionDetailsWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CurrentSessionDetailsWidgetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        maxWidth: 570.0,
      ),
      decoration: BoxDecoration(
        color: FFTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
          color: FFTheme.of(context).secondaryBackground,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Total',
                        style:
                            FFTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                      ),
                      Text(
                        formatNumber(
                          functions
                              .getCurrentCharge(widget.sessiondoc!.entryTime!),
                          formatType: FormatType.decimal,
                          decimalType: DecimalType.automatic,
                          currency: '€',
                        ),
                        textAlign: TextAlign.end,
                        style:
                            FFTheme.of(context).displaySmall.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                      ),
                      Text(
                        'Currency: EUR',
                        style: FFTheme.of(context).labelSmall.override(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0.0,
                            ),
                      ),
                    ].divide(const SizedBox(height: 4.0)),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      final paymentResponse = await processStripePayment(
                        context,
                        amount: functions
                            .getCurrentCharge(widget.sessiondoc!.entryTime!)
                            .round(),
                        currency: 'EUR',
                        customerEmail: currentUserEmail,
                        customerName: 'ParkIT',
                        description: 'Parking duration',
                        allowGooglePay: false,
                        allowApplePay: false,
                        buttonColor: FFTheme.of(context).primary,
                        buttonTextColor: Colors.white,
                      );
                      if (paymentResponse.paymentId == null &&
                          paymentResponse.errorMessage != null) {
                        showSnackbar(
                          context,
                          'Error: ${paymentResponse.errorMessage}',
                        );
                      }
                      _model.paymentId = paymentResponse.paymentId ?? '';

                      if (_model.paymentId != null && _model.paymentId != '') {
                        await HistoricalsessionsRecord.collection
                            .doc()
                            .set(createHistoricalsessionsRecordData(
                              sessionID: widget.sessiondoc?.sessionID,
                              regPlate: widget.sessiondoc?.regPlate,
                              entryTime: widget.sessiondoc?.entryTime,
                              cost: functions.getCurrentCharge(
                                  widget.sessiondoc!.entryTime!),
                              paid: true,
                              regimage: widget.sessiondoc?.image,
                            ));
                        unawaited(
                          () async {
                            await widget.sessiondoc!.reference.delete();
                          }(),
                        );
                        context.safePop();
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return WebViewAware(
                              child: AlertDialog(
                                title: const Text('Topup unsuccessful'),
                                content: const Text(
                                    'Payment has failed, If the topup is not successful after retrying please contact your bank.'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: const Text('Ok'),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }

                      setState(() {});
                    },
                    text: 'Pay Now',
                    options: FFButtonOptions(
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FFTheme.of(context).primary,
                      textStyle:
                          FFTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0.0,
                      ),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 2.0,
              thickness: 1.0,
              color: FFTheme.of(context).alternate,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recipient Information',
                          style:
                              FFTheme.of(context).labelMedium.override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ].divide(const SizedBox(height: 4.0)),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Entry\n',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: dateTimeFormat(
                                'd/M h:mm a', widget.sessiondoc!.entryTime!),
                            style:
                                FFTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.5,
                                    ),
                          )
                        ],
                        style:
                            FFTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Exit\n',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: 'Now',
                            style: FFTheme.of(context)
                                .bodyLarge
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FFTheme.of(context).primary,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  lineHeight: 1.5,
                                ),
                          )
                        ],
                        style:
                            FFTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ),
                ].divide(const SizedBox(width: 12.0)),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Session ID\n',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: valueOrDefault<String>(
                              widget.sessiondoc?.sessionID,
                              'NULL',
                            ),
                            style:
                                FFTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.5,
                                    ),
                          )
                        ],
                        style:
                            FFTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'Reg\n',
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: valueOrDefault<String>(
                              widget.sessiondoc?.regPlate,
                              'NULL',
                            ),
                            style:
                                FFTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      lineHeight: 1.5,
                                    ),
                          )
                        ],
                        style:
                            FFTheme.of(context).labelMedium.override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ),
                  ),
                ].divide(const SizedBox(width: 12.0)),
              ),
            ),
          ].divide(const SizedBox(height: 4.0)).addToEnd(const SizedBox(height: 12.0)),
        ),
      ),
    );
  }
}
