import '/auth/firebase_auth/auth_util.dart';
import '/utils/theme.dart';
import '/utils/util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'profile_icon_widget_model.dart';
export 'profile_icon_widget_model.dart';

class ProfileIconWidgetWidget extends StatefulWidget {
  const ProfileIconWidgetWidget({
    super.key,
    int? width,
    int? height,
    double? textsize,
  })  : width = width ?? 35,
        height = height ?? 35,
        textsize = textsize ?? 14.0;

  final int width;
  final int height;
  final double textsize;

  @override
  State<ProfileIconWidgetWidget> createState() =>
      _ProfileIconWidgetWidgetState();
}

class _ProfileIconWidgetWidgetState extends State<ProfileIconWidgetWidget> {
  late ProfileIconWidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileIconWidgetModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3.0,
          sigmaY: 3.0,
        ),
        child: AuthUserStreamWidget(
          builder: (context) => Container(
            width: widget.width.toDouble(),
            height: widget.height.toDouble(),
            constraints: const BoxConstraints(
              maxWidth: 80.0,
              maxHeight: 80.0,
            ),
            decoration: BoxDecoration(
              color: FFTheme.of(context).transDBBtns,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.network(
                  currentUserPhoto,
                ).image,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(6.0, 6.0, 6.0, 6.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (currentUserPhoto == '')
                    Text(
                      'CM',
                      style: FFTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                            fontSize: widget.textsize,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
