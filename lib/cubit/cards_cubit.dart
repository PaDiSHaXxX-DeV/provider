import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider_part_one/cubit/card_state.dart';
import 'package:provider_part_one/data/my_response/my_response.dart';
import 'package:provider_part_one/data/repositories/My_repository_card.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit(this.cards_repo) : super(InitialAlbumState()) {
      fetchAllCards();
  }

  final Cards_Repo cards_repo;

  fetchAllCards() async {
    //loading
    emit(LoadAlbumsInProgress());
    MyResponse myResponse = await cards_repo.getAllCards();
    if (myResponse.error.isEmpty) {
      //success
      emit(LoadAlbumsInSuccess(cards: myResponse.data));
    } else {
      //error
      emit(LoadAlbumsInFailure(errorText: myResponse.error));
    }
  }
}
