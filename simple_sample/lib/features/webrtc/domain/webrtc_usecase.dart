import 'package:quickblox_sdk_example/features/webrtc/domain/webrtc_repository.dart';

class WebRtcUsecase {
  final WebRtcRepository _webRtcRepository;
  WebRtcUsecase(this._webRtcRepository);

  Future<void> initWebRTC() async {
    _webRtcRepository.initWebRTC();
  }
}
