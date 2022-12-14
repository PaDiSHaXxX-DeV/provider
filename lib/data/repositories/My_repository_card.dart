
import 'package:provider_part_one/data/api_service/Service.dart';
import 'package:provider_part_one/data/local_db/local_db.dart';
import 'package:provider_part_one/data/models/Card_model.dart';

class MyRepository_card {
  MyRepository_card({
    required ApiService_card apiService,
    required LocalDatabase localDatabase,
  }) {
    _apiService = apiService;
    _localDatabase = localDatabase;
  }

  late ApiService_card _apiService;
  late LocalDatabase _localDatabase;

  Future<List<CardModel>> getBellaInfo() => _apiService.getUserData();
}
