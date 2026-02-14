import 'dart:async';

import 'package:alquran/core/cubits/quran_cubit/quran_cubit.dart';
import 'package:alquran/core/services/audio_service.dart';
import 'package:alquran/features/listen_to_quran/domain/repo/audio_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  AudioCubit({
    required this.audioRepo,
    required this.audioService,
    required this.quranCubit,
  }) : super(
         AudioState(
           isPlaying: false,
           position: Duration.zero,
           total: Duration.zero,
           isRepeat: false,
         ),
       ) {
    _playerSub = audioService.playerState.listen((event) {
      if (audioService.player.processingState != ProcessingState.completed) {
        emit(state.copyWith(isPlaying: event.playing));
      }
    });
    _durSub = audioService.durationStream.listen((duration) {
      if (duration != null) {
        emit(state.copyWith(total: duration));
      }
    });
    _posSub = audioService.positionStream.listen((position) {
      currentPosition = position;
      emit(state.copyWith(position: currentPosition));
    });
    audioService.player.processingStateStream.listen((event) {
      if (event == ProcessingState.completed) {
        handleAudioCompleted();
      }
    });
  }
  late final StreamSubscription _posSub;
  late final StreamSubscription _durSub;
  late final StreamSubscription _playerSub;

  final AudioRepo audioRepo;
  final AudioService audioService;
  final QuranCubit quranCubit;
  String? currentUrl;
  int reciterID = 2;

  Duration currentPosition = Duration.zero;

  Future<void> getAudio({required int surahNumber, int? recId}) async {
    final res = await audioRepo.getAudio(
      surahNumber: surahNumber,
      reciterID: recId ?? reciterID,
    );
    res.fold(
      (fail) {
        emit(
          AudioFailed(
            isPlaying: false,
            position: Duration.zero,
            total: Duration.zero,
            errMsg: fail.message,
            isRepeat: false,
          ),
        );
      },
      (url) {
        currentUrl = url;
        playAudio(url: url);
      },
    );
  }

  void playAudio({required String url}) async {
    await audioService.stop();
    await audioService.playAudioUrl(url);
  }

  void pauseAudio() {
    audioService.pause();
  }

  void resumeAudio() {
    audioService.resume();
  }

  Future<void> handleAudioCompleted() async {
    if (state.isRepeat && currentUrl != null) {
      await audioService.stop();
      await audioService.playAudioUrl(currentUrl!);
      return;
    }
    final next = quranCubit.nextSurah;

    if (next != null) {
      quranCubit.selectSurah(next);

      await getAudio(surahNumber: next.number);

      return;
    }

    await audioService.seek(Duration.zero);

    emit(state.copyWith(isPlaying: false, position: Duration.zero));
  }

  Future<void> playFromCurrent() async {
    final processingState = audioService.player.processingState;

    if (processingState == ProcessingState.completed) {
      emit(state.copyWith(isPlaying: false, position: Duration.zero));

      if (currentUrl != null) {
        await audioService.stop();
        await audioService.playAudioUrl(currentUrl!);
        return;
      }
    }
    audioService.resume();
  }

  void toggleRepeat() {
    emit(state.copyWith(isRepeat: !state.isRepeat));
  }

  @override
  Future<void> close() async {
    await audioService.stop();
    _posSub.cancel();
    _durSub.cancel();
    _playerSub.cancel();
    audioService.dispose();
    return super.close();
  }
}
