import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/home/contents/settings/models/darkmode_config_model.dart';
import 'package:twitter_clone/home/contents/settings/repos/darkmode_config_repo.dart';

class DarkModeConfigViewModel extends Notifier<DarkModeConfigModel> {
  final DarkModeConfigRepository _repository;

  DarkModeConfigViewModel(this._repository);

  void enableDarkMode(bool value) {
    _repository.enableDarkMode(value);
    state = DarkModeConfigModel(darkmode: value);
  }

  @override
  DarkModeConfigModel build() {
    return DarkModeConfigModel(
      darkmode: _repository.isDarkMode(),
    );
  }
}

final darkmodeConfigProvider =
    NotifierProvider<DarkModeConfigViewModel, DarkModeConfigModel>(
  () => throw UnimplementedError(),
);
