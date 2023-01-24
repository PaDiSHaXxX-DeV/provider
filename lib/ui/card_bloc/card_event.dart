

abstract class CardEvent {}

class FetchAllCards extends CardEvent {}

class FetchSingleCards extends CardEvent {
  FetchSingleCards({required this.id});

  final int id;
}