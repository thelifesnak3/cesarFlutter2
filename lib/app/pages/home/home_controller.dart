import 'package:cesarFlutter/app/shared/ApiResponse.dart';
import 'package:cesarFlutter/app/shared/repositories/ApiRepository.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  
  final ApiRepository _repository;
  
  _HomeControllerBase(this._repository);

  @observable
  ObservableFuture ofFeaturedAlbums;

  Future<ApiResponse> getAlbums() async {
    return ofFeaturedAlbums = _repository.getAlbums().asObservable();
  }
}