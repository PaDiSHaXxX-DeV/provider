import 'package:provider_part_one/data/api_service/api_service.dart';
import 'package:provider_part_one/data/my_response/my_response.dart';

class Cards_Repos {
  Cards_Repos({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getSingleCardById(int id) =>
      apiService.getSingleCardById(id);

  Future<MyResponse> getAllCards() => apiService.getAllCards();
}
