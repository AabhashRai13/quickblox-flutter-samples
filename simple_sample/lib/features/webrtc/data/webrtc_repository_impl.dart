import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:quickblox_sdk_example/app/dependency/webrtc_external_interface.dart';
import 'package:quickblox_sdk_example/app/di.dart';
import 'package:quickblox_sdk_example/features/webrtc/domain/webrtc_repository.dart';

class WebRtcRepositoryImpl implements WebRtcRepository {
  final WebRtcExternalInterface _webRtcExternalInterface =
      instance<WebRtcExternalInterface>();
  @override
  Future<void> initWebRTC() async {
    try {
      await _webRtcExternalInterface.initWebRTC();
    } on PlatformException catch (e) {
      log("error with WebRtc initialiazation $e");
    }
  }
}
