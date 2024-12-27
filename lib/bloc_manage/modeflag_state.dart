part of 'modeflag_bloc.dart';

class ModeFlagState extends Equatable {
  final List<String> cards;
  final List<String> texts;
  final List<bool> flippedCards;
  final int selectedIndex1;
  final int selectedIndex2;
  final int score;
  final int remainingTime;
  final bool isGameSuccess;
  final bool isGameFailed;
  final Map<String, String> cardPairs;

  const ModeFlagState({
    required this.cards,
    required this.texts,
    required this.flippedCards,
    this.selectedIndex1 = -1,
    this.selectedIndex2 = -1,
    this.score = 0,
    this.remainingTime = 180,
    this.isGameSuccess = false,
    this.isGameFailed = false,
    this.cardPairs = const {},
  });

  factory ModeFlagState.initial() {
    return const ModeFlagState(
      cards: [],
      texts: [],
      flippedCards: [],
      selectedIndex1: -1,
      selectedIndex2: -1,
      score: 0,
      remainingTime: 180,
      isGameSuccess: false,
      isGameFailed: false,
      cardPairs: {},
    );
  }

  ModeFlagState copyWith({
    List<String>? cards,
    List<String>? texts,
    List<bool>? flippedCards,
    int? selectedIndex1,
    int? selectedIndex2,
    int? score,
    int? remainingTime,
    bool? isGameSuccess,
    bool? isGameFailed,
    Map<String, String>? cardPairs,
  }) {
    return ModeFlagState(
      cards: cards ?? this.cards,
      texts: texts ?? this.texts,
      flippedCards: flippedCards ?? this.flippedCards,
      selectedIndex1: selectedIndex1 ?? this.selectedIndex1,
      selectedIndex2: selectedIndex2 ?? this.selectedIndex2,
      score: score ?? this.score,
      remainingTime: remainingTime ?? this.remainingTime,
      isGameSuccess: isGameSuccess ?? this.isGameSuccess,
      isGameFailed: isGameFailed ?? this.isGameFailed,
      cardPairs: cardPairs ?? this.cardPairs,
    );
  }

  @override
  List<Object> get props => [
        cards,
        texts,
        flippedCards,
        selectedIndex1,
        selectedIndex2,
        score,
        remainingTime,
        isGameSuccess,
        isGameFailed,
        cardPairs
      ];
}
