import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quickblox_sdk/quickblox_sdk.dart';
import 'package:quickblox_sdk_example/utils/dialog_utils.dart';
import 'package:quickblox_sdk_example/utils/snackbar_utils.dart';

part 'webrtc_event.dart';
part 'webrtc_state.dart';

class WebrtcBloc extends Bloc<WebrtcEvent, WebrtcState> {
  WebrtcBloc() : super(WebrtcInitial()) {
    on<WebrtcEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<InitializeWebRTC>(_initWebRTC);
  }

  Future<void> _initWebRTC(
      InitializeWebRTC event, Emitter<WebrtcState> emit) async {
    try {
      await QB.webrtc.init();
      SnackBarUtils.showResult(event.scaffoldKey, "WebRTC was initiated");
    } on PlatformException catch (e) {
      DialogUtils.showError(event.context, e);
    }
  }
}
