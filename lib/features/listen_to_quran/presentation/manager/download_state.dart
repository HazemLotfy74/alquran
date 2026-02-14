part of 'download_cubit.dart';

sealed class DownloadState {}

class DownloadInitial extends DownloadState {}

class Downloading extends DownloadState {
  final double progress;
  final int total;
  Downloading({required this.progress, required this.total});
}

class DownloadFailed extends DownloadState {
  final String errMsg;
  DownloadFailed({required this.errMsg});
}

class DownloadSuccess extends DownloadState {
  final String fileName;
  DownloadSuccess({required this.fileName});
}
