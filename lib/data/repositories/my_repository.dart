
import 'package:provider/data/api_service/api_service.dart';
import 'package:provider/data/local_db/local_db.dart';
import 'package:provider/data/models/user_data.dart';

class MyRepository {
  MyRepository({
    required ApiService apiService,
    required LocalDatabase localDatabase,
  }) {
    _apiService = apiService;
    _localDatabase = localDatabase;
  }

  late ApiService _apiService;
  late LocalDatabase _localDatabase;

  Future<UserData> getBellaInfo() => _apiService.getUserData();
}
