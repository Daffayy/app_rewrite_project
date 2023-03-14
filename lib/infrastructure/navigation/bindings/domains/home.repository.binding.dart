

import '../../../../domain/repository/home_repository.dart';
import '../../../data/services/home_service.dart';

class HomeRepositoryBinding {
  late HomeRepository _homeRepository;

  HomeRepository get repository => _homeRepository;
  final homeService = HomeService();

  HomeRepositoryBinding() {
    _homeRepository = HomeRepository(
      homeService: homeService,
    );
  }
}
