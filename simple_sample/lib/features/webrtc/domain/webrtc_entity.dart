class WebRtcEntity {
  final bool initialized;
  WebRtcEntity({this.initialized = false});

  WebRtcEntity copyWith({bool? initialized}) {
    return WebRtcEntity(initialized: initialized ?? this.initialized);
  }
}
