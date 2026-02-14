part of 'azkar_audio_cubit.dart';

sealed class AzkarAudioState {}

final class AzkarAudioInitial extends AzkarAudioState {}

final class AzkarAudioPlaying extends AzkarAudioState {}

final class AzkarAudioPause extends AzkarAudioState {}

final class AzkarAudioFailed extends AzkarAudioState {}
