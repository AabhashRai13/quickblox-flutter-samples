import 'package:flutter/services.dart';
import 'package:quickblox_sdk_example/app/dependency/webrtc_external_interface.dart';
import 'package:quickblox_sdk_example/app/di.dart';

class WebRtcGateWay {
  final WebRtcExternalInterface _webRtcExternalInterface =
      instance<WebRtcExternalInterface>();
  Future<void> initWebRTC() async {
    try {
      await _webRtcExternalInterface.initWebRTC();
      // SnackBarUtils.showResult(event.scaffoldKey, "WebRTC was initiated");
    } on PlatformException catch (e) {
      //  DialogUtils.showError(event.context, e);
    }
  }
}
