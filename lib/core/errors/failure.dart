abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}

class DownloadFailure extends Failure {
  DownloadFailure(super.message);
}
