import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:math';
import '../application/flag_pic.dart';

part 'modeflag_state.dart';
part 'modeflag_event.dart';

class ModeFlagBloc extends Bloc<ModeFlagEvent, ModeFlagState> {
  static const int _timelimite = 180;
  late Timer time;
  int _start = _timelimite;

  ModeFlagBloc()
      : super(const ModeFlagState(cards: [], texts: [], flippedCards: [])) {
    on<InitializeFlagGameEvent>(_onInitializeGame);
    on<FlipCardEvent>(_onFlipCard);
  }

  Future<void> _onInitializeGame(
      InitializeFlagGameEvent event, Emitter<ModeFlagState> emit) async {
    final random = Random();
    final selectedCards = cardFlags.toList()..shuffle(random);
    final nineUniqueCards = selectedCards.take(9).toList();
    final pairedImages = nineUniqueCards.map((card) => card.imagePath).toList();
    final pairedTexts = nineUniqueCards.map((card) => card.matchKey).toList();
    final pairedCards = [...pairedImages, ...pairedTexts]..shuffle(random);

    final Map<String, String> cardPairs = {};
    for (var card in nineUniqueCards) {
      cardPairs[card.imagePath] = card.matchKey;
      cardPairs[card.matchKey] = card.imagePath;
    }

    emit(ModeFlagState(
        cards: pairedCards,
        texts: List<String>.filled(pairedCards.length, ''), // Empty for now
        flippedCards: List<bool>.filled(pairedCards.length, false),
        cardPairs: cardPairs));

    _timer();
  }

  void _timer() {
    time = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start >= 0) {
        _start--;
        emit(state.copyWith(remainingTime: _start));
        if (state.score == cardFlags.length ~/ 2) {
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
    if (state.score == cardFlags.length ~/ 2) {
      print("Permainan selesai dengan sukses!");
    } else {
      emit(state.copyWith(isGameFailed: true));
      print("Waktu habis! Permainan gagal.");
    }
  }

  Future<void> _onFlipCard(
      FlipCardEvent event, Emitter<ModeFlagState> emit) async {
    if (state.flippedCards[event.index] || state.selectedIndex2 != -1) return;

    final updatedFlippedCards = List<bool>.from(state.flippedCards);
    updatedFlippedCards[event.index] = true;

    if (state.selectedIndex1 == -1) {
      emit(state.copyWith(
        flippedCards: updatedFlippedCards,
        selectedIndex1: event.index,
      ));
    } else {
      final selectedIndex1 = state.selectedIndex1;
      final card1 = state.cards[selectedIndex1];
      final card2 = state.cards[event.index];

      print('Kartu pertama: $card1, Kartu kedua: $card2');
      print('Mencocokkan kartu ${state.cardPairs[card1]} dan $card2');

      emit(state.copyWith(
        flippedCards: updatedFlippedCards,
        selectedIndex2: event.index,
      ));

      if (state.cardPairs[card1] == card2) {
        emit(state.copyWith(
          score: state.score + 1,
          selectedIndex1: -1,
          selectedIndex2: -1,
        ));
      } else {
        await Future.delayed(const Duration(seconds: 1));
        if (!isClosed) {
          updatedFlippedCards[selectedIndex1] = false;
          updatedFlippedCards[event.index] = false;
          emit(state.copyWith(
            flippedCards: updatedFlippedCards,
            selectedIndex1: -1,
            selectedIndex2: -1,
          ));
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
