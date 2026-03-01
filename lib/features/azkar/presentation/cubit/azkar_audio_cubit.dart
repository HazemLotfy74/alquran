import 'package:alquran/core/services/audio_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'azkar_audio_state.dart';

class AzkarAudioCubit extends Cubit<AzkarAudioState> {
  AzkarAudioCubit(this.audioService) : super(AzkarAudioInitial());
  final AudioService audioService;

  String? currentUrl;

  Future<void> toggle(String url) async {
    if (state is AzkarAudioPlaying) {
      audioService.pause();
      emit(AzkarAudioPause());
      return;
    }

    if (state is AzkarAudioPause && currentUrl == url) {
      audioService.resume();
      emit(AzkarAudioPlaying());
      return;
    }

    currentUrl = url;
    await audioService.playAudioUrl(url);
    emit(AzkarAudioPlaying());
  }

  Future<void> pauseAudio() async {
    audioService.pause();
    emit(AzkarAudioPause());
  }

  Future<void> resumeAudio() async {
    audioService.resume();
    emit(AzkarAudioPlaying());
  }

  Future<void> stopAudio() async {
    audioService.stop();
    emit(AzkarAudioPause());
  }

  @override
  Future<void> close() async {
    await audioService.stop();
    audioService.dispose();
    return super.close();
  }
}
