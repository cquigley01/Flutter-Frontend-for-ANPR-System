import '/dashwidgets/topup_amount_widget/topup_amount_widget_widget.dart';
import '/utils/util.dart';
import 'topup_widget.dart' show TopupWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TopupModel extends FFModel<TopupWidget> {

  // State field(s) for Carousel widget.
  CarouselController? carouselController;

  int carouselCurrentIndex = 0;

  // Model for TopupAmountWidget component.
  late TopupAmountWidgetModel topupAmountWidgetModel1;
  // Model for TopupAmountWidget component.
  late TopupAmountWidgetModel topupAmountWidgetModel2;
  // Model for TopupAmountWidget component.
  late TopupAmountWidgetModel topupAmountWidgetModel3;
  // Model for TopupAmountWidget component.
  late TopupAmountWidgetModel topupAmountWidgetModel4;
  // Model for TopupAmountWidget component.
  late TopupAmountWidgetModel topupAmountWidgetModel5;
  // Stores action output result for [Stripe Payment] action in Row widget.
  String? paymentId;

  @override
  void initState(BuildContext context) {
    topupAmountWidgetModel1 =
        createModel(context, () => TopupAmountWidgetModel());
    topupAmountWidgetModel2 =
        createModel(context, () => TopupAmountWidgetModel());
    topupAmountWidgetModel3 =
        createModel(context, () => TopupAmountWidgetModel());
    topupAmountWidgetModel4 =
        createModel(context, () => TopupAmountWidgetModel());
    topupAmountWidgetModel5 =
        createModel(context, () => TopupAmountWidgetModel());
  }

  @override
  void dispose() {
    topupAmountWidgetModel1.dispose();
    topupAmountWidgetModel2.dispose();
    topupAmountWidgetModel3.dispose();
    topupAmountWidgetModel4.dispose();
    topupAmountWidgetModel5.dispose();
  }
}
