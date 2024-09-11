import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/dashwidgets/topup_amount_widget/topup_amount_widget_widget.dart';
import '/utils/theme.dart';
import '/utils/util.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'topup_model.dart';
export 'topup_model.dart';

class TopupWidget extends StatefulWidget {
  const TopupWidget({super.key});

  @override
  State<TopupWidget> createState() => _TopupWidgetState();
}

class _TopupWidgetState extends State<TopupWidget> {
  late TopupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopupModel());

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
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 21.0, 16.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add money',
                  style: FFTheme.of(context).headlineMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 30.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 70.0, 16.0, 0.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FFTheme.of(context).primaryBackground,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_card,
                            color: FFTheme.of(context).primary,
                            size: 30.0,
                          ),
                          RichText(
                            textScaler: MediaQuery.of(context).textScaler,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Balance: ',
                                  style: FFTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FFTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                TextSpan(
                                  text: formatNumber(
                                    valueOrDefault(
                                        currentUserDocument?.balance, 0),
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                    currency: '€',
                                  ),
                                  style: TextStyle(
                                    color: FFTheme.of(context)
                                        .secondaryText,
                                    fontSize: 12.0,
                                  ),
                                )
                              ],
                              style: FFTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CarouselSlider(
                                items: [
                                  wrapWithModel(
                                    model: _model.topupAmountWidgetModel1,
                                    updateCallback: () => setState(() {}),
                                    child: const TopupAmountWidgetWidget(
                                      amount: 5,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.topupAmountWidgetModel2,
                                    updateCallback: () => setState(() {}),
                                    child: const TopupAmountWidgetWidget(
                                      amount: 10,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.topupAmountWidgetModel3,
                                    updateCallback: () => setState(() {}),
                                    child: const TopupAmountWidgetWidget(
                                      amount: 15,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.topupAmountWidgetModel4,
                                    updateCallback: () => setState(() {}),
                                    child: const TopupAmountWidgetWidget(
                                      amount: 20,
                                    ),
                                  ),
                                  wrapWithModel(
                                    model: _model.topupAmountWidgetModel5,
                                    updateCallback: () => setState(() {}),
                                    child: const TopupAmountWidgetWidget(
                                      amount: 25,
                                    ),
                                  ),
                                ],
                                carouselController:
                                    _model.carouselController ??=
                                        CarouselController(),
                                options: CarouselOptions(
                                  initialPage: 0,
                                  viewportFraction: 1.0,
                                  disableCenter: true,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.25,
                                  enableInfiniteScroll: false,
                                  scrollDirection: Axis.vertical,
                                  autoPlay: false,
                                  onPageChanged: (index, _) =>
                                      _model.carouselCurrentIndex = index,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 4.0),
                          child: FaIcon(
                            FontAwesomeIcons.arrowsAltV,
                            color: FFTheme.of(context).primaryText,
                            size: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                  child: Text(
                    '*Minimum amount is €5',
                    style: FFTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FFTheme.of(context).secondaryText,
                          fontSize: 9.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(12.0, 36.0, 12.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FFTheme.of(context).primary,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4.0,
                          color: FFTheme.of(context).widgetShadow,
                          offset: const Offset(
                            0.0,
                            2.0,
                          ),
                          spreadRadius: 4.0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        final paymentResponse = await processStripePayment(
                          context,
                          amount: (5 * (_model.carouselCurrentIndex + 1)) * 100,
                          currency: 'EUR',
                          customerEmail: currentUserEmail,
                          customerName: 'ParkIT',
                          description: 'Parking balance',
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

                        if (_model.paymentId != null &&
                            _model.paymentId != '') {
                          unawaited(
                            () async {
                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'balance': FieldValue.increment(
                                        5 * (_model.carouselCurrentIndex + 1)),
                                  },
                                ),
                              });
                            }(),
                          );
                          context.safePop();
                        } else {
                          context.safePop();
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
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 10.0),
                            child: Text(
                              'Add money securely',
                              style: FFTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                  ),
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
    );
  }
}
