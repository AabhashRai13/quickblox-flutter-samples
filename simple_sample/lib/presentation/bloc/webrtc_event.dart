part of 'webrtc_bloc.dart';

@immutable
abstract class WebrtcEvent extends Equatable {}

class InitializeWebRTC extends WebrtcEvent {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final BuildContext context;
  InitializeWebRTC({required this.scaffoldKey, required this.context});

  @override
  List<Object> get props => [scaffoldKey];
}
