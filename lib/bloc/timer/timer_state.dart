part of 'timer_cubit.dart';

sealed class TimerState extends Equatable {
  const TimerState();

  bool get isInitial => this is TimerInitial;

  bool get isCountingDown => this is TimerCountingDown;

  TimerInitial get initial => this as TimerInitial;

  TimerInitial? get initialOrNull => isInitial ? initial : null;

  TimerCountingDown get countingDown => this as TimerCountingDown;

  TimerCountingDown? get countingDownOrNull => isCountingDown ? countingDown : null;

  @override
  List<Object> get props => [];
}

final class TimerInitial extends TimerState {
  final int startTime;

  const TimerInitial(this.startTime);

  @override
  List<Object> get props => [startTime];
}

final class TimerCountingDown extends TimerInitial {
  final int progress;

  TimerCountingDown(this.progress, TimerInitial prevState)
      : super(prevState.startTime);

  factory TimerCountingDown.decrease(TimerCountingDown prevState) {
    return TimerCountingDown(prevState.progress - 1, prevState);
  }
  factory TimerCountingDown.initialise(TimerInitial prevState) {
    return TimerCountingDown(prevState.startTime, prevState);
  }
  @override
  List<Object> get props => [startTime, progress];
}
