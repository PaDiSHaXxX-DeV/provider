import 'package:provider_part_one/data/models/Card_model.dart';

abstract class CardState {}

class InitialAlbumState extends CardState {}

// -------  Fetch All Albums States ------
class LoadAlbumsInProgress extends CardState {}

class LoadAlbumsInSuccess extends CardState {
  LoadAlbumsInSuccess({required this.cards});

  final List<UsersCardsModel> cards;
}

class LoadAlbumsInFailure extends CardState {
  LoadAlbumsInFailure({required this.errorText});

  final String errorText;
}


// ------- Fetch Single Album States ------

// class LoadAlbumInProgress extends CardState {}
//
// class LoadAlbumInSuccess extends CardState {
//   LoadAlbumInSuccess({required this.cardModel});
//
//   //final CardModel cardModel;
// }
//
// class LoadAlbumInFailure extends CardState {
//   LoadAlbumInFailure({required this.errorText});
//
//   final String errorText;
// }
