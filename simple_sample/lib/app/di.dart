import 'package:get_it/get_it.dart';
import 'package:quickblox_sdk_example/presentation/bloc/webrtc_bloc.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  //blocs

  instance.registerFactory<WebrtcBloc>(() => WebrtcBloc());
}
