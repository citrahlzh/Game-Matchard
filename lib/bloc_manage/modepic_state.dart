part of 'modepic_bloc.dart';

class ModePicState extends Equatable {
  final List<String> cards;
  final List<bool> flippedCards;
  final int selectedIndex1;
  final int selectedIndex2;
  final int score;
  final int remainingTime;
  final bool isGameSuccess;
  final bool isGameFailed;

  const ModePicState({
    required this.cards,
    required this.flippedCards,
    this.selectedIndex1 = -1,
    this.selectedIndex2 = -1,
    this.score = 0,
    this.remainingTime = 180,
    this.isGameSuccess = false,
    this.isGameFailed = false,
  });

  factory ModePicState.initial() {
    return const ModePicState(
      cards: [],
      flippedCards: [],
      selectedIndex1: -1,
      selectedIndex2: -1,
      score: 0,
      remainingTime: 180,
      isGameSuccess: false,
      isGameFailed: false,
    );
  }

  ModePicState copyWith({
    List<String>? cards,
    List<bool>? flippedCards,
    int? selectedIndex1,
    int? selectedIndex2,
    int? score,
    int? remainingTime,
    bool? isGameSuccess,
    bool? isGameFailed,
  }) {
    return ModePicState(
      cards: cards ?? this.cards,
      flippedCards: flippedCards ?? this.flippedCards,
      selectedIndex1: selectedIndex1 ?? this.selectedIndex1,
      selectedIndex2: selectedIndex2 ?? this.selectedIndex2,
      score: score ?? this.score,
      remainingTime: remainingTime ?? this.remainingTime,
      isGameSuccess: isGameSuccess ?? this.isGameSuccess,
      isGameFailed: isGameFailed ?? this.isGameFailed,
    );
  }

  @override
  List<Object> get props => [
        cards,
        flippedCards,
        selectedIndex1,
        selectedIndex2,
        score,
        remainingTime,
        isGameSuccess,
        isGameFailed,
      ];
}
