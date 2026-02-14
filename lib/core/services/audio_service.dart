import 'package:just_audio/just_audio.dart';

class AudioService {
  final AudioPlayer player = AudioPlayer();

  Future<void> playAudioUrl(String audioUrl) async {
    final sources = AudioSource.uri(Uri.parse(audioUrl));

    await player.setAudioSource(sources);

    player.play();
  }

  Future<void> playLocalAudio(String audioPath) async {
    await player.setFilePath(audioPath);
    player.play();
  }

  void pause() => player.pause();

  void resume() => player.play();

  Future<void> stop() async => player.stop();

  void dispose() => player.dispose();

  Stream<PlayerState> get playerState => player.playerStateStream;

  Stream<Duration?> get durationStream => player.durationStream;

  Stream<Duration> get positionStream => player.positionStream;

  Future<void> seek(Duration position) async {
    await player.seek(position);
  }
}
