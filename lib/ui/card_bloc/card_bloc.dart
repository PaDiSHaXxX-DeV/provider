import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_part_one/data/my_response/my_response.dart';
import 'package:provider_part_one/data/repositories/My_reposForBloc.dart';
import 'package:provider_part_one/data/repositories/My_repository_card.dart';
import 'package:provider_part_one/ui/card_bloc/card_event.dart';
import 'package:provider_part_one/ui/card_bloc/card_state.dart';

class CardsBloc extends Bloc<CardEvent, CardBlocState> {
  CardsBloc(this.cards_repo) : super(InitialCardsState()) {
    on<FetchAllCards>(_fetchAllCards);
  }

  final Cards_Repos cards_repo;

  _fetchAllCards(FetchAllCards event, Emitter<CardBlocState> emit) async {
    //loading
    emit(LoadCardsInProgress());
    MyResponse myResponse = await cards_repo.getAllCards();
    if (myResponse.error.isEmpty) {
      //success
      emit(LoadCardsInSuccess(albums: myResponse.data));
    } else {
      //error
      emit(LoadCardsInFailure(errorText: myResponse.error));
    }
  }
}
