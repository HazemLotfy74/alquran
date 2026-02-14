part of 'audio_cubit.dart';

class AudioState {
  final bool isPlaying;
  final bool isRepeat;
  final Duration position;
  final Duration total;

  AudioState({
    required this.isPlaying,
    required this.position,
    required this.total,
    required this.isRepeat,
  });

  AudioState copyWith({
    bool? isPlaying,
    Duration? position,
    Duration? total,
    bool? isRepeat,
  }) {
    return AudioState(
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
      total: total ?? this.total,
      isRepeat: isRepeat ?? this.isRepeat,
    );
  }
}

class AudioFailed extends AudioState {
  AudioFailed({
    required super.isPlaying,
    required super.position,
    required super.total,
    required this.errMsg,
    required super.isRepeat,
  });
  final String errMsg;
}
