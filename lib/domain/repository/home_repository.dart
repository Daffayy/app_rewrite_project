import '../../infrastructure/data/services/home_service.dart';
import '../model/home_response_model.dart';

class HomeRepository {
  final HomeService _homeService;

  HomeRepository({
    required HomeService homeService,
  }) : _homeService = homeService;

  Future<HomeResponseModel> getHomeContent() async {
    try {
      final response = await _homeService.fetchHomeContent();
      return response;
    } catch (err) {
      rethrow;
    }
  }
}
