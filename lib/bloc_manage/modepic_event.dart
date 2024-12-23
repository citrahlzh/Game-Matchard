part of 'modepic_bloc.dart';

abstract class ModePicEvent extends Equatable {
  const ModePicEvent();

  @override
  List<Object> get props => [];
}

class InitializePicGameEvent extends ModePicEvent {}

class FlipCardEvent extends ModePicEvent {
  final int index;

  const FlipCardEvent(this.index);

  @override
  List<Object> get props => [index];
}
