import 'dart:async';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial(0));

  void onTimerStartTimeChange(int newStartTime) {
    emit(TimerInitial(newStartTime));
  }

  void _playRandomSongAfterTimerFinished() {
    Random _random = new Random();
    int randValue = _random.nextInt(40) + 1;
    AssetsAudioPlayer.newPlayer().open(
      Audio("assets/sounds/$randValue.mp3"),
      autoStart: true,
    );
  }

  void timerTicks(Timer timer) {
    if (state.isInitial && !state.isCountingDown) {
      if (timer.isActive) {
        timer.cancel();
      }
      return;
    }
    emit(TimerCountingDown.decrease(state.countingDown));
    if (state.countingDown.progress == 0) {
      _playRandomSongAfterTimerFinished();
      timer.cancel();
      emit(TimerInitial(0));
    }
  }

  void onStartTimer() {
    emit(
      TimerCountingDown.initialise(
        state as TimerInitial,
      ),
    );
  }

  void onCancelTimer() {
    emit(TimerInitial(0));
  }

}
