import 'package:get_it/get_it.dart';
import 'package:quickblox_sdk_example/features/webrtc/data/webrtc_repository_impl.dart';
import 'package:quickblox_sdk_example/features/webrtc/domain/webrtc_repository.dart';
import 'package:quickblox_sdk_example/features/webrtc/domain/webrtc_usecase.dart';

import '../features/webrtc/presentation/bloc/webrtc_bloc.dart';
import 'dependency/webrtc_external_interface.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
//dependency
  instance.registerFactory<WebRtcExternalInterface>(
      () => WebRtcExternalInterface());

//repository

  instance
      .registerLazySingleton<WebRtcRepository>(() => WebRtcRepositoryImpl());

  ///usecase
  instance
      .registerLazySingleton<WebRtcUsecase>(() => WebRtcUsecase(instance()));

  //blocs

  instance.registerFactory<WebrtcBloc>(() => WebrtcBloc(instance()));
}
