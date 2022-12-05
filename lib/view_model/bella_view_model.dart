import 'package:flutter/foundation.dart';
import 'package:provider_part_one/data/models/Card_model.dart';
import 'package:provider_part_one/data/repositories/My_repository_card.dart';

class CardViewModel extends ChangeNotifier {
  CardViewModel({required MyRepository_card myRepository}) {
    _myRepository = myRepository;
  }

  late MyRepository_card _myRepository;

  bool isLoading = false;

 List< CardModel>? userData;

  fetchAllInfo() async {
    notify(true);
    userData = await _myRepository.getBellaInfo();
    notify(false);
  }

  notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
