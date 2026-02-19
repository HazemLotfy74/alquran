import 'package:alquran/features/qibla/domain/entities/qibla_entity.dart';

abstract class QiblaState {
  const QiblaState();
}

class QiblaInitial extends QiblaState {
  const QiblaInitial();
}

class QiblaLoading extends QiblaState {
  const QiblaLoading();
}

class QiblaLoaded extends QiblaState {
  final QiblaEntity qibla;

  QiblaLoaded(this.qibla);
}

class QiblaError extends QiblaState {
  final String message;
  const QiblaError(this.message);
}
