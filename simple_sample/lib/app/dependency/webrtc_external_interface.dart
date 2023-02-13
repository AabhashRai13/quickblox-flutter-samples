import 'package:quickblox_sdk/quickblox_sdk.dart';

class WebRtcExternalInterface {
  final QB _qb;

  WebRtcExternalInterface({QB? qb}) : _qb = qb ?? QB();
  Future<void> initWebRTC() async {
    await QB.webrtc.init();
  }
}
