import 'package:cesarFlutter/app/pages/home/tabs/home_tab_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'helpers/mocked_service.dart';

void main() {
  test("Initial values", () {
    var service = MockedService();
    var viewModel = HomeTabViewModel(service: service);

    expect(viewModel.didUpdate, null);
    expect(viewModel.service, service);

    expect(viewModel.adapter.featuredTrack, "Featured Tracks");
    expect(viewModel.adapter.topTrack, "Top Tracks");
    expect(viewModel.adapter.isLoading, false);
    
    expect(viewModel.adapter.inError, false);
  });

  test("Is in Loading State", () async {
    var service = MockedService(type: MockType.filled);
    var viewModel = HomeTabViewModel(service: service);

    var counter = 0; // quantity of times `adapter.isLoading` is TRUE
    viewModel.didUpdate = (adapter) {
      if (adapter.isLoading) {
        counter++;
      }
    };

    await viewModel.fetchAlbums();
    expect(counter, 1);
  });

  test("Is not in Loading State", () async {
    var service = MockedService(type: MockType.filled);
    var viewModel = HomeTabViewModel(service: service);

    var counter = 0; // quantity of times `adapter.isLoading` is FALSE
    viewModel.didUpdate = (adapter) {
      if (!adapter.isLoading) {
        counter++;
      }
    };

    await viewModel.fetchAlbums();
    expect(counter, 1);
  });

  test("Albums for `filled` state without `didUpdate`", () async {
    var service = MockedService(type: MockType.filled);
    var viewModel = HomeTabViewModel(service: service);

    await viewModel.fetchAlbums();
    expect(viewModel.adapter.albums.length, 3);
  });

  test("Albums for `filled` state with `didUpdate`", () async {
    var service = MockedService(type: MockType.filled);
    var viewModel = HomeTabViewModel(service: service);
    var counter = 0;

    viewModel.didUpdate = (adapter) {
      if (adapter.albums.isNotEmpty) {
        counter++;
      }
    };

    await viewModel.fetchAlbums();
    expect(counter, 1);
  });

  test("Albums for `filled` state multiple times with `didUpdate`",
      () async {
    var service = MockedService(type: MockType.filled);
    var viewModel = HomeTabViewModel(service: service);
    var counter = 0;

    viewModel.didUpdate = (adapter) {
      if (adapter.albums.isNotEmpty) {
        counter++;
      }
    };

    await viewModel.fetchAlbums();
    expect(counter, 1);

    await viewModel.fetchAlbums();
    expect(counter, 3);
  });

  test("Albums for `empty` state without `didUpdate`", () async {
    var service = MockedService(type: MockType.empty);
    var viewModel = HomeTabViewModel(service: service);

    await viewModel.fetchAlbums();
    expect(viewModel.adapter.albums.length, 0);
  });

  test("Albums for `empty` state with `didUpdate`", () async {
    var service = MockedService(type: MockType.empty);
    var viewModel = HomeTabViewModel(service: service);
    var counter = 0;

    viewModel.didUpdate = (adapter) {
      if (adapter.albums.isEmpty) {
        counter++;
      }
    };

    await viewModel.fetchAlbums();
    expect(counter, 2);
  });

  test("Albums for `empty` state multiple times with `didUpdate`",
      () async {
    var service = MockedService(type: MockType.empty);
    var viewModel = HomeTabViewModel(service: service);
    var counter = 0;

    viewModel.didUpdate = (adapter) {
      if (adapter.albums.isEmpty) {
        counter++;
      }
    };

    await viewModel.fetchAlbums();
    expect(counter, 2);

    await viewModel.fetchAlbums();
    expect(counter, 4);
  });

  test("Bad Request error", () async {
    var service = MockedService(type: MockType.badRequestError);
    var viewModel = HomeTabViewModel(service: service);
    var counter = 0;

    viewModel.didUpdate = (adapter) {
      if (adapter.inError) {
        counter++;
      }
    };

    await viewModel.fetchAlbums();
    expect(counter, 1);
  });

  test("Internal Server error", () async {
    var service = MockedService(type: MockType.internalServerError);
    var viewModel = HomeTabViewModel(service: service);
    var counter = 0;

    viewModel.didUpdate = (adapter) {
      if (adapter.inError) {
        counter++;
      }
    };

    await viewModel.fetchAlbums();
    expect(counter, 1);
  });

  test("Unauthorized error", () async {
    var service = MockedService(type: MockType.unauthorizedError);
    var viewModel = HomeTabViewModel(service: service);
    var counter = 0;

    viewModel.didUpdate = (adapter) {
      if (adapter.inError) {
        counter++;
      }
    };

    await viewModel.fetchAlbums();
    expect(counter, 1);
  });
}