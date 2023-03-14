


import 'package:bank_mas_rewrite/domain/core/utils/snackbar.util.dart';
import 'package:bank_mas_rewrite/domain/model/home_response_model.dart';
import 'package:bank_mas_rewrite/domain/repository/home_repository.dart';
import 'package:bank_mas_rewrite/infrastructure/data/services/home_service.dart';
import 'package:bank_mas_rewrite/presentation/home/controllers/home.controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mockito/mockito.dart';

class MockHomeRepository extends Mock implements HomeRepository {
  @override
  Future<HomeResponseModel> getHomeContent() {
    // TODO: implement getHomeContent
    throw UnimplementedError();
  }
}

class MockHomeService extends Mock implements HomeService {}

void main() {
  group('HomeController', () {
    late HomeRepository homeRepository;
    late HomeController homeController;
    late MockHomeService mockHomeService;

    setUp(() {
      Get.put(GetConnect());
      mockHomeService = MockHomeService();
      homeRepository = HomeRepository(homeService: mockHomeService);
      homeController = HomeController(homeRepository: homeRepository);
      Get.testMode = true;
    });

    test('should update state with HomeResponseModel when successful',
            () async {
          // arrange
          final homeResponseModel = HomeResponseModel(
            data: [
              HomeData(
                section: 'section1',
                sectionTitle: 'section1 title',
                items: [
                  Item(
                    link: 'article1 link',
                    productName: 'product1 name',
                    productImage: 'product1 image',
                  ),
                  Item(
                    articleTitle: 'article1 title',
                    articleImage: 'article1 image',
                    link: 'article1 link',
                  ),
                ],
              ),
            ],
          );

          when(() => mockHomeService.fetchHomeContent())
              .thenAnswer((_) => () async => homeResponseModel);

          // act
          await homeController.getHomeContent();

          // assert
          expect(homeController.status, RxStatus.success());
          expect(homeController.state, homeResponseModel);
        });

    test('should update state with error message when failed', () async {
      // arrange
      const errorMessage = 'Error message';
      // final _homeService = homeService as MockHomeService;
      when(() => mockHomeService.fetchHomeContent())
          .thenAnswer((_) => () async => throw Exception(errorMessage));

      // act
      await homeController.getHomeContent();

      // assert
      expect(homeController.status, RxStatus.error(errorMessage));
      expect(homeController.state, null);
      verify(() => SnackbarUtil.showError(message: errorMessage)).called(1);
    });

    tearDown(() {
      Get.delete<HomeRepository>();
    });
  });
}
