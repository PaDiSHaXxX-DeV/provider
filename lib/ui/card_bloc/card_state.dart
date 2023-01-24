

import 'package:provider_part_one/data/models/Card_model.dart';

abstract class CardBlocState {}

class InitialCardsState extends CardBlocState {}

// -------  Fetch All Albums States ------
class LoadCardsInProgress extends CardBlocState {}

class LoadCardsInSuccess extends CardBlocState {
  LoadCardsInSuccess({required this.albums});

  final List<UsersCardsModel> albums;
}

class LoadCardsInFailure extends CardBlocState {
  LoadCardsInFailure({required this.errorText});

  final String errorText;
}