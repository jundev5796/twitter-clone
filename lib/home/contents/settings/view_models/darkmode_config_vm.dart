import 'package:flutter/widgets.dart';
import 'package:twitter_clone/home/contents/settings/models/darkmode_config_model.dart';
import 'package:twitter_clone/home/contents/settings/repos/darkmode_config_repo.dart';

class DarkModeConfigViewModel extends ChangeNotifier {
  final DarkModeConfigRepository _repository;

  late final DarkModeConfigModel _model = DarkModeConfigModel(
    darkmode: _repository.isDarkMode(),
  );

  DarkModeConfigViewModel(this._repository);

  bool get darkmode => _model.darkmode;

  void enableDarkMode(bool value) {
    _repository.enableDarkMode(value);
    _model.darkmode = value;
    notifyListeners();
  }
}
