import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:math';
import '../application/card_pic.dart';

part 'modepic_state.dart';
part 'modepic_event.dart';

class ModePicBloc extends Bloc<ModePicEvent, ModePicState> {
  static const int _timelimite = 180;
  late Timer time;
  int _start = _timelimite;

  ModePicBloc() : super(const ModePicState(cards: [], flippedCards: [])) {
    on<InitializePicGameEvent>(_onInitializeGame);
    on<FlipCardEvent>(_onFlipCard);
  }

  Future<void> _onInitializeGame(
      InitializePicGameEvent event, Emitter<ModePicState> emit) async {
    final shuffledCards = cardPictures..shuffle(Random());
    final flippedCards = List<bool>.filled(shuffledCards.length, false);

    List<String> shuffledCardPaths =
        shuffledCards.map((card) => card.imagePath).toList();

    // Initialize the state before starting the timer
    emit(ModePicState(
      cards: shuffledCardPaths,
      flippedCards: flippedCards,
    ));

    _timer();
    // Initialize and start the timer
  }

  void _timer() {
    time = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start >= 0) {
        _start--;
        emit(state.copyWith(remainingTime: _start));
        if (state.score == cardPictures.length ~/ 2) {
          emit(state.copyWith(isGameSuccess: true));
        }
      } else {
        timer.cancel();
        if (!isClosed) {
          _onTimeExpired();
        }
      }
    });
  }

  void _onTimeExpired() {
    if (state.score == cardPictures.length ~/ 2) {
      print("Permainan selesai dengan sukses!");
    } else {
      emit(state.copyWith(isGameFailed: true));
      print("Waktu habis! Permainan gagal.");
    }
  }

  Future<void> _onFlipCard(
      FlipCardEvent event, Emitter<ModePicState> emit) async {
    if (state.flippedCards[event.index] || state.selectedIndex2 != -1) return;

    final updatedFlippedCards = List<bool>.from(state.flippedCards);
    updatedFlippedCards[event.index] = true;

    if (state.selectedIndex1 == -1) {
      emit(state.copyWith(
          flippedCards: updatedFlippedCards, selectedIndex1: event.index));
    } else {
      final selectedIndex1 = state.selectedIndex1;
      final selectedCard1 = cardPictures[selectedIndex1];
      final selectedCard2 = cardPictures[event.index];

      emit(state.copyWith(
        flippedCards: updatedFlippedCards,
        selectedIndex2: event.index,
      ));

      if (selectedCard1.matchKey == selectedCard2.matchKey) {
        emit(state.copyWith(
          score: state.score + 1,
          selectedIndex1: -1,
          selectedIndex2: -1,
        ));
        print("Kartu cocok! Skor sekarang: ${state.score + 1}");
      } else {
        await Future.delayed(const Duration(seconds: 1));
        if (!isClosed) {
          updatedFlippedCards[selectedIndex1] = false; // Balik kartu pertama
          updatedFlippedCards[event.index] = false; // Balik kartu kedua
          emit(state.copyWith(
            flippedCards: updatedFlippedCards,
            selectedIndex1: -1,
            selectedIndex2: -1,
          ));
          print("Kartu tidak cocok, membalik kembali...");
        }
      }
    }
  }

  @override
  Future<void> close() {
    time.cancel();
    return super.close();
  }
}
