part of 'modeflag_bloc.dart';

abstract class ModeFlagEvent extends Equatable {
  const ModeFlagEvent();

  @override
  List<Object> get props => [];
}

class InitializeFlagGameEvent extends ModeFlagEvent {}

class FlipCardEvent extends ModeFlagEvent {
  final int index;

  const FlipCardEvent(this.index);

  @override
  List<Object> get props => [index];
}
